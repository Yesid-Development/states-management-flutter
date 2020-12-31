import 'package:meta/meta.dart';

class User {
  String name;
  int age;
  List<String> profession;

  User({ @required this.name, this.age, this.profession})
  : assert ( name != null );
}
