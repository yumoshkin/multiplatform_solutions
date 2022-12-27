import 'package:flutter_app_4/models/person.dart';

final List<Person> persons = List.generate(20, (index) {
  return Person(
    id: index,
    name: 'Ivan Ivanov',
    email: 'ivanov${index + 1}@mail.ru',
    image: 'assets/images/man.jpg',
  );
});

class PersonService {
  Future<List<Person>>? getAll() async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return persons;
  }

  Future<Person>? getById(int id) async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return persons[id];
  }
}
