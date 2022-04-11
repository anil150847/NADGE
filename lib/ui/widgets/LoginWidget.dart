import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../ui/widgets/HomeWidget.dart';
import '../../ui/widgets/SignUpWidget.dart';
import 'ForgotPasswordWidget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding:
                      const EdgeInsets.only(left: 20, right: 24, top: 8, bottom: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: const Color(0xff603192))),
                  alignment: Alignment.topRight,
                  width: 100,
                  child: const Text('Signup',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff603192),
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
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
                      'Welcome Back!',
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
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordWidget(
                                          title: 'Forgot password',
                                        )),
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xff603192)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(26.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 100,
                          height: 30,
                          child: ElevatedButton(
                            child: const Text('Login'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeWidget(
                                          title: 'Nudj - Home',
                                        )),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff603192),
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                  color: Colors.transparent,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _mLoginWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Container(
              height: 100,
              alignment: Alignment.topLeft, // This is needed
              child: Image.asset(
                'assets/images/logo-full.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width / 1.5,
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
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.grey,
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
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            height: 20,
            color: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: TextFormField(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForgotPasswordWidget(
                              title: 'Forgot password',
                            )),
                  );
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            color: Colors.transparent,
          ),
          ElevatedButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeWidget(
                          title: 'Nudj - Home',
                        )),
              );
            },
            style: ElevatedButton.styleFrom(
                primary: const Color(0xff603192),
                padding:
                    const EdgeInsets.symmetric(horizontal: 135, vertical: 10),
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
                text: 'Don\'t have an account? ',
                style: const TextStyle(
                  color: Colors.grey,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'SignUp',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpWidget(
                                    title: 'Sign Up',
                                  )),
                        );
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
    );
  }
}
