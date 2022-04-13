import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../ui/widgets/SignUpWidget.dart';
import 'ForgotPasswordWidget.dart';
import 'LoginWidget.dart';
import 'OtpVerificationWidget.dart';

class SetPasswordWidget extends StatefulWidget {
  const SetPasswordWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SetPasswordWidget> createState() => _SetPasswordWidgetState();
}

class _SetPasswordWidgetState extends State<SetPasswordWidget> {
  bool _passwordIsObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFAFF),
      body: LayoutBuilder(builder: (context, constraints) {
        // Loading views according to screen width
        if (constraints.maxWidth > 500) {
          return _wideLoginWidget();
        }
        return _mLoginWidget();
      }),
    );
  }

  _wideLoginWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 80,
                  alignment: Alignment.topLeft, // This is needed
                  child: Image.asset(
                    'assets/images/logo-full.png',
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        LoginWidget(title: 'Login')), (Route<dynamic> route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding:
                    const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: const Color(0xff603192))),
                    width: 100,
                    child: const Text('Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff603192),
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 40,
                  color: Colors.transparent,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Set Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordIsObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordIsObscure = !_passwordIsObscure;
                          });
                        },
                      ),
                    ),
                    obscureText: _passwordIsObscure,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ),
                Container(
                  height: 20,
                  color: Colors.transparent,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'The password must contain at least eight character categories among Uppercase , Lowercase characters (A-z), Digits (0-9Special characters (~! @#\$%^&*_-+=`|\(){}[]:;"\'<>,.?/)',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordIsObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordIsObscure = !_passwordIsObscure;
                          });
                        },
                      ),
                    ),
                    obscureText: _passwordIsObscure,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 140,
                      height: 40,
                      child: ElevatedButton(
                        child: const Text('Set Password',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginWidget(
                                  title: 'Login',
                                )),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff603192),
                            textStyle: const TextStyle(
                              fontSize: 16,
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _mLoginWidget() {
    return Scaffold(
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
              height: 30,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordIsObscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordIsObscure = !_passwordIsObscure;
                      });
                    },
                  ),
                ),
                obscureText: _passwordIsObscure,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Container(
              height: 20,
              color: Colors.transparent,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'The password must contain at least eight character categories among Uppercase , Lowercase characters (A-z), Digits (0-9Special characters (~! @#\$%^&*_-+=`|\(){}[]:;"\'<>,.?/)',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordIsObscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordIsObscure = !_passwordIsObscure;
                      });
                    },
                  ),
                ),
                obscureText: _passwordIsObscure,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.2,
            ),
            ElevatedButton(
              child: const Text('Set Password',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginWidget(title: 'Login',)),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff603192),
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  )),
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
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            LoginWidget(title: 'Login')), (Route<dynamic> route) => false);
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
          ],
        ),
      ),
    );
  }
}
