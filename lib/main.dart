import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MVC/Controller/login_controller.dart';
import 'MVC/Veiw/auth/login_screen.dart';
import 'MVVM/View/auth/login_screen.dart';
import 'MVVM/ViewModel/login_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home:LoginScreenMvvM()
    );
  }
}

