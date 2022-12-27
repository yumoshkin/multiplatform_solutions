import 'package:flutter/cupertino.dart';

import 'package:flutter_app_4/widgets/bottom_sheet_menu_item.dart';

Route<void> bottomSheetMenu(BuildContext context, Object? arguments) {
  return CupertinoModalPopupRoute<void>(
    builder: (BuildContext context) {
      return CupertinoActionSheet(
        actions: <CupertinoActionSheetAction>[
          bottomSheetMenuItem(
            context: context,
            title: 'VIEW PROFILE',
            icon: CupertinoIcons.person_fill,
          ),
          bottomSheetMenuItem(
            context: context,
            title: 'FRIENDS',
            icon: CupertinoIcons.person_2_fill,
          ),
          bottomSheetMenuItem(
            context: context,
            title: 'REPORT',
            icon: CupertinoIcons.doc_text,
          ),
        ],
      );
    },
  );
}
