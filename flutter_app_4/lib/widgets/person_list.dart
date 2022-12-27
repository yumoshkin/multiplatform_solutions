import 'package:flutter/material.dart';

import 'package:flutter_app_4/models/person.dart';
import 'package:flutter_app_4/widgets/person_list_item.dart';

class PersonList extends StatelessWidget {
  const PersonList({Key? key, required this.persons}) : super(key: key);
  final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) => PersonListItem(person: persons[index]),
      ),
    );
  }
}
