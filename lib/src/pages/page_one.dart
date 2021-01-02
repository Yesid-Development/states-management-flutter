import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/src/models/user.dart';
import 'package:state_management/src/services/user_service.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                userService.removeUser();
              },
            ),
            padding: EdgeInsets.only(right: 10),
          ),
        ],
      ),
      body: userService.ifUserExist
          ? UserInfo(user: userService.getUser)
          : Center(child: Text('No hay información del usuario')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () => Navigator.pushNamed(context, 'pageTwo'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;

  UserInfo({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...user.professions.map(
            (profession) => ListTile(title: Text(profession)),
          )
        ],
      ),
    );
  }
}
