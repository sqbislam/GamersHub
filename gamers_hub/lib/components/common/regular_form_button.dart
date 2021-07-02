import 'package:flutter/material.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';

class RegularFormButton extends StatelessWidget {
  const RegularFormButton(
      {Key? key,
      required GlobalKey<FormState> formKey,
      Color? fillColor,
      Color? textColor,
      String? pageRouteOnSuccess})
      : _formKey = formKey,
        _fillColor = fillColor,
        _textColor = textColor,
        _pageRouteOnSuccess = pageRouteOnSuccess,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Color? _fillColor;
  final Color? _textColor;
  final String? _pageRouteOnSuccess;

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
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (_formKey.currentState!.validate()) {
            // Process data.
            _pageRouteOnSuccess != null
                ? Get.offAllNamed(_pageRouteOnSuccess!)
                : null;
          }
        },
        child: Text(
          'Submit',
          style:
              TextStyle(color: _textColor != null ? _textColor : Colors.black),
        ),
      ),
    );
  }
}
