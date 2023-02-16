import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:udemy_flutter/shared/style/themes.dart';

import 'modules/on_boarding/on_boarding.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{

Widget build(BuildContext context)
{
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    darkTheme:darkTheme ,

    home: OnBoardingScreen(),
  );
}

}




