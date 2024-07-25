# Feature

FLUTTER V3.19.6

- Design
  - Text Theme
  - Color Theme
  - Button(Basic, Radio, Check) Theme
  - TextField Theme
  - Snackbar Theme
  - Loading Theme
- Utilities
  - Date Method
  - Converter extension
  - Deeplink
  - Local Storage
  - API
  - Firebase
  - Translation
  - Network Error Handler
  - User service

# Introduction

APP_NAME adalah

# Setup

flutter clean
flutter pub get
fluttergen -c pubspec.yaml

## :ledger: Index

- [About](#beginner-about)
- [Development](#wrench-development)
  - [Development Environment](#nut_and_bolt-development-environment)
  - [File Structure](#file_folder-file-structure)
  - [Build](#hammer-build)
  - [Deployment](#rocket-deployment)

## :beginner: About

APP_NAME adalah

## :wrench: Development

Below you can find about development environment, file structure, build, and deployment

### :nut_and_bolt: Development Environment

There is two environment in APP_NAME such as DEV and PROD.
you can put the env on APP_NAME project folder > env

```
├── env
│ ├── dev.env
│ └── prod.env`
```

in the .env you can fill in the required variables as below:

```
API_URL=
X_APITOKEN=

```

### :file_folder: File Structure

Below is the main structure folder of the mobile APP_NAME project

```
.
├── lib
│   ├── app
│   │   ├── data
│   │   │   ├── models
│   │   │   │   └── features (ex: article)
│   │   │   │       │── request
│   │   │   │       └── response
│   │   │   │── repositories
│   │   │   └── services
│   │   ├── modules
│   │   │   └── features (ex: article)
│   │   │       │── bindings
│   │   │       │── controllers
│   │   │       └── views
│   │   └── routes
│   ├── core
│   │   ├── base
│   │   ├── constant
│   │   ├── database
│   │   ├── extensions
│   │   ├── network
│   │   │   ├── clients
│   │   │   ├── exceptions
│   │   │   └── interfaces
│   │   ├── themes
│   │   └── widgets
│   ├── translations
│   └── utils
```

### :hammer: Build

When building apk, aab, or ipa we use the build.sh script

To build APK file :

```
./build.sh apk app_release lib/main_app_staging.dart dev
./build.sh apk app_release lib/main_app_release.dart prod
```

To build AAB file :

```
./build.sh appbundle app_release lib/main_app_release.dart dev
./build.sh appbundle app_release lib/main_app_release.dart prod
```

To build IPA file :

```
./build.sh ipa app_release lib/main_app_release.dart dev
./build.sh ipa app_release lib/main_app_release.dart prod
```

additionally use can add --release or --debug on end of the script above.

To build with FVM :

```
./build.sh ipa app_release lib/main_app_release.dart dev --debug fvm
./build.sh ipa app_release lib/main_app_release.dart prod --release fvm

./build.sh appbundle app_release lib/main_app_release.dart dev --debug fvm
./build.sh appbundle app_release lib/main_app_release.dart prod --release fvm
```

for more details you can see the script on ./build.sh

### :rocket: Deployment

The first few stages of our deployment are generating aab and ipa pointing to DEV then deploying to internal testing playstore and test flight apple.

after DEV has successfully passed the testing process, then we start to generate aab and ipa pointing to PROD then deploy to internal testing playstore and test flight apple.

after PROD has successfully passed the testing process, we must submit both to the playstore and appstore

```
For deploying to testflight we use "Transporter", you can upload the ipa file to Transporter App in Mac
```
