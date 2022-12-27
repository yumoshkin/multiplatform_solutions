import 'package:flutter/material.dart';

import 'package:flutter_app_4/models/person.dart';
import 'package:flutter_app_4/widgets/app_menu.dart';
import 'package:flutter_app_4/widgets/person_grid.dart';

class WideLayout extends StatelessWidget {
  const WideLayout({Key? key, required this.persons}) : super(key: key);
  final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: AppMenu(),
        ),
        Expanded(
          flex: 3,
          child: PersonGrid(persons: persons),
        ),
      ],
    );
  }
}
