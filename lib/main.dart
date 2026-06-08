import 'package:abc_bank/providers/auth_provider.dart';
import 'package:abc_bank/providers/curd_transaction.dart';
import 'package:abc_bank/providers/data_provider.dart';
import 'package:abc_bank/screen/starting_screen/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snow_fall_animation/snow_fall_animation.dart';
import 'firebase_options.dart';
import 'notification_service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  await NotificationService.requestPermission();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Provider.debugCheckInvalidValueType =null;
  runApp(
    MultiProvider(
      providers: [Provider(create: (c) => AuthProvider()),Provider(create: (e)=> DataProvider()),Provider(create: (e)=> CurdTransaction())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ABC Bank',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff075c36),
          onPrimary: Color(0xff059f6c),
          secondary: Color(0xff1a7708),
          onSecondary: Color(0xff070c07),
          error: Color(0xfffd0505),
          onError: Color(0x84d30a0a),
          surface: Color(0xfff6f8f7),
          onSurface: Color(0xff1a4335),
        ),
      ),
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            IgnorePointer(
              child: SnowFallAnimation(
                config: SnowfallConfig(
                  numberOfSnowflakes: 50,
                  speed: 0.5,
                  useEmoji: true,
                  customEmojis: ['❄️', '❅', '❆'],
                  windForce: 0.2,
                ),
              ),
            ),
          ],
        );
      },
      home: WelcomePage(),
    );
  }
}
