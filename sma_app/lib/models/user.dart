import 'package:sma_app/models/tagable.dart';

class SMAUser {
  final int id;
  final String firstName;
  final String lastName;
  final String description;
  final DateTime dateOfBirth;
  final String hometown;
  final List<TagAble> hobbies;
  final List<TagAble> attributes;
  final List<TagAble> skills;
  final String sex;

  SMAUser(this.hobbies, this.firstName, this.lastName, this.description, this.dateOfBirth, this.hometown, this.id, this.attributes, this.skills, this.sex);
}
