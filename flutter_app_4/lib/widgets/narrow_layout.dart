import 'package:flutter/material.dart';

import 'package:flutter_app_4/models/person.dart';
import 'package:flutter_app_4/widgets/app_menu.dart';
import 'package:flutter_app_4/widgets/person_list.dart';

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({Key? key, required this.persons}) : super(key: key);
  final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const AppMenu(),
          Expanded(
            child: PersonList(persons: persons),
          ),
        ],
      ),
    );
  }
}
