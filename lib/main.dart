import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/src/routes/routes.dart';
import 'package:state_management/src/services/user_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UserService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pageOne',
        routes: getRoutes(),
        theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        })),
      ),
    );
  }
}
