import 'package:flutter/material.dart';

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    Key? key,
    this.isFilled = true,
    required this.press,
    required this.text,
  }) : super(key: key);

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Theme.of(context).accentColor, width: 2.0),
        ),
        elevation: isFilled ? 2 : 0,
        color: isFilled ? Theme.of(context).accentColor : Colors.transparent,
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            color: isFilled ? Colors.white : Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
