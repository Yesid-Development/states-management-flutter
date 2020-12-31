import 'package:flutter/material.dart';
import 'package:state_management/src/pages/page_one.dart';
import 'package:state_management/src/pages/page_two.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder> {
    'pageOne' : (BuildContext context) => PageOne(),
    'pageTwo' : (BuildContext context) => PageTwo(),
  };
}