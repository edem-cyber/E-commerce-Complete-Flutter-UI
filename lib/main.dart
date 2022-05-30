import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saharago_b2b/providers/AuthProvider.dart';
import 'package:saharago_b2b/providers/UserProvider.dart';
import 'package:saharago_b2b/routes.dart';
import 'package:saharago_b2b/screens/profile/profile_screen.dart';
import 'package:saharago_b2b/screens/splash/splash_screen.dart';
import 'package:saharago_b2b/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // @override
  // void initState() {
  //   super.initState();
  //   FlutterNativeSplash.remove();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   FlutterNativeSplash.remove();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        routes: routes,
      ),
    );
  }
}
