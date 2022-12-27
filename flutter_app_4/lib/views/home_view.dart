import 'package:flutter/material.dart';

import 'package:flutter_app_4/models/person.dart';
import 'package:flutter_app_4/services/person_service.dart';
import 'package:flutter_app_4/widgets/adaptive_widget.dart';
import 'package:flutter_app_4/widgets/narrow_layout.dart';
import 'package:flutter_app_4/widgets/wide_layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _personService = PersonService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Person>>(
        future: _personService.getAll(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Center(child: Text('Контент временно недоступен'));
              }

              if (snapshot.hasData) {
                return AdaptiveWidget(
                  wide: WideLayout(persons: snapshot.data),
                  narrow: NarrowLayout(persons: snapshot.data),
                );
              }

              return const Center(
                child: Text('Нет данных'),
              );
            default:
              return const Text('');
          }
        },
      ),
    );
  }
}
