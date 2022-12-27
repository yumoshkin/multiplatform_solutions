import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app_4/widgets/popover_menu_item.dart';

class PopOverMenu extends StatelessWidget {
  const PopOverMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: const [
          PopOverMenuItem(
            title: 'VIEW PROFILE',
            icon: CupertinoIcons.person_fill,
          ),
          Divider(thickness: 2, height: 2, color: Colors.black54),
          PopOverMenuItem(
            title: 'FRIENDS',
            icon: CupertinoIcons.person_2_fill,
          ),
          Divider(thickness: 2, height: 2, color: Colors.black54),
          PopOverMenuItem(
            title: 'REPORT',
            icon: CupertinoIcons.doc_text,
          ),
          // const Divider(),
        ],
      ),
    );
  }
}
