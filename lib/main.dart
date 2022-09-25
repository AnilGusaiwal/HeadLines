import 'package:flutter/material.dart';
import 'package:headlines/splashScreen.dart';
import 'package:provider/provider.dart';

import 'allnews.dart';
import 'newsProvider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NewsProvider>(
          create: (context) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
       
        debugShowCheckedModeBanner: false,
           home: SplashScreen(),
         
      ),
    );
  }
}
