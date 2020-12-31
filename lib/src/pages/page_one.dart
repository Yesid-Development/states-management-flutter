import 'package:flutter/material.dart';
import 'package:state_management/src/models/user.dart';
import 'package:state_management/src/services/user_service.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page One'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? UserInfo(snapshot.data)
              : Center(child: Text('No hay informacion del usuario'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () => Navigator.pushNamed(context, 'pageTwo'),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final User user;
  final String name = 'Nunz';

  const UserInfo(this.user);

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
          ListTile(title: Text('Profesion 1: ')),
          ListTile(title: Text('Profesion 1: ')),
          ListTile(title: Text('Profesion 1: ')),
        ],
      ),
    );
  }
}
