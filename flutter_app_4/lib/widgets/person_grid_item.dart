import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import 'package:flutter_app_4/models/person.dart';
import 'package:flutter_app_4/widgets/popover_menu.dart';

class PersonGridItem extends StatelessWidget {
  const PersonGridItem({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => const PopOverMenu(),
          direction: PopoverDirection.bottom,
          width: 200,
          height: 154,
          arrowHeight: 15,
          arrowWidth: 30,
          backgroundColor: Colors.teal[50]!,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.cyan[300],
        margin: const EdgeInsets.all(8),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(person.image),
              ),
              // SizedBox(height: 8),
              Text(
                person.name,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                person.email,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
