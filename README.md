<a href="https://s.id/standwithpalestine"><img alt="We stand with Palestine" src="https://cdn.jsdelivr.net/gh/Safouene1/support-palestine-banner@master/banner-project.svg" width="100%" /></a>

<br>

# Flutter App Auth 📱
[![codecov](https://codecov.io/gh/lazycatlabs/flutter_auth_app/main/graph/badge.svg)](https://codecov.io/gh/lazycatlabs/flutter_auth_app)
<br/><br/>
<a href="https://www.linkedin.com/in/lzyct/" target="_blank">
    <img src="https://github.com/ukieTux/ukieTux/blob/master/assets/linkedin.svg" alt="LinkedIn" style="vertical-align:top; margin:4px" height=24>
</a>
<a href = "https://www.upwork.com/freelancers/~01913209d41be922f1?viewMode=1">
    <img src="https://img.shields.io/badge/UpWork-6FDA44?logo=Upwork&logoColor=white" height=24/>
</a>  


This app has Auth Functions like Login, Register, and Show pagination data.

The API using [apimock](https://apimock.lazycatlabs.com/) from [lazycatlabs](https://lazycatlabs.com).

<br>This app also implementing **Flutter Clean Architecture with TDD.**



https://github.com/user-attachments/assets/d7c67364-e935-4630-8182-a900ccd5f3a7




## Pre-requisites 📐

| Technology | Recommended Version | Installation Guide                                                    |
|------------|---------------------|-----------------------------------------------------------------------|
| Flutter    | v3.24.x             | [Flutter Official Docs](https://flutter.dev/docs/get-started/install) |
| Dart       | v3.5.x              | Installed automatically with Flutter                                  |

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
- Test Coverage, we ignore some folders and files which is not necessary to test coverage because it are generated file
- Note: on macOS, you need to have lcov installed on your system (`brew install lcov`) to use this:
```bash
 flutter test -j8 --coverage;lcov --remove coverage/lcov.info 'lib/core/localization/generated/' 'lib/core/resources/*' 'lib/utils/services/firebase/*' '**/*.g.dart' -o coverage/new_lcov.info ;genhtml coverage/new_lcov.info -o coverage/html
````
- To generate a launcher icon based on Flavor 
```bash
dart run flutter_launcher_icons 
```
- To generate native splash screen
```bash
dart run flutter_native_splash:create --flavors stg,prd
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
- [x] Auto routing based on login status
- [x] Implement [Go Router](https://pub.dev/packages/go_router)

## TODO 📝
- [ ] Login with Biometric / FaceID



## Maestro Test 🧪
- Install Maestro on your machine [Maestro](https://maestro.mobile.dev/getting-started/installing-maestro)
- Run this command to run the test
  ```bash
   maestro test maestro-stg/main.yaml #or
   maestro test maestro-prd/main.yaml
  ```



## Architecture Proposal by [Resocoder](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course)

<br>

![architecture-proposal](./architecture-proposal.png)

<br><br>

<h3 align="center">Buy me coffee if you love my works ☕️</h3>
<p align="center">
  <a href="https://www.buymeacoffee.com/Lzyct" target="_blank">
    <img src="https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg" alt="buymeacoffe" style="vertical-align:top; margin:8px" height="36">
  </a>&nbsp;&nbsp;&nbsp;&nbsp;
   <a href="https://ko-fi.com/Lzyct" target="_blank">
    <img src="https://cdn.prod.website-files.com/5c14e387dab576fe667689cf/670f5a01cf2da94a032117b9_support_me_on_kofi_red-p-500.png" alt="ko-fi" style="vertical-align:top; margin:8px" height="36">
  </a>&nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://paypal.me/ukieTux" target="_blank">
    <img src="https://blog.zoom.us/wp-content/uploads/2019/08/paypal.png" alt="paypal" style="vertical-align:top; margin:8px" height="36">
  </a>
  <a href="https://saweria.co/Lzyct" target="_blank">
   <img src="https://1.bp.blogspot.com/-7OuHSxaNk6A/X92QPg8L9kI/AAAAAAAAG0E/lUzKf_uuVP8jCqvXpA7juh_l-TfK2jnbwCLcBGAsYHQ/s16000/SAWERIA.webp" style="vertical-align:top; margin:8px" height="36" alt="saweria">
  </a>
</p>
<br><br>
