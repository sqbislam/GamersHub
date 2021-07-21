import 'package:flutter/material.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';

class RegularFormButton extends StatelessWidget {
  const RegularFormButton(
      {Key? key,
      Color? fillColor,
      Color? textColor,
      required void Function()? onPressed,
      String? pageRouteOnSuccess})
      : _fillColor = fillColor,
        _textColor = textColor,
        onPressed = onPressed,
        super(key: key);

  final Color? _fillColor;
  final Color? _textColor;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: Constants.kdefaultPadding,
          horizontal: Constants.kdefaultPadding),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(_fillColor ?? Colors.white),
        ),
        onPressed: onPressed,
        child: Text(
          'Submit',
          style:
              TextStyle(color: _textColor != null ? _textColor : Colors.black),
        ),
      ),
    );
  }
}
