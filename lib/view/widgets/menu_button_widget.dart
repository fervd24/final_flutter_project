// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuButtonWidget extends StatelessWidget {
  const MenuButtonWidget({
    Key? key,
    required this.titleButton,
    required this.routeName,
    this.colorButton,
  }) : super(key: key);

  final String titleButton;
  final String routeName;
  final Color? colorButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: ElevatedButton(
        style: colorButton != null 
          ? ButtonStyle(backgroundColor: MaterialStatePropertyAll(colorButton))
          : null,
        onPressed: () => Navigator.of(context).pushNamed(routeName), 
        child: Text(titleButton)
        ),
    );
  }
}
