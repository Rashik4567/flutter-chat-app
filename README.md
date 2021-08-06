# chatapp

A flutter chatapp frontend.
> :warning: This app uses firebase for working. Make sure you have a firebase console account before running this app.

## Requirements
- Flutter installed.  
- Android studio installed for working on android.  
- Xcode installed for working on ios and mac.  
- Flutter doctor all satisfied.
- Firebase account (free or paid both works.)

## Instalation
The installation is same as all flutter projects with additional steps for firebase. Steps below:  
- Clone the project either with command line or just download the zip and extract it.  
- Open a command line window and cd into the project.  
- Run pub get to install dependencies `$ flutter pub get`.  
- Go to your firebase console (https://console.firebase.google.com/). [see the video at the bottom of this file for more details]
- Create a new app and go to its dashboard.
- From dashboard, click on the android setup (android icon).
- Fill the package name with the name in `<project_dir>/android/app/build.gradle [line: 37]` (You can change it as you wish).
- Click next and it will give you a file called `google-services.json`. Place it inside `<project_dir>/android/app/`.
- Click next to all the remining sections as the rest of the work is already done.
- Launch your emulator or plug in your device with usb debugging enabled.  
- Run the app in debug mode with `$ flutter run`.

## Production build
Make sure you followed the steps on **installation**.  
- Open a terminal window and cd into the project folder if you haven't done already.  
- Run flutters build command to build in your preferred platform `$ flutter build apk` replace `apk` with your platrform.  
- When its done it will show the output directory you can find it on that directory (default is: <project_dir>/build/app/outputs/<your platform>/release/.  

See this video for more details on flutter and firebase setup. https://www.youtube.com/watch?v=Wa0rdbb53I8
