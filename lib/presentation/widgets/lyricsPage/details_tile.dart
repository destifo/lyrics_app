import 'package:flutter/material.dart';

class DetailsTile extends StatelessWidget {
  final String title;
  final String detail;

  DetailsTile(this.title, this.detail, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(
          detail,
          style: TextStyle(
            fontSize: 21,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
