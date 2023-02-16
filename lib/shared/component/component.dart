

import 'package:flutter/material.dart';

void navigateAndFinish (
    context,
    Widget,
    ) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
      builder: (context) => Widget
  ),
      (route) => false,
);

void navigateTo(context,widget) =>  Navigator.push(
  context   ,
  MaterialPageRoute(
    builder: (context) => widget ,

  ),
);
