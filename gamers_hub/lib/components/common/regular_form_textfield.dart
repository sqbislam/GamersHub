import 'package:flutter/material.dart';
import 'package:gamers_hub/theme/constants.dart';

class RegularFormTextField extends StatelessWidget {
  const RegularFormTextField(
      {Key? key,
      TextEditingController? controller,
      IconData? prefixIcon,
      String hintText = "Default Hint",
      bool obscureText = false,
      void Function(String?)? onSaved,
      String? Function(String?)? validator})
      : _controller = controller,
        _prefixIcon = prefixIcon,
        _hintText = hintText,
        _obscureText = obscureText,
        _validator = validator,
        _onSaved = onSaved,
        super(key: key);

  final TextEditingController? _controller;
  final IconData? _prefixIcon;
  final String? _hintText;
  final bool _obscureText;
  final String? Function(String?)? _validator;
  final void Function(String?)? _onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Constants.kdefaultPadding,
          horizontal: Constants.kdefaultPadding),
      child: TextFormField(
        controller: _controller ?? null,
        obscureText: _obscureText,
        onSaved: _onSaved,
        decoration: InputDecoration(
            hintText: _hintText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: Colors.white, width: 2.0),
            ),
            prefixIcon: _prefixIcon != null
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8.0),
                    child: Icon(
                      _prefixIcon, // myIcon is a 48px-wide widget.
                    ))
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            fillColor: Colors.white,
            hoverColor: Colors.blueGrey),
        validator: _validator,
      ),
    );
  }
}
