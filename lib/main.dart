import 'package:flutter/material.dart';

import 'core/services/service_locator.dart';
import 'core/utils/app_strings.dart';
import 'movies/presentation/screens/6.2 movies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:AppString.appTitle ,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              bodyText1: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white))),
      home: const MoviesScreen(),
    );
  }
}
