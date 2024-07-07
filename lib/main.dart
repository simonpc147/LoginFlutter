import 'package:flutter/material.dart';
import 'package:notification/student_registration/student_registration_controllers/first_view_controller.dart';
import 'package:notification/student_registration/student_registration_page/first_view_page.dart';
import 'package:notification/student_registration/student_registration_page/mail_validation_page.dart';
import 'package:notification/student_registration/student_registration_page/retry_page.dart';
import 'package:notification/student_registration/student_registration_page/second_view_page.dart';
import 'package:notification/student_registration/student_registration_page/successful_validation_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirstViewController()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "first_view",
      onGenerateRoute: (route) {
        switch (route.name) {
          case 'first_view':
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const FirstViewPage(),
              settings: route,
              transitionsBuilder: (_, a, ___, c) => FadeTransition(
                opacity: a,
                child: c,
              ),
            );

          case 'second_view':
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const SecondViewPage(),
              settings: route,
              transitionsBuilder: (_, a, ___, c) => FadeTransition(
                opacity: a,
                child: c,
              ),
            );

          case 'mail_validation':
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const MailValidationPage(),
              settings: route,
              transitionsBuilder: (_, a, ___, c) => FadeTransition(
                opacity: a,
                child: c,
              ),
            );

          case 'retry':
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const RetryPage(),
              settings: route,
              transitionsBuilder: (_, a, ___, c) => FadeTransition(
                opacity: a,
                child: c,
              ),
            );

          case 'successful':
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const SuccessfulValidationPage(),
              settings: route,
              transitionsBuilder: (_, a, ___, c) => FadeTransition(
                opacity: a,
                child: c,
              ),
            );

          default:
            return null;
        }
      },
    );
  }
}
