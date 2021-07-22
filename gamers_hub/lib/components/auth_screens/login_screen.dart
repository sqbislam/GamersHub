import 'package:flutter/material.dart';
import 'package:gamers_hub/components/common/regular_form_button.dart';
import 'package:gamers_hub/components/common/regular_form_textfield.dart';
import 'package:gamers_hub/controllers/auth_controller.dart';
import 'package:gamers_hub/core/routes.dart';
import 'package:gamers_hub/helpers/validator.dart';
import 'package:gamers_hub/theme/constants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_button/sign_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "Login",
                style: GoogleFonts.comfortaa(),
                textScaleFactor: 2.5,
              ),
            ),
            RegularFormTextField(
              hintText: "Enter your Email",
              controller: authController.emailController,
              validator: Validator().email,
              prefixIcon: Icons.email_sharp,
              onSaved: (value) => authController.emailController.text = value!,
            ),
            RegularFormTextField(
              hintText: "Enter your password",
              controller: authController.passwordController,
              obscureText: true,
              prefixIcon: Icons.vpn_key,
              onSaved: (value) =>
                  authController.passwordController.text = value!,
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
                  "LOGIN WITH YOUR SOCIALS",
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
                    vertical: Constants.kdefaultPadding * 3,
                    horizontal: Constants.kdefaultPadding),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text("Do not have an account?",
                      style: GoogleFonts.comfortaa(),
                      textAlign: TextAlign.end,
                      textScaleFactor: 0.9),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.Register);
                      },
                      child: Text("Register",
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
