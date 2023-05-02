import 'package:alora/model/user_firbase.dart';
import 'package:alora/screens/splash/splash_screen.dart';
import 'package:alora/services/auth_service.dart';
import 'package:alora/services/google_sign_in_provider.dart';
import 'package:alora/style/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      value: AuthServices().users,
      initialData: Users(),
      child: ChangeNotifierProvider(
        create: (context) => GoogleSignInProveder(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const ScreenSplash(),
          theme: ThemeData(
            textTheme: const TextTheme(
              titleMedium: TextStyle(
                  color: color5, fontSize: 16), // default TextField input style
            ),
            brightness: Brightness.dark,
          ),
        ),
      ),
    );
  }
}
