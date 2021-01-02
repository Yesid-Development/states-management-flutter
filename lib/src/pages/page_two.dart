import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/src/custom/button.dart';
import 'package:state_management/src/models/user.dart';
import 'package:state_management/src/services/user_service.dart';
import 'package:toast/toast.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.ifUserExist
            ? Text('${userService.getUser.name}')
            : Text('Page Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton('Establecer Usuario', () {
              final newUser = User(
                name: 'Yesid Rodelo',
                age: 21,
                professions: ['Fullstack Developer', 'Gamer'],
              );

              userService.setUser = newUser;
            }),
            customButton('Cambiar Edad', () {
              final age = 19;

              userService.getUser != null
                  ? userService.changeAge(age)
                  : Toast.show(
                      'No hay usuario establecido',
                      context,
                      duration: Toast.LENGTH_LONG,
                    );
            }),
            customButton('Añadir Profesion', () {

              userService.getUser != null
                  ? userService.addProfession()
                  : Toast.show(
                      'No hay usuario establecido',
                      context,
                      duration: Toast.LENGTH_LONG,
                    );
            }),
          ],
        ),
      ),
    );
  }
}
