import 'package:firebase/firebase_service.dart';
import 'package:firebase/screens/auth_screen.dart';
import 'package:firebase/screens/user_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseService().onListenUser((user) {
      if (user == null) {
        Navigator.push(kNavigatorKey.currentContext!,
            MaterialPageRoute(builder: (_) {
          return const AuthScreen();
        }));
      } else {
        Navigator.push(kNavigatorKey.currentContext!, MaterialPageRoute(
          builder: (_) {
            return UserInfoScreen(
              user: user,
            );
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: kNavigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthScreen(),
    );
  }
}
