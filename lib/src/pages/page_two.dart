import 'package:flutter/material.dart';
import 'package:state_management/src/custom/button.dart';
import 'package:state_management/src/models/user.dart';
import 'package:state_management/src/services/user_service.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('${snapshot.data.name}')
                : Text('Page two');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton('Establecer Usuario', () {

              final newUser = new User(name: 'Yesid Rodelo', age: 21);

              userService.loadUser(newUser);
            }),
            customButton('Cambiar Edad', () {
              final int age = 20;

              userService.changeAge(age);
            }),
            customButton('Añadir Profesion', () {}),
          ],
        ),
      ),
    );
  }
}
