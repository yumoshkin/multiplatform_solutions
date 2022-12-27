import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

CupertinoActionSheetAction bottomSheetMenuItem({
  required BuildContext context,
  required String title,
  required IconData icon,
}) {
  return CupertinoActionSheetAction(
    child: Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
