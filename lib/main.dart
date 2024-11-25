import 'package:flutter/material.dart';
import 'package:newsappp/controller/applenewscontroller.dart';
import 'package:newsappp/controller/bookmarkScreencontroller.dart';
import 'package:newsappp/controller/buisnessController.dart';
import 'package:newsappp/controller/localnewsController.dart';
import 'package:newsappp/controller/techcontroller.dart';
import 'package:newsappp/views/splashScreen/splashscreen.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp( MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) =>Homescreencontroller(),),
      ChangeNotifierProvider(create: (context) =>Bookmarkscreencontroller(),),
      ChangeNotifierProvider(create: (context) =>Techcontroller(),),
    
      ChangeNotifierProvider(create: (context) =>Applenewscontroller(),),
      ChangeNotifierProvider(create: (context) =>Localnewscontroller(),),
      ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashscreen(),
    );
  }
}
