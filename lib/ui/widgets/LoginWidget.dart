import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../ui/widgets/HomeWidget.dart';
import '../../ui/widgets/SignUpWidget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _passwordIsObscure = true;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.blueAccent),
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
      ),
    );
  }
}
