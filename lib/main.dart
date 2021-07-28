import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'helper/provider_helper.dart';
import 'screens/about/page/about_page.dart';
import 'screens/auth/login/page/login_page.dart';
import 'screens/auth/register/page/register_page.dart';
import 'screens/home/page/home_page.dart';
import 'screens/profile/page/profile_page.dart';
import 'screens/welcome/splash/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then(
    (_) => runApp(
      MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => ProviderState())],
          child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New Startup',
      theme: ThemeData(fontFamily: 'OpenSans'),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage(),
        ProfilePage.id: (context) => ProfilePage(),
        AboutPage.id: (context) => AboutPage(),
      },
    );
  }
}
