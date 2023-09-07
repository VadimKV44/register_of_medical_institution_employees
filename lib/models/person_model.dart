class Person {
  Person({
    required this.name,
    required this.age,
    required this.gender,
  });

  final String name;
  final int age;
  final Gender gender;
}

enum Gender { male, female }
