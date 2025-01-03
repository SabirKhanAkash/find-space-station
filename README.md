# Find International Space Station App

![Logo or Banner Image](https://github.com/user-attachments/assets/a25554f0-d403-48da-a12c-749a1acb4565)

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [In-App Screenshots](#in-app-screenshots)
4. [Demo Video](#demo-video)
5. [Installation](#installation)
6. [APK Download](#apk-download)
7. [Feedback](#feedback)

## Introduction

A Cross-Platform Flutter App where users log in anonymously with Firebase. Users Observe the international space station's current flying location, Date etc. If it is flying over the user's country then shows a special alert message.

## Features

- Login Anonymously with Firebase
- Auto Refreshes the location of the International Space Station every 60s
- Shows a 60s countdown timer indicating the next data update time
- User can manually get the current location by clicking on the refresh button at any time
- Shows the Space Station's current location, latitude, longitude, country, last updated time local & UTC, etc

## In-App Screenshots

<table>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/82c08ee0-aa80-4315-9791-71922197ae4b" width="270" height="570" alt="Splash Screen"/><br>
      <i>Splash Screen</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/98fb4f63-8fc6-4c02-ab09-2a8f8dd7e99d" width="270" height="570" alt="Login Screen (Loading)"/><br>
      <i>Login Screen (Loading)</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/81b87c54-f560-4bb5-986c-4f183762df22" width="270" height="570" alt="Login Screen (Login Success)"/><br>
      <i>Login Screen (Login Success)</i>
    </td>
  </tr>
  <tr>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/004056cc-cd55-4806-a548-469a72fd3782" width="270" height="570" alt="Home Screen"/><br>
      <i>Home Screen</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/d49a38e4-0fd6-4864-8e64-4eaa5d564782" width="270" height="570" alt="Space Station on User's Country"/><br>
      <i>Space Station on User's Country</i>
    </td>
    <td style="text-align: center;">
      <img src="https://github.com/user-attachments/assets/6fe7ebd1-f737-44b5-bde3-56a512a60520" width="270" height="570" alt="Space Station on Unknown Country/Region"/><br>
      <i>Space Station on Unknown Country/Region</i>
    </td>
  </tr>
</table>

## Demo Video

[![Watch the video](https://github.com/user-attachments/assets/be4e4ce0-de51-4849-8fb3-462fcec9f75d)](https://github.com/user-attachments/assets/be4e4ce0-de51-4849-8fb3-462fcec9f75d)

## Installation

### Prerequisites

- [Flutter SDK v3.24.5](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip)
- [Dart SDK v3.5.4](https://storage.googleapis.com/dart-archive/channels/stable/release/3.5.4/sdk/dartsdk-windows-x64-release.zip)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/download)

### Steps

1. Clone the repository
   ```bash
   git clone https://github.com/SabirKhanAkash/find-space-station.git
2. Go to the project directory
   ```bash
   cd find-space-station
3. Open the project in Android Studio
4. Run an Android Emulator
5. Install the necessary dependencies by running these commands in the terminal from the project
   directory
   ```bash
   flutter clean
   flutter pub get
   flutter run --release
6. Test and Explore the App in Emulator
7. To Generate the release build APK, run these commands in the terminal from the project directory
   ```bash
   flutter clean
   flutter pub get
   flutter build apk --release --split-per-abi

Then go to this directory find-space-station\build\app\outputs\flutter-apk\
three version of apk will be there 
1. app-arm64-v8a-release.apk (Recommended)
2. app-armeabi-v7a-release.apk (Recommended for older phones)
3. app-x86_64-release.apk (Use for Android Emulator)

## APK Download

Download the APK file
from [here](https://github.com/SabirKhanAkash/find-space-station/tree/master/dist)

## Feedback

If you discover any bugs or any kind of feedback then create
issues [here](https://github.com/SabirKhanAkash/find-space-station/issues/new) & star the repo if you
like the project
