## Getting Started

This folder contains to source code for interview mobile application, an application that users sign up and increment a counter.

## How to Run 

**Step 1:**

Follow to steps ton set up flutter on your machine.
https://flutter.dev/docs/get-started/install


**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
flutter run
```


## What to know 

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- assets
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- theme/
|- models/
|- screens/
|- services/
|- widgets/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- themes - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `app colors`.
2- models - Contains the models classes to represent data and functionality.
3- screens - Contains all the ui of the project, contains sub directory for each screen.
4- service — Contains all the api calls of the project, contains sub directory for each module.
5- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
6- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### themes

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
constants/
|- theme.dart
```

### screens

This directory contains all the ui of the application. Each screen is located in a separate folder making it easy to combine group of files related to that particular screen. All the screen specific widgets will be placed in `widgets` directory as shown in the example below:

```
screens/
|- about/
   |- page/
   |- widgets/
|- auth/
   |- login/
   |- register/
|- home/
   |- page/
   |- widgets/
```

### services

Contains the API calls used in the project. The folder structure is as follows: 

```
services/
    |- authentication.dart
    |- database.dart
```

### Widgets

Contains the common widgets that are shared across multiple screens. For example, Button, TextField etc.

```
widgets/
|- snackbar.dart
```

## Conclusion

I will be happy to answer any questions that you may have, and if you want to lend a hand with the project then please feel free to submit an issue and/or pull request 🙂

