// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SingleDataWidget extends StatelessWidget {

  final double paddingSize;
  final String textData;
  final double? fontSize;


  const SingleDataWidget({
    Key? key,
    required this.paddingSize,
    required this.textData,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingSize),
      child: Text(
        textData,
        style: TextStyle(fontSize: fontSize ?? 20),
        ),
      );
  }
}
