// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String name;
  final int age;
  final List<String> professions;

  User({
    required this.name,
    required this.age,
    required this.professions,
  });

  User copyWith({
    String? name,
    int? age,
    List<String>? professions,
  }) =>
      User(
          name: name ?? this.name,
          age: age ?? this.age,
          professions: professions ?? this.professions);
}
