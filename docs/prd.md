# Product Requirements Document (PRD)

Describes general requirements for the app, its architecture and core elements that are shared among different projects.
See **./specific/specific_requirements.md** to get specific requirements.

## 1. Overview

A mobile android-only Flutter app. The type of the app and type-specific requirements are described.

I do not need any iOS parts.

## 2. Core Features

## Visual style

See **visual_style.md** file for colors. Create an app theme class and use it to set colors, widgets styles across the app. Avoid hardcoding colors in the rest of the app.

Update pubspec to use the variable font file I placed into assets/fonts/. Scan the folder to see the font file name.

### Localization

- App default language is EN.

### Widgets
Create widgets for dialogs and buttons so they can be reused across the app.

### Navigation

- Use a basic Flutter router
- Each screen is self-contained

### Architecture & Best Practices
- Feature-first folder structure
- No direct dependencies between features/screens
- **Hide all logs in release builds**
- Save user made changes in app storage

### Android Manifest
All necessary permissions are already added. No need to add additional ones.

### Flutter packages
- Use the latest package versions available.
- Regularly check if packages need to be updated with "flutter pub outdated"
- Downgrade packages version only if meet compatibility issues

### Testing
Run 'flutter build apk --debug' if necessary to check build errors. Don't run the app with 'flutter run', I will run it manually.

### App Flow
- On app start init privacy_plugin. READ privacy_plugin's readme for more details.
- After you get user id from privacy_plugin, init Appmetrica if [APPMETRICA_SDK_KEY] is set in build.gradle.kts
- After plugin init, show Main screen

## 3. Screens

All screens must use Material design components and theming. Show any screen or a dialog only after MaterialApp is initialized and localization system is ready. Don't show any screen or dialog before that.

Navigation options:
- Don't show navigation in the Main screen, Loading screen
- In the subscreens opened from the Main screen use close button (a square with X on it) placed in the top right corner
- Check ./specific/specific_requirements.md for possible additional instructions on navigation UI.

Don't show app name anywhere on the screens.

### Background widgets
Create 2 types of background widgets: one for game screen (game backgrounds) and one for the rest of the screens (general backgrounds).

General backgrounds files: assets/images/backs/
On each app launch show a random background from the list in the general background widget.

Game background files and the rules of handling game background widget are described in **./specific/specific_requirements.md**.

Display backgrounds using BoxFit.cover.

Make sure to update the background widget when the background is changed.

In case Flame engine package is used in some screens, make sure to TURN OFF it's own background so it wouldn't hide the background widget.

### 3.1 Main Screen
The main hub for the rest of the screens.

UI elements:
- Start button at the bottom of the screen. See **./specific/specific_requirements.md** for the button behaviuor.
- settings icon at the top right corner, opens Settings dialog.

DO NOT add any additional logos, labels etc.

#### Settings Dialog

In debug builds show a section that allows to change the general background. Allow to choose one of the backgrounds to be displayed in the background widget. Update the general background widget on background selection.

#### Back button behavior
If user taps android back button while on the Main Screen then show app quit confirmation dialog. Quit the app on confirmation.

### 3.2 Loading Screen
- animated spinner
- a text string, informing the user that app is being loaded
- Shown during app initialization

DO NOT add any additional logos, labels etc.