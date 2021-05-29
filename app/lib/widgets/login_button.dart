import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const LoginButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 140,
        child: Center(
            child: Text(title,
                style: TextStyle(fontSize: 20, color: Colors.white))),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(26)),
      ),
    );
  }
}
