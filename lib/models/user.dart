// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? name;
  int? age;
  List<String> professions;

  User({
    this.name,
    this.age,
    this.professions = const [],
  });
}
