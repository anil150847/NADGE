import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(widget.title),
        ),
        backgroundColor: const Color(0xff603192),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 40,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300,
                alignment: Alignment.center, // This is needed
                child: Image.asset(
                  'assets/images/forgot_password_logo.png',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Forgot \nPassword?',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
            Container(
              height: 10,
              color: Colors.transparent,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Don’t worry its happens. please enter the\naddress associated with your account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Container(
              height: 10,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email/Phone Number',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              height: 20,
              color: Colors.transparent,
            ),
            ElevatedButton(
              child: const Text('Reset Password'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff603192),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 20,
              color: Colors.transparent,
            ),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                      style: const TextStyle(
                        color: Color(0xff603192),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

}
