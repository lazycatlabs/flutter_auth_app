<br>

# Flutter App Auth 📱

This is App with Auth Function like Login and Register. All API using [reqres.in](https://reqres.in/).
<br>This app also implementing **Flutter Clean Architecture with TDD.**



https://user-images.githubusercontent.com/1531684/161389636-9802a444-2fac-41b2-83a7-c031f9e5d2d9.mp4?width=350



## Get Started 🚀

- Clone this project
- Run `flutter run`
- Run Test `flutter test`

## Feature ✅
- [x] BLoC State Management
- [x] **Clean Architecture with TDD**
    - [x] Unit Test
    - [x] Widget Test
    - [x] BLoC test
- [x] Theme Configuration : `System, Light, Dark`
- [x] Multi Language : `English, Bahasa`
- [x] Login, Register Example
- [x] Pagination Example

## TODO 📝

- [ ] Integration Test
- [ ] Implement multi flavor

## Architecture Proposal by [Resocoder](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)

<br>

![architecture-proposal](./architecture-proposal.png)

### Project Structure

<details>

````
lib
 ├── core
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
 │   └── usecase
 │       └── usecase.dart
 ├── data
 │   ├── data.dart
 │   ├── datasources
 │   │   ├── datasources.dart
 │   │   ├── local
 │   │   │   ├── data_helper.dart
 │   │   │   ├── local.dart
 │   │   │   └── pref_manager.dart
 │   │   └── remote
 │   │       ├── auth_remote_datasources.dart
 │   │       ├── model
 │   │       │   ├── auth
 │   │       │   │   ├── auth.dart
 │   │       │   │   ├── login_response.dart
 │   │       │   │   ├── register_response.dart
 │   │       │   │   └── users_response.dart
 │   │       │   └── model.dart
 │   │       ├── remote.dart
 │   │       └── services
 │   │           ├── dio_client.dart
 │   │           ├── dio_interceptor.dart
 │   │           ├── list_api.dart
 │   │           └── services.dart
 │   └── repositories
 │       ├── auth_repository_impl.dart
 │       └── repositories.dart
 ├── di
 │   └── di.dart
 ├── domain
 │   ├── domain.dart
 │   ├── entities
 │   │   ├── auth
 │   │   │   ├── auth.dart
 │   │   │   ├── login.dart
 │   │   │   ├── register.dart
 │   │   │   └── users.dart
 │   │   └── entities.dart
 │   ├── repositories
 │   │   ├── auth_repository.dart
 │   │   └── repositories.dart
 │   └── usecases
 │       ├── auth
 │       │   ├── auth.dart
 │       │   ├── get_users.dart
 │       │   ├── post_login.dart
 │       │   └── post_register.dart
 │       └── usecases.dart
 ├── main.dart
 ├── presentation
 │   ├── page
 │   │   ├── app_route.dart
 │   │   ├── auth
 │   │   │   ├── auth.dart
 │   │   │   ├── cubit
 │   │   │   │   ├── cubit.dart
 │   │   │   │   ├── login_cubit.dart
 │   │   │   │   ├── login_state.dart
 │   │   │   │   ├── register_cubit.dart
 │   │   │   │   └── register_state.dart
 │   │   │   ├── login_page.dart
 │   │   │   └── register_page.dart
 │   │   ├── main
 │   │   │   ├── cubit
 │   │   │   │   ├── cubit.dart
 │   │   │   │   └── navdrawer_cubit.dart
 │   │   │   ├── dashboard
 │   │   │   │   ├── cubit
 │   │   │   │   │   ├── cubit.dart
 │   │   │   │   │   ├── users_cubit.dart
 │   │   │   │   │   └── users_state.dart
 │   │   │   │   ├── dashboard.dart
 │   │   │   │   ├── dashboard_page.dart
 │   │   │   │   └── dashboard_success.dart
 │   │   │   ├── main.dart
 │   │   │   ├── main_page.dart
 │   │   │   ├── menu_drawer.dart
 │   │   │   └── settings
 │   │   │       ├── cubit
 │   │   │       │   ├── cubit.dart
 │   │   │       │   └── settings_cubit.dart
 │   │   │       ├── settings.dart
 │   │   │       └── settings_page.dart
 │   │   ├── pages.dart
 │   │   └── splashscreen
 │   │       └── splash_screen_page.dart
 │   ├── presentation.dart
 │   ├── resources
 │   │   ├── dimens.dart
 │   │   ├── images.dart
 │   │   ├── palette.dart
 │   │   ├── resources.dart
 │   │   └── styles.dart
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
 └── utils
     ├── ext
     │   ├── context.dart
     │   ├── ext.dart
     │   └── string.dart
     ├── helper
     │   ├── common.dart
     │   ├── constant.dart
     │   └── helper.dart
     └── utils.dart

````

</details>

### Test Project Structure

<details>

````
  test
    ├── data
    │   ├── datasources
    │   │   └── remote
    │   │       ├── auth_remote_datasources_test.dart
    │   │       └── model
    │   │           └── auth
    │   │               ├── login_response_test.dart
    │   │               ├── register_response_test.dart
    │   │               └── users_response_test.dart
    │   └── repositories
    │       └── auth_repository_impl_test.dart
    ├── domain
    │   └── usecases
    │       └── auth
    │           ├── get_users_test.dart
    │           ├── post_login_test.dart
    │           └── post_register_test.dart
    ├── helpers
    │   ├── data_dummy
    │   │   ├── list_user_empty_response.json
    │   │   ├── list_user_response.json
    │   │   ├── login_success_response.json
    │   │   ├── login_unsuccessful_response.json
    │   │   ├── register_success_response.json
    │   │   └── register_unsuccessful_response.json
    │   ├── json_reader.dart
    │   ├── paths.dart
    │   ├── test_mock.dart
    │   └── test_mock.mocks.dart
    └── presentation
        └── page
            ├── auth
            │   ├── cubit
            │   │   ├── login_cubit_test.dart
            │   │   ├── login_cubit_test.mocks.dart
            │   │   ├── login_state_test.dart
            │   │   ├── register_cubit_test.dart
            │   │   ├── register_cubit_test.mocks.dart
            │   │   └── register_state_test.dart
            │   ├── login_page_test.dart
            │   └── register_page_test.dart
            └── main
                ├── cubit
                │   └── navdrawer_cubit_test.dart
                ├── dashboard
                │   ├── cubit
                │   │   ├── users_cubit_test.dart
                │   │   ├── users_cubit_test.mocks.dart
                │   │   └── users_state_test.dart
                │   └── dashboard_page_test.dart
                └── settings
                    ├── cubit
                    │   └── settings_cubit_test.dart
                    └── settings_page_test.dart

````

</details>


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
   <img src="https://1.bp.blogspot.com/-7OuHSxaNk6A/X92QPg8L9kI/AAAAAAAAG0E/lUzKf_uuVP8jCqvXpA7juh_l-TfK2jnbwCLcBGAsYHQ/s16000/SAWERIA.webp" style="vertical-align:top; margin:8px" height="36">
  </a>
</p>
<br><br>
