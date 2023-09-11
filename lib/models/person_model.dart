class Person {
  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
  });

  final String id;
  final String name;
  final int age;
  final Gender gender;
}

enum Gender { male, female }
