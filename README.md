<br>

# Flutter App Auth 📱

[![codecov](https://codecov.io/gh/lazycatlabs/flutter_auth_app/main/graph/badge.svg)](https://codecov.io/gh/lazycatlabs/flutter_auth_app)


This is an App with Auth Functions like Login, Register and show pagination data.

The API using [apimock](https://apimock.lazycatlabs.com/) from [lazycatlabs](https://lazycatlabs.com).

<br>This app also implementing **Flutter Clean Architecture with TDD.**



https://github.com/lazycatlabs/flutter_auth_app/assets/1531684/7a81b477-3c22-4788-9cf2-b5a034a5af50 

https://github.com/lazycatlabs/flutter_auth_app/assets/1531684/53f880ed-d51e-4bc4-8dd9-606efc3bb1e9



## Pre-requisites 📐

| Technology | Recommended Version | Installation Guide                                                    |
|------------|---------------------|-----------------------------------------------------------------------|
| Flutter    | v3.22.x             | [Flutter Official Docs](https://flutter.dev/docs/get-started/install) |
| Dart       | v3.4.x              | Installed automatically with Flutter                                  |

## Get Started 🚀

- Clone this project
```bash 
  flutter pub get 
```
- Run to generate localization files
```bash
flutter gen-l10n
```
- Run to generate freezes files
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
- Run for **staging** or
```bash
flutter run --flavor stg -t lib/main.dart --dart-define-from-file .env.stg.json 
```
- Run for **production**
```bash
flutter run --flavor prd -t lib/main.dart --dart-define-from-file .env.prd.json 
```
- Run Test Coverage, we ignore some folder and file which is not necessary to test coverage because it's generated file
- Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
```bash
 flutter test -j8 --coverage;lcov --remove coverage/lcov.info 'lib/core/localization/generated/' 'lib/core/resources/*' 'lib/utils/services/firebase/*' '**/*.g.dart' -o coverage/new_lcov.info ;genhtml coverage/new_lcov.info -o coverage/html
````
- To generate launcher icon based on Flavor 
```bash
dart run flutter_launcher_icons 
```
- To generate mock class
```bash
dart pub run build_runner build
```


## Feature ✅

- [x] BLoC State Management
- [x] **Clean Architecture with TDD**
    - [x] Unit Test
    - [x] Widget Test
    - [x] BLoC test
- [x] Theme Configuration: `System, Light, Dark`
- [x] Multi-Language: `English, Bahasa`
- [x] Login, Register Example
- [x] Pagination Example
- [x] [Autofill Username and Password](https://github.com/lazycatlabs/flutter_auth_app/pull/3)
- [x] Integration Test
- [x] Implement multi-flavor
- [x] Implement [Go Router](https://pub.dev/packages/go_router)

## TODO 📝
- [ ] Login with Biometric / FaceID



## Maestro Test 🧪
- Install Maestro on your machine [Maestro](https://maestro.mobile.dev/getting-started/installing-maestro)
- Run this command to run the test
  ```bash
   maestro test maestro-stg/main.yaml
  ```
  
https://github.com/user-attachments/assets/e30f1e0d-eccc-4624-b5c0-4d9495352f35



## Architecture Proposal by [Resocoder](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)

<br>

![architecture-proposal](./architecture-proposal.png)

### Project Structure

<details>

````

lib
├── config.dart
├── core
│   ├── api
│   │   ├── api.dart
│   │   ├── dio_client.dart
│   │   ├── dio_interceptor.dart
│   │   ├── isolate_parser.dart
│   │   └── list_api.dart
│   ├── app_route.dart
│   ├── core.dart
│   ├── core_mapper.dart
│   ├── error
│   │   ├── error.dart
│   │   ├── exceptions.dart
│   │   └── failure.dart
│   ├── localization
│   │   ├── generated
│   │   │   ├── strings.dart
│   │   │   ├── strings_en.dart
│   │   │   └── strings_id.dart
│   │   ├── intl_en.arb
│   │   ├── intl_id.arb
│   │   ├── l10n.dart
│   │   └── localization.dart
│   ├── resources
│   │   ├── dimens.dart
│   │   ├── images.dart
│   │   ├── palette.dart
│   │   ├── resources.dart
│   │   └── styles.dart
│   ├── usecase
│   │   └── usecase.dart
│   └── widgets
│       ├── button.dart
│       ├── button_notification.dart
│       ├── button_text.dart
│       ├── circle_image.dart
│       ├── color_loaders.dart
│       ├── drop_down.dart
│       ├── empty.dart
│       ├── loading.dart
│       ├── my_appbar.dart
│       ├── parent.dart
│       ├── spacer_h.dart
│       ├── spacer_v.dart
│       ├── text_f.dart
│       ├── toast.dart
│       └── widgets.dart
├── dependencies_injection.dart
├── features
│   ├── auth
│   │   ├── auth.dart
│   │   ├── data
│   │   │   ├── data.dart
│   │   │   ├── datasources
│   │   │   │   ├── auth_remote_datasources.dart
│   │   │   │   └── datasources.dart
│   │   │   ├── models
│   │   │   │   ├── login_response.dart
│   │   │   │   ├── login_response.freezed.dart
│   │   │   │   ├── login_response.g.dart
│   │   │   │   ├── models.dart
│   │   │   │   ├── register_response.dart
│   │   │   │   ├── register_response.freezed.dart
│   │   │   │   └── register_response.g.dart
│   │   │   └── repositories
│   │   │       ├── auth_repository_impl.dart
│   │   │       └── repositories.dart
│   │   ├── domain
│   │   │   ├── domain.dart
│   │   │   ├── entities
│   │   │   │   ├── entities.dart
│   │   │   │   ├── login.dart
│   │   │   │   ├── login.freezed.dart
│   │   │   │   ├── register.dart
│   │   │   │   └── register.freezed.dart
│   │   │   ├── repositories
│   │   │   │   ├── auth_repository.dart
│   │   │   │   └── repositories.dart
│   │   │   └── usecases
│   │   │       ├── post_login.dart
│   │   │       ├── post_login.freezed.dart
│   │   │       ├── post_login.g.dart
│   │   │       ├── post_register.dart
│   │   │       ├── post_register.freezed.dart
│   │   │       ├── post_register.g.dart
│   │   │       └── usecases.dart
│   │   └── pages
│   │       ├── login
│   │       │   ├── cubit
│   │       │   │   ├── auth_cubit.dart
│   │       │   │   ├── auth_cubit.freezed.dart
│   │       │   │   ├── auth_state.dart
│   │       │   │   └── cubit.dart
│   │       │   ├── login.dart
│   │       │   └── login_page.dart
│   │       ├── pages.dart
│   │       └── register
│   │           ├── cubit
│   │           │   ├── cubit.dart
│   │           │   ├── register_cubit.dart
│   │           │   ├── register_cubit.freezed.dart
│   │           │   └── register_state.dart
│   │           ├── register.dart
│   │           └── register_page.dart
│   ├── features.dart
│   ├── general
│   │   ├── general.dart
│   │   └── pages
│   │       ├── main
│   │       │   ├── main.dart
│   │       │   ├── main_page.dart
│   │       │   └── menu_drawer.dart
│   │       ├── pages.dart
│   │       ├── settings
│   │       │   ├── cubit
│   │       │   │   ├── cubit.dart
│   │       │   │   └── settings_cubit.dart
│   │       │   ├── settings.dart
│   │       │   └── settings_page.dart
│   │       └── splashscreen
│   │           ├── splash_screen_page.dart
│   │           └── splashscreen.dart
│   └── users
│       ├── data
│       │   ├── data.dart
│       │   ├── datasources
│       │   │   ├── datasources.dart
│       │   │   └── user_remote_datasources.dart
│       │   ├── models
│       │   │   ├── models.dart
│       │   │   ├── users_response.dart
│       │   │   ├── users_response.freezed.dart
│       │   │   └── users_response.g.dart
│       │   └── repositories
│       │       ├── repositories.dart
│       │       └── users_repository_impl.dart
│       ├── domain
│       │   ├── domain.dart
│       │   ├── entities
│       │   │   ├── entities.dart
│       │   │   ├── users.dart
│       │   │   └── users.freezed.dart
│       │   ├── repositories
│       │   │   ├── repositories.dart
│       │   │   └── users_repository.dart
│       │   └── usecases
│       │       ├── get_users.dart
│       │       ├── get_users.freezed.dart
│       │       ├── get_users.g.dart
│       │       └── usecases.dart
│       ├── pages
│       │   ├── dashboard
│       │   │   ├── cubit
│       │   │   │   ├── cubit.dart
│       │   │   │   ├── users_cubit.dart
│       │   │   │   ├── users_cubit.freezed.dart
│       │   │   │   └── users_state.dart
│       │   │   ├── dashboard.dart
│       │   │   └── dashboard_page.dart
│       │   └── pages.dart
│       └── users.dart
├── lzyct_app.dart
├── main_prd.dart
├── main_stg.dart
└── utils
    ├── ext
    │   ├── context.dart
    │   ├── ext.dart
    │   ├── string.dart
    │   └── text_theme.dart
    ├── helper
    │   ├── common.dart
    │   ├── constant.dart
    │   ├── data_helper.dart
    │   ├── data_helper.freezed.dart
    │   ├── go_router_refresh_stream.dart
    │   └── helper.dart
    ├── services
    │   ├── firebase
    │   │   ├── firebase.dart
    │   │   ├── firebase_crashlogger.dart
    │   │   └── firebase_services.dart
    │   ├── hive
    │   │   ├── hive.dart
    │   │   └── main_box.dart
    │   └── services.dart
    └── utils.dart

````

</details>

### Test Project Structure

<details>

````

test
├── features
│   ├── auth
│   │   ├── data
│   │   │   ├── datasources
│   │   │   │   ├── models
│   │   │   │   │   ├── login_response_test.dart
│   │   │   │   │   └── register_response_test.dart
│   │   │   │   └── repositories
│   │   │   │       └── auth_remote_datasources_test.dart
│   │   │   └── repositories
│   │   │       └── auth_repository_impl_test.dart
│   │   ├── domain
│   │   │   └── usecases
│   │   │       ├── post_login_test.dart
│   │   │       └── post_register_test.dart
│   │   └── pages
│   │       ├── login
│   │       │   ├── cubit
│   │       │   │   ├── auth_cubit_test.dart
│   │       │   │   ├── auth_cubit_test.mocks.dart
│   │       │   │   └── auth_state_test.dart
│   │       │   └── login_page_test.dart
│   │       └── register
│   │           ├── cubit
│   │           │   ├── register_cubit_test.dart
│   │           │   ├── register_cubit_test.mocks.dart
│   │           │   └── register_state_test.dart
│   │           └── register_page_test.dart
│   ├── general
│   │   └── pages
│   │       └── settings
│   │           ├── cubit
│   │           │   └── settings_cubit_test.dart
│   │           └── settings_page_test.dart
│   └── users
│       ├── data
│       │   ├── datasources
│       │   │   ├── models
│       │   │   │   └── users_response_test.dart
│       │   │   └── repositories
│       │   │       └── users_remote_datasources_test.dart
│       │   └── repositories
│       │       └── users_repository_impl_test.dart
│       ├── domain
│       │   └── usecases
│       │       └── get_users_test.dart
│       └── pages
│           └── dashboard
│               ├── cubit
│               │   ├── users_cubit_test.dart
│               │   ├── users_cubit_test.mocks.dart
│               │   └── users_state_test.dart
│               └── dashboard_page_test.dart
└── helpers
    ├── fake_path_provider_platform.dart
    ├── json_reader.dart
    ├── paths.dart
    ├── stubs
    │   ├── list_user_empty_response.json
    │   ├── list_user_response.json
    │   ├── login_success_response.json
    │   ├── login_unsuccessful_response.json
    │   ├── register_success_response.json
    │   └── register_unsuccessful_response.json
    ├── test_mock.dart
    └── test_mock.mocks.dart

````

</details>

## Hire Me 🤝

<table style="border:none; border-collapse:collapse; cellspacing:0; cellpadding:0">
    <tr>
        <td>
           <a href="https://www.linkedin.com/in/lzyct/" target="_blank">
              <img src="https://github.com/ukieTux/ukieTux/blob/master/assets/linkedin.svg" alt="LinkedIn" style="vertical-align:top; margin:4px" height=24>
          </a>
        </td>
        <td>
           <a href = "https://www.upwork.com/freelancers/~01913209d41be922f1?viewMode=1">
              <img src="https://img.shields.io/badge/UpWork-6FDA44?logo=Upwork&logoColor=white" height=24/>
           </a>
        </td>
    </tr>
</table>


<br><br>

<h3 align="center">Buy me coffee if you love my works ☕️</h3>
<p align="center">
  <a href="https://www.buymeacoffee.com/Lzyct" target="_blank">
    <img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg" alt="buymeacoffe" style="vertical-align:top; margin:8px" height="36">
  </a>&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="https://ko-fi.com/Lzyct" target="_blank">
    <img src="https://help.ko-fi.com/system/photos/3604/0095/9793/logo_circle.png" alt="ko-fi" style="vertical-align:top; margin:8px" height="36">
  </a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://paypal.me/ukieTux" target="_blank">
    <img src="https://blog.zoom.us/wp-content/uploads/2019/08/paypal.png" alt="paypal" style="vertical-align:top; margin:8px" height="36">
  </a>
  <a href="https://saweria.co/Lzyct" target="_blank">
   <img src="https://1.bp.blogspot.com/-7OuHSxaNk6A/X92QPg8L9kI/AAAAAAAAG0E/lUzKf_uuVP8jCqvXpA7juh_l-TfK2jnbwCLcBGAsYHQ/s16000/SAWERIA.webp" style="vertical-align:top; margin:8px" height="36" alt="saweria">
  </a>
</p>
<br><br>
