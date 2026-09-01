# AGENTS.md

Guide for AI agents working on this Flutter app.

This file is a **portable template** for Flutter projects built with Clean Architecture + Cubit +
GetIt + Dio + Freezed. To reuse it in another project: fill in §1, replace `<package_name>` in the
examples, write §11, and delete whatever does not apply. Everything in between is written to hold for
any project on this stack.

> **Rule of thumb for agents:** when this document and the code disagree, the code wins — copy the
> pattern of the closest existing feature rather than inventing a new one.

---

## 1. Project facts — fill this in

| Item               | Value                                                                                           |
|--------------------|-------------------------------------------------------------------------------------------------|
| App / package name | `<package_name>` — imports use `package:<package_name>/...`                                     |
| Version            | `<version+build from pubspec.yaml>`                                                             |
| Dart SDK           | `<constraint from pubspec.yaml>`                                                                |
| Flavors            | `<e.g. stg, prd — or "none">`                                                                   |
| Env / config       | `<e.g. --dart-define-from-file .env.<flavor>.json, flutter_dotenv, or hardcoded>`               |
| Reference feature  | `<lib/features/<the most complete feature>>` — features: `<list>`                               |
| Localization       | `<languages; ARB template path; generated class name>`                                          |
| Backend clients    | `<base URLs and the client class that owns each — see §6>`                                      |
| Functional types   | `<either_dart or dartz — pick one, never both>`                                                 |
| Branch / PR title  | `<branch "<type>/<ticket-id>_<slug>" → PR title "<type>: <ticket-id> <description>" — see §10>` |
| CI                 | `<the exact commands CI runs>`                                                                  |

---

## 2. Stack

| Concern          | Choice                                                                                                                        |
|------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Architecture     | Clean Architecture (data / domain / presentation), feature-first                                                              |
| State management | `flutter_bloc` — **Cubit only**, no `Bloc`/events; `ValueNotifier` for small local UI state, `setState` as a last resort (§7) |
| DI               | `get_it` service locator, accessed as `sl<T>()`                                                                               |
| Networking       | `dio` (+ retry and logging/inspector interceptors)                                                                            |
| Error handling   | `Either<Failure, T>` — no exceptions across layer boundaries                                                                  |
| Codegen          | `freezed` + `json_serializable` (+ storage/mock generators)                                                                   |
| Routing          | `go_router`, declarative, all routes in one file                                                                              |
| Local storage    | key-value boxes behind typed mixins                                                                                           |
| Responsive UI    | `flutter_screenutil` against a fixed design size                                                                              |
| i18n             | `flutter gen-l10n` from ARB files                                                                                             |

Entry points: `main.dart` (guarded zone → `serviceLocator()` → `runApp`), the root app widget
(`MaterialApp.router` + ScreenUtil + global providers), and a global cubit for theme/locale.

---

## 3. Commands

Use the absolute SDK path if `flutter` is not on `PATH`.

Bootstrap after clone, after pulling, and after touching any generated source:

```bash
flutter pub get && flutter gen-l10n && dart run build_runner build --delete-conflicting-outputs
```

Run (add `--flavor <flavor> --dart-define-from-file <env file>` when the project uses flavors):

```bash
flutter run
```

Verify before handing work back — match §1's CI commands, at minimum:

```bash
flutter analyze
```

```bash
flutter test
```

Single test file:

```bash
flutter test test/features/<feature>/domain/usecases/<usecase>_test.dart
```

**Generated files are usually gitignored** (`*.g.dart`, `*.freezed.dart`, generated l10n) — note any
exception in §11. A fresh clone will not compile until codegen has run. Re-run codegen whenever you
add or edit a `@freezed` class, a `@JsonSerializable` model, a `@GenerateMocks` annotation, or an ARB
key — otherwise you get a wall of unrelated-looking analyzer errors.

---

## 4. Directory layout

```
lib/
├── main.dart, app.dart, app_cubit.dart
├── core/                       # cross-feature infrastructure, no feature knowledge
│   ├── api/                    # Dio client(s), interceptors, endpoint constants, isolate parser
│   ├── error/failure.dart      # ServerFailure, ErrorFailure, NoDataFailure, CacheFailure
│   ├── localization/           # ARB files + generated strings
│   ├── resources/              # Dimens, Palette, Images, themes
│   ├── usecase/usecase.dart    # abstract UseCase<DataType, Params>, NoParams
│   ├── widgets/                # shared widgets
│   ├── app_route.dart          # Routes enum + router config
│   └── dependencies_injection.dart
├── features/<feature>/
│   ├── data/
│   │   ├── datasources/        # abstract + Impl, remote and/or local
│   │   ├── models/             # *_response.dart — API shape
│   │   └── repositories/       # *_repository_impl.dart
│   ├── domain/
│   │   ├── entities/           # app shape
│   │   ├── repositories/       # abstract contract
│   │   └── usecases/           # one class per action
│   └── pages/                  # UI + cubits
└── utils/{ext,helper,services} # extensions, helpers, storage, platform services
test/                           # mirrors lib/, plus helpers/ and stubs/
```

### Barrel files

Each directory exposes a barrel named after itself (`<feature>.dart`, `pages.dart`, `cubit.dart`, …),
re-exported upward into a few top-level barrels (`core/core.dart`, `features/features.dart`,
`utils/utils.dart`). Import through barrels, not deep paths:

```dart
import 'package:<package_name>/core/core.dart';
import 'package:<package_name>/features/<feature>/<feature>.dart';
```

When you add a file, add its `export` to the sibling barrel. A file that is not exported is invisible
to the rest of the app even though analysis passes.

### Inside `pages/`

Every page gets its **own folder**, named after the page and holding that page's file, its `part`
sub-widgets, and its `cubit/`. A widget shared by two or more of those pages sits **directly under
`pages/`**, one level up from the folders that use it.

```
features/<feature>/pages/
├── page_a/                     # everything only page A uses
│   ├── cubit/
│   ├── page_a_page.dart
│   └── page_a_header.dart
├── page_b/
│   ├── cubit/
│   └── page_b_page.dart
└── shared_component.dart       # used by page A and page B → lives here
```

A component shared beyond the feature moves further up, to `core/widgets/`. The moment a second page
imports something from a sibling page's folder, that file belongs one level up.

### `part` files for page sub-widgets

A page declares `part` for sub-widgets only it uses; part files hold `_PrivateWidget` classes and
carry no imports of their own. Anything reusable becomes a public class in its own file, exported via
the barrel. See §7 for the naming table and the reuse decision rule.

---

## 5. The layer contract

Data flows **DataSource → Repository → UseCase → Cubit → Page**. Every step returns
`Future<Either<Failure, T>>`. Hard rules:

1. A `*Response` model never escapes the data layer.
2. A `dio`/platform type never escapes the datasource.
3. **Model → entity mapping happens in the repository impl** — not in `toEntity()` helpers on the
   response model, and not in a separate mapper class. Keeping it in one place makes each repository
   method readable top to bottom.
4. **Side effects and cross-cutting business logic live in the use case**, not the repository — e.g.
   caching a result to local storage. Use cases may mix in a storage box. The repository stays a
   mapper plus response-shaped rules (status derivation, totals, empty payload → `NoDataFailure()`).
5. **API string codes become enhanced enums** in the domain layer, e.g.
   `OrderType.takeAway('takeAway', 'Pickup')` with `code`, `name`, and derived getters. The repository
   converts with `Values.firstWhere((e) => e.code == raw, orElse: () => ...)`; the UI compares enum
   values, never raw strings.
6. **Payload into a cubit travels as a `*Params` object**, built by the UI — see below.

### Params in, not loose arguments

Whenever the UI hands a cubit data that will reach a use case, it passes a single freezed `*Params`
object, already assembled at the call site. Loose positional arguments are the exception, not the norm.

```dart
// preferred — the page builds the params object
context.read<LoginCubit>().login(
  AuthTokenParams(
    username: _emailController.text,
    password: _passwordController.text,
  ),
);

// avoid — loose arguments the cubit has to reassemble
context.read<LoginCubit>().login(_emailController.text, _passwordController.text);
```

Why: the params class is the same type the use case and repository already take, so nothing has to be
repacked between layers; adding a field is one edit instead of four signatures; and `bloc_test` can
assert on one value (`when(mockPostLogin.call(params))`) instead of an argument list.

**Params serialize themselves.** A `*Params` class is freezed + json_serializable, with the API field
names declared as `@JsonKey`, and the datasource sends `params.toJson()` — never a hand-built map:

```dart
@freezed
sealed class ItemDetailParams with _$ItemDetailParams {
  const factory ItemDetailParams({
    @JsonKey(name: 'dataBranch') required String dataBranch,
    @JsonKey(name: 'menuId') required String menuId,

    /// UI-only field, kept out of the request
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(0) num productPrice,
  }) = _ItemDetailParams;

  factory ItemDetailParams.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailParamsFromJson(json);
}

// datasource
await _client.postRequest(ListAPI.itemDetail, data: params.toJson(), converter: ...);
```

Fields the backend must not receive (display prices, flags the UI needs) stay on the params class but
are excluded with `@JsonKey(includeToJson: false, includeFromJson: false)`.

Rules of thumb:

- A cubit method that calls a use case takes exactly one `*Params` argument. If a second data
  argument shows up (`getOptionMenu(num productPrice, GetOptionsMenuParams params)`), that field
  belongs *inside* the params class.
- Even a single-field payload gets a params class rather than a bare `String`/`int` — the field name
  is what makes the call site readable, and it leaves room to grow.
- **Not** wrapped: behaviour flags that carry no payload (`isForceUpdate`, `showLoading`,
  `isFirstLoad`) stay as named parameters with defaults, and cubit methods that only mutate local UI
  state (`setIndex(int)`, `updateItemCount(int)`, `selectOutlet(Outlet)`) keep their plain argument —
  nothing downstream consumes them.
- **Never** pass a `BuildContext` into a cubit. If a cubit method needs one, the work it is doing
  belongs in the widget layer.

**1 — Response model** (`data/models/`): freezed + json_serializable, fields nullable, API names explicit.

```dart
@freezed
sealed class ItemDetailResponse with _$ItemDetailResponse {
  const factory ItemDetailResponse({
    @JsonKey(name: 'data') ItemDetailData? data,
  }) = _ItemDetailResponse;

  factory ItemDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailResponseFromJson(json);
}
```

**2 — Remote datasource**: abstract class + `Impl`, one thin method per endpoint. Paths come from the
endpoint-constants class (`ListAPI`), never inlined. Pick the client that owns the base URL (§6).

```dart
@override
Future<Either<Failure, ItemDetailResponse>> itemDetail(ItemDetailParams params) async =>
    await _client.getRequest(
      '${ListAPI.itemDetail}${params.id}',
      converter: (response) =>
          ItemDetailResponse.fromJson(response as Map<String, dynamic>),
    );
```

**3 — Repository impl**: folds the datasource result, maps model → entity inline, and returns a
failure for empty payloads.

```dart
return response.fold((l) => Left(l), (r) {
  if (r.data?.isEmpty ?? true) return Left(NoDataFailure());
  return Right(
    ItemDetail(
      id: r.data?.itemId,
      name: r.data?.itemName,
    ),
  );
});
```

**4 — Entity** (`domain/entities/`): freezed, UI-shaped, no `@JsonKey`, no API vocabulary.

**5 — UseCase** (`domain/usecases/`): one class per action, named `Get*` / `Post*` / `Put*` /
`Delete*`, with its freezed `*Params` declared in the same file. Use `NoParams` when there is no input.

```dart
class GetItemDetail extends UseCase<ItemDetail, ItemDetailParams> {
  final ItemRepository _repository;
  GetItemDetail(this._repository);

  @override
  Future<Either<Failure, ItemDetail>> call(ItemDetailParams params) =>
      _repository.itemDetail(params);
}

@freezed
sealed class ItemDetailParams with _$ItemDetailParams {
  const factory ItemDetailParams({String? id}) = _ItemDetailParams;
}
```

When the action has a side effect, fold and act before returning:

```dart
class GetUser extends UseCase<UserData, NoParams> with MainBoxMixin {
  @override
  Future<Either<Failure, UserData>> call(NoParams _) async {
    final result = await _repository.user();
    return result.fold((l) => Left(l), (userData) {
      hasCompleteProfile = userData.hasCompleteProfile ?? false;
      return Right(userData);
    });
  }
}
```

**6 — Cubit** (`pages/**/cubit/`): cubit and its freezed sealed state in the *same file* — the one
place in the UI layer where two classes share a file (§7); states named `<Name>StateLoading` /
`StateSuccess` / `StateFailure`; initial state is loading.

```dart
class ItemDetailCubit extends Cubit<ItemDetailState> {
  final GetItemDetail _getItemDetail;
  ItemDetailCubit(this._getItemDetail) : super(const ItemDetailStateLoading());

  Future<void> itemDetail(ItemDetailParams params) async {
    emit(const ItemDetailStateLoading());
    final data = await _getItemDetail.call(params);
    data.fold(
      (l) { if (l is ServerFailure) emit(ItemDetailStateFailure(l.message ?? '')); },
      (r) => emit(ItemDetailStateSuccess(r)),
    );
  }
}

@freezed
sealed class ItemDetailState with _$ItemDetailState {
  const factory ItemDetailState.loading() = ItemDetailStateLoading;
  const factory ItemDetailState.success(ItemDetail data) = ItemDetailStateSuccess;
  const factory ItemDetailState.failure(String message) = ItemDetailStateFailure;
}
```

**7 — Page**: `BlocBuilder` + exhaustive `switch` over the sealed state, using destructuring patterns.

```dart
body: BlocBuilder<ItemDetailCubit, ItemDetailState>(
  builder: (_, state) => switch (state) {
    ItemDetailStateLoading() => const _ItemDetailLoading(),
    ItemDetailStateSuccess(:final data) => _ItemDetailContent(data: data),
    ItemDetailStateFailure(:final message) => Text(message),
  },
),
```

Give each loading state its own shimmer widget (`*_loading.dart`) and each empty state its own
`*_empty.dart`.

**8 — Register in DI** (`core/dependencies_injection.dart`): add to the matching helper
(`_dataSources` / `_repositories` / `_useCase` / `_cubit`), grouped per feature with a comment, using
`registerLazySingleton` and `sl()` placeholders.

**9 — Add the route** (`core/app_route.dart`): add to the `Routes` enum under the feature's comment
block, then a route that wraps the page in `BlocProvider`/`MultiBlocProvider` and kicks off the first
fetch with a cascade.

```dart
GoRoute(
  path: Routes.itemDetail.path,
  name: Routes.itemDetail.name,
  builder: (_, state) {
    final id = (state.extra as Map<String, dynamic>?)?['id'] as String?;
    return BlocProvider(
      create: (_) => sl<ItemDetailCubit>()..itemDetail(ItemDetailParams(id: id)),
      child: ItemDetailPage(id: id),
    );
  },
),
```

Navigate by name (`context.pushNamed(Routes.itemDetail.name, extra: ...)`), passing arguments through
`extra` — a `Map<String, dynamic>` when there is more than one value.

---

## 6. Networking

- Endpoint paths are `static const` on a single endpoint-constants class (`core/api/list_api.dart`),
  grouped by feature. Never inline a path string at the call site.

### One client per base URL, named after it

- The **primary** base URL — the one most endpoints use — belongs to the plain `DioClient` in
  `core/api/dio_client.dart`. No suffix.
- **Every additional** base URL gets its own client, named with a suffix taken from that base URL's
  identity (the integration, gateway, or vendor name): `dio_client_esb.dart` → `DioClientESB`,
  `dio_client_payment.dart` → `DioClientPayment`. Never a numbered or vague name
  (`DioClient2`, `DioClientOther`).
- Before adding a client, check which base URL is actually dominant — count the endpoints in
  `ListAPI`. If a new backend takes over the majority, that is a rename discussion, not a silent
  reassignment.
- Each datasource injects only the clients it needs (`DioClient _client`, `DioClientESB _clientESB`),
  and each method calls the client that owns its endpoint. Getting this wrong sends the request to
  the wrong host with the wrong headers.

### Client behaviour

- Base URLs come from build-time config. If the app supports remote reconfiguration, the effective
  value is read from local storage with the compile-time value as the default.
- Auth headers and token refresh live in an interceptor. Never attach tokens by hand at the call site.
- `getRequest`/`postRequest` take a `converter`; heavy JSON is parsed off the main isolate where the
  client supports it (`isIsolate: true` by default — pass `false` when the payload is not a `Map`).
- Transport errors are converted to a `Failure` carrying the server's message when present, and
  reported to crash reporting as non-fatals. Cubits handle failures by type, never by string matching.

---

## 7. UI conventions

- **No magic numbers** — use `Dimens` (`Dimens.space16`, `Dimens.bodyMedium`); it is already
  ScreenUtil-scaled, so do not add `.w`/`.h`/`.sp` on top.
- **No hardcoded user-facing strings** — add the key to the ARB template, run `flutter gen-l10n`, and
  read it through the generated accessor.
- Use the shared wrappers where they exist: the Scaffold wrapper, the app bar widgets, the bottom
  sheet / toast / network-image helpers. Don't re-derive them per page.
- Asset paths are constants on `Images`, never inline strings.

### Declaring resources

Resources live as `static` members on a private-constructor class (`Palette`, `Images`, `Dimens`) —
never an `enum`. Reach for an `enum` only when the set is a closed domain vocabulary you `switch`
over, iterate with `.values`, or parse from an API payload.

- **Screen-independent value → `static const`.** `const` is what keeps the call site `const`
  (`const Icon(Icons.home, color: Palette.primary1)`), so the widget is canonicalised and skipped on
  rebuild. An enum cannot do this: `MyPalette.primary.color` is a field read, not a constant
  expression, so every widget touching it silently becomes non-const.
- **ScreenUtil-scaled value → `static double get`.** A `static double x = 16.w;` field is initialised
  lazily *once* per process, freezing the value at whichever screen size happened to be active first
  — stale after rotation, split-screen, or unfolding. A getter re-reads the current metrics on every
  access for the cost of one multiply.

```dart
class Dimens {
  Dimens._();

  static const double cornerRadius = 16; // no screen dependency → const field
  static double get space16 => 16.w;     // ScreenUtil-scaled → getter, never a field
}
```

When a resource genuinely hangs off a domain value, leave the constants where they are and let the
enum map onto them — enum for the vocabulary, `static const` for the values:

```dart
enum OrderStatus {
  processing(Images.icTimer, Palette.warningDark1),
  delivery(Images.icDelivery, Palette.primary1);

  const OrderStatus(this.icon, this.color);

  final String icon;
  final Color color;
}
```

### Text styles and colors

Read both from the theme through the Flutter shorthands — not `Theme.of(context).textTheme` and not a
palette constant at the call site:

```dart
Text(
  Strings.of(context)!.detailOrder,
  style: TextTheme.of(context).titleLarge700,
),

DecoratedBox(
  decoration: BoxDecoration(color: ColorScheme.of(context).primary),
),
```

- **A size/weight combination that does not exist yet becomes a getter on the `TextTheme`
  extension** (`CustomTextTheme`), never an inline `TextStyle(...)` or a `.copyWith(fontSize:)` at the
  call site. One name per combination, defined once:

```dart
// lib/utils/ext/text_theme.dart
extension CustomTextTheme on TextTheme {
  TextStyle? get bodyMedium700 => bodyMedium?.copyWith(fontWeight: FontWeight.w700);
}
```

- **Only the color varies → `copyWith(color: ...)`** at the call site. Do not add a new extension
  getter per color:

```dart
TextTheme.of(context).bodyMedium700?.copyWith(color: ColorScheme.of(context).error)
```

- A colour the scheme does not carry yet gets added to the `ColorScheme` in the theme definition
  (backed by the `Palette` constant), so widgets keep asking the scheme rather than reaching for
  `Palette` themselves.

### Spacing between widgets

- Use `SpacerV` for vertical gaps and `SpacerH` for horizontal gaps — never a bare `SizedBox` for
  spacing.
- **`Dimens.space8` is the default value of both widgets**, so write `const SpacerV()` /
  `const SpacerH()` for an 8-unit gap. Never spell it out as `SpacerV(value: Dimens.space8)` — that
  is longer and loses the `const`. Pass `value` only for any other size:
  `SpacerV(value: Dimens.space16)`.
- **When the gap is the same between every child, use the `spacing:` parameter of `Column`/`Row`
  instead of repeating spacers** — it is shorter and keeps the rhythm in one place:

```dart
// preferred — uniform gap
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: Dimens.space16,
  children: [_Header(data: data), _Outlet(data: data), _Items(data: data)],
)

// spacers — only when the gaps differ between children
Column(
  children: [
    _Header(data: data),
    SpacerV(value: Dimens.space16),
    _Outlet(data: data),
    const SpacerV(), // default gap — Dimens.space8
    _Items(data: data),
  ],
)
```

### `Container` is a last resort

`Container` is a composite: it builds a `Padding`, a `DecoratedBox`, a `ConstrainedBox` and more,
depending on which arguments you pass. **If you are using at most two of its properties, use the
specific widget instead** — it is cheaper, `const`-able, and says exactly what it does.

| Instead of `Container(...)` with           | Use                            |
|--------------------------------------------|--------------------------------|
| `padding`                                  | `Padding`                      |
| `margin`                                   | `Padding` (wrapping the child) |
| `width` / `height`                         | `SizedBox`                     |
| `color`                                    | `ColoredBox`                   |
| `decoration`                               | `DecoratedBox`                 |
| `alignment`                                | `Align`                        |
| `padding` + `margin`, `width` + `color`, … | nest two of the above          |

```dart
// avoid
Container(padding: EdgeInsets.all(Dimens.space16), child: child)
Container(width: double.maxFinite, color: ColorScheme.of(context).surface, child: child)

// preferred
Padding(padding: EdgeInsets.all(Dimens.space16), child: child)
SizedBox(
  width: double.maxFinite,
  child: ColoredBox(color: ColorScheme.of(context).surface, child: child),
)
```

Reach for `Container` only when three or more of its properties are genuinely in play at once.

### Widget naming & where a widget lives

| Kind of UI                              | File suffix     | Example                     |
|-----------------------------------------|-----------------|-----------------------------|
| A whole screen                          | `_page.dart`    | `item_detail_page.dart`     |
| One row/cell of a `ListView`/`GridView` | `_item.dart`    | `order_history_item.dart`   |
| A named block of a page                 | `_section.dart` | `home_header_section.dart`  |
| Skeleton/shimmer state                  | `_loading.dart` | `payment_info_loading.dart` |
| Empty state                             | `_empty.dart`   | `promo_list_empty.dart`     |
| Shared page logic (not a widget)        | `_mixin.dart`   | `order_mixin.dart`          |

For every piece of a page — sections, items, loading and empty states — the decision is the same:

- **Reusable** (used by more than one page, or plausibly will be): a public class in its own file,
  exported from the sibling barrel, imported normally.
- **Used only by that one page**: keep it in a `part` file of the page — `part 'x_item.dart';` in the
  page, `part of 'x_page.dart';` in the file — and name the class with a leading underscore
  (`_OrderActivityItem`). Part files carry no imports of their own; they inherit the page's.

Pick by reuse, not by habit — both shapes will exist side by side in a mature codebase.

### One class per file in the UI layer

**Never declare more than one widget class in a file under `pages/`** — including part files. Each
page, section, item, loading and empty widget gets its own file named after it. If a page needs three
sub-widgets, that is three `part` files, not one file with three classes.

The **only exception is a cubit and its state**: `<name>_cubit.dart` holds the `Cubit` plus its
freezed sealed state and the state's variants, because they are one unit and are always edited
together (§5, step 6).

```
pages/item_detail/
├── cubit/
│   └── item_detail_cubit.dart   # ItemDetailCubit + ItemDetailState — the one allowed pairing
├── item_detail_page.dart        # ItemDetailPage  + its part directives
├── item_detail_header.dart      # part of item_detail_page.dart → _ItemDetailHeader
├── item_detail_items.dart       # part of item_detail_page.dart → _ItemDetailItems
└── item_detail_loading.dart     # part of item_detail_page.dart → _ItemDetailLoading
```

Small helper enums or typedefs used by a single widget may stay in that widget's file; a second
widget may not. When a file starts growing a second class, that is the signal to split it — and to
ask whether the new widget is reusable enough to leave the `part` and get its own barrel export.

### Holding state: cubit → `ValueNotifier` → `setState`

**Avoid `setState` wherever possible.** It rebuilds the whole widget, hides state inside the UI layer
where nothing can test it, and grows into untestable page logic. Pick in this order:

1. **Cubit** — the default. Anything driven by data, business rules, or a use case, and anything more
   than one widget cares about, belongs in a cubit with a sealed state (§5, step 6). It is testable
   with `bloc_test` and rebuilds only the `BlocBuilder` subtree.
2. **`ValueNotifier` + `ValueListenableBuilder`** — for small, purely local, ephemeral UI state where
   a cubit would be overkill: a toggle, an expanded flag, a focus/obscure flag, a selected index used
   by one widget. Rebuilds only the builder subtree. Declare it in the `State`, and always
   `dispose()` it.
3. **`setState`** — last resort, for genuinely local widget-lifecycle state that neither of the above
   fits. If a `setState` callback contains business logic, a network call, or storage writes, it is
   in the wrong layer — move it to a cubit.

```dart
// preferred for a single local flag
final _isExpanded = ValueNotifier<bool>(false);

@override
void dispose() {
  _isExpanded.dispose();
  super.dispose();
}

@override
Widget build(BuildContext context) => ValueListenableBuilder<bool>(
  valueListenable: _isExpanded,
  builder: (_, isExpanded, _) => ...,
);
```

A page whose only state is a `ValueNotifier` often does not need to be a `StatefulWidget` at all —
but a notifier created in a `StatelessWidget` is never disposed, so keep it in a `State` (or hoist it
into the cubit).

### Shared page logic

Behaviour shared by several pages of a feature — route resolution, confirmation dialogs, common
handlers — goes into a `mixin class` in `*_mixin.dart` which pages mix into their `State`. Don't copy
navigation `switch`es between pages.

### Expression bodies

Use `=>` as much as possible: `build` methods, single-expression helpers, callbacks, getters. Enable
`prefer_expression_function_bodies` so a block body that only returns gets flagged. Prefer
`StatelessWidget` unless the widget genuinely holds state.

```dart
@override
Widget build(BuildContext context) => Parent(
  appBar: CustomAppBar(context, title: Text(Strings.of(context)!.detailOrder)),
  body: ...,
);
```

---

## 8. Local storage

Key-value storage sits behind typed mixins, one per logical box (session, cache, in-progress user
input). Access goes through the DI-registered instance (`sl<MainBoxMixin>()`) or by mixing the box
into the class that needs it — never the raw box. Keys are enum values or constants, not string
literals. Adding a persisted custom type means annotating it and re-running codegen.

---

## 9. Testing

Tests mirror `lib/` under `test/`, covering every layer: models (`fromJson`), datasources (mocked HTTP
adapter), repositories, usecases, cubits (`bloc_test`), and page widget tests.

Boilerplate every test needs — reset DI and give storage an isolated namespace per test file:

```dart
setUp(() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  PathProviderPlatform.instance = FakePathProvider();
  await serviceLocator(isUnitTest: true, prefix: 'get_item_detail_test_');
});
```

- The `prefix` must be unique per test file (convention: `<file_name>_`); shared prefixes cause
  cross-test storage corruption that looks like flakiness.
- The unit-test flag on the service locator resets GetIt, skips interceptors/inspectors, and swaps in
  fakes for platform plugins.
- **API response stubs sit next to the model test that parses them**, inside the model folder of the
  test tree, named `<response>_<httpStatus>.json`:

```
test/features/<feature>/data/models/
├── item_detail_response_test.dart
├── item_detail_response_200.json
└── item_detail_response_400.json
```

  Co-locating them means a model test reads its own fixture from the same directory instead of
  reaching across the tree, and the success and error payloads of one endpoint stay visible together.
  A fixture genuinely shared by several features (a common `meta` envelope) is the exception and lives
  in a shared stub folder.
- Shared repository/datasource mocks come from one central `@GenerateMocks` file; per-test mocks
  (usually usecases) use a local `@GenerateMocks` and import `<test_file>.mocks.dart`. Both require
  `build_runner`.
- Cubit tests assert the full emission list: `[loading, success]` / `[loading, failure]`.
- E2E flows (Maestro / `integration_test`), if present, stay tagged with shared navigation factored
  into reusable sub-flows.

---

## 10. Conventions & workflow

- Follow the lint set in `analysis_options.yaml` — typically trailing commas required, single quotes,
  `const` wherever possible, control bodies on a new line, required named params first. Do not weaken
  rules to make code pass, and never hand-edit generated output.
- Commits: Conventional Commits (`feat:`, `fix:`, `chore:`, `refactor:`, `test:`, `clean:`).
- CI must be green: codegen → analyze → test. If the pipeline auto-formats, run the formatter locally
  rather than fighting it.
- Do not commit secrets. Config values belong in the env mechanism from §1; if config files with real
  credentials are already tracked, never copy their values into new files, logs, docs, or commit
  messages.

### Logging and error handling

- Log through the shared `logger`, never `print(`. Pick the level by severity: `logger.d` for tracing
  a flow, **`logger.w` for a recoverable problem** (a fallback kicked in, a response field was
  missing), **`logger.e` for a real failure**, always with the `error:` and `stackTrace:` arguments so
  crash reporting gets the full frame.
- **Never swallow an exception silently.** An empty `catch (_) {}` hides the next bug.

```dart
// avoid — the failure disappears
try {
  await doWork();
} catch (_) {}

// preferred — the failure is recorded, and the caller still sees a Failure
try {
  await doWork();
} catch (error, stackTrace) {
  logger.e('Failed to do work', error: error, stackTrace: stackTrace);
  return Left(ErrorFailure(error.toString()));
}
```

- A `catch` that deliberately ignores an error needs a comment saying why, and still logs at
  `logger.w` if anything user-visible changed as a result.
- In the data layer the transport errors are already converted to `Failure` and reported as
  non-fatals (§6) — don't add a second silent `try/catch` around a call that already returns
  `Either`.

### Branch name drives the PR title

The branch is `<type>/<ticket-id>_<short-slug>`; the PR title reuses its first two segments and then
describes the change in words:

```
branch:    feat/yot-123_create-a-new-feature
PR title:  feat: yot-123 add new feature
```

- `<type>` is the same Conventional Commit type in both places — if the branch says `fix/`, the PR
  title starts with `fix:`, never a different type.
- The ticket id keeps the branch's lowercase form (`yot-123`), sits after the colon, and carries no
  brackets. Several tickets are comma-separated: `feat: yot-123,yot-124 …`.
- The description is human prose about the whole PR, not the branch slug pasted back in — the slug is
  a filename, the title is a sentence.
- A branch with no ticket (`chore/bump-deps`) simply drops that segment: `chore: bump deps`.
- Fill in the PR template; keep the description relevant to every commit in the PR.

### Gotchas

- Missing codegen after editing a freezed/JSON class or an ARB key produces confusing, unrelated
  analyzer errors — re-run codegen before investigating.
- A new file that is not exported from its barrel is invisible to the rest of the app.
- Only one functional-types package may be used; mixing `either_dart` and `dartz` breaks the `Either`
  type in confusing ways.
- Calling the wrong Dio client compiles fine and fails at runtime against the wrong host — see §6.
- Scratch directories and task-scoped reports (design QA notes, migration write-ups) describe one past
  change; they are not standing specifications and must not be built upon.

---

## 11. Project-specific notes

<Anything true for this repo only: secrets handling, release/distribution scripts, flavor quirks,
platform setup, feature flags, versioning rules, known-bad areas, committed generated files.>
