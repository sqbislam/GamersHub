import 'package:flutter/material.dart';
import 'package:gamers_hub/components/common/regular_form_button.dart';
import 'package:gamers_hub/components/common/regular_form_textfield.dart';
import 'package:gamers_hub/controllers/auth_controller.dart';
import 'package:gamers_hub/core/routes.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController.to;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                  Constants.kdefaultPadding,
                  Constants.kdefaultPadding * 8,
                  Constants.kdefaultPadding,
                  Constants.kdefaultPadding * 4),
              child: Text(
                "Register",
                style: GoogleFonts.comfortaa(),
                textScaleFactor: 2.5,
              ),
            ),
            RegularFormTextField(
              hintText: "Enter your Name",
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
              prefixIcon: Icons.email_sharp,
            ),
            RegularFormTextField(
              hintText: "Enter your Email",
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              prefixIcon: Icons.email_sharp,
            ),
            RegularFormTextField(
              hintText: "Enter your password",
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
                return null;
              },
              prefixIcon: Icons.vpn_key,
            ),
            RegularFormTextField(
              hintText: "Re-type your password",
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
                return null;
              },
              prefixIcon: Icons.vpn_key,
            ),
            RegularFormButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  authController.signInWithEmailAndPassword(context);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Logging In...')));
                }
              },
            ),
            SizedBox(
              height: Constants.kdefaultPadding * 4,
            ),
            Padding(
                padding: EdgeInsets.all(Constants.kdefaultPadding * 2),
                child: Text(
                  "Or, Register with your Socials".toUpperCase(),
                  style: GoogleFonts.comfortaa()
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  textScaleFactor: 0.9,
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInButton.mini(
                    buttonType: ButtonType.google,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      print('Google Sign In');
                    }),
                SignInButton.mini(
                    buttonType: ButtonType.facebook,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      print('Facebook Sign In');
                    }),
                SignInButton.mini(
                    buttonType: ButtonType.apple,
                    buttonSize: ButtonSize.large,
                    onPressed: () {
                      print('Apple Sign In');
                    }),
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    vertical: Constants.kdefaultPadding * 2,
                    horizontal: Constants.kdefaultPadding),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Already have an an account?",
                      style: GoogleFonts.comfortaa(),
                      textAlign: TextAlign.end,
                      textScaleFactor: 0.9),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.Login);
                      },
                      child: Text("Login",
                          style: GoogleFonts.comfortaa().copyWith(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                          textScaleFactor: 1.1))
                ])),
          ],
        ),
      ),
    ));
  }
}
