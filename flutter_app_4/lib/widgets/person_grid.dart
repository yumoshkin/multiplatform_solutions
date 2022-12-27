import 'package:flutter/material.dart';

import 'package:flutter_app_4/models/person.dart';
import 'package:flutter_app_4/widgets/person_grid_item.dart';

class PersonGrid extends StatelessWidget {
  const PersonGrid({Key? key, required this.persons}) : super(key: key);
  final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          ...persons.map((person) => PersonGridItem(person: person)).toList(),
        ],
      ),
    );
  }
}
