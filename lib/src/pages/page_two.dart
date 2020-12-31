import 'package:flutter/material.dart';
import 'package:state_management/src/custom/button.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton('Establecer Usuario', () => {}),
            customButton('Cambiar Edad', () => {}),
            customButton('Añadir Profesion', () => {}),
          ],
        ),
      ),
    );
  }
}