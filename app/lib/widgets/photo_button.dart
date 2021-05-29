import 'package:flutter/material.dart';

import '../styles.dart';

class PhotoButton extends StatefulWidget {
  PhotoButton({required this.onTap});
  final void Function() onTap;

  @override
  _PhotoButtonState createState() => _PhotoButtonState();
}

class _PhotoButtonState extends State<PhotoButton> {
  double innerDiameter = 0.0;
  double margin = 35.0;
  double opacity = 0.5;

  void _setInitialValues() {
    innerDiameter = 0.0;
    margin = 35.0;
    opacity = 0.5;
    setState(() {});
  }

  void _setFinalValues() {
    innerDiameter = 74.0;
    margin = 2.0;
    opacity = 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        _setFinalValues();
      },
      onTapUp: (_) {
        _setInitialValues();
      },
      onTapCancel: () {
        _setInitialValues();
        widget.onTap();
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 74.0,
          minWidth: 74.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: kOrange,
              width: 2.0,
            ),
          ),
          child: AnimatedContainer(
            height: innerDiameter,
            width: innerDiameter,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: kOrange.withOpacity(opacity),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
