import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<SignUpWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpWidget> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              height: 40,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'First Name',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              height: 20,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Last Name',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              height: 20,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Phone',
                ),
                keyboardType: TextInputType.phone,
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
                  labelText: 'Date of Birth',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.calendar_today,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Show date picker'),
                      ));
                    },
                  ),
                ),
                keyboardType: TextInputType.none,
              ),
            ),
            Container(
              height: 25,
              color: Colors.transparent,
            ),
            _genderBar(),
            Container(
              height: 30,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service ',
                        recognizer: TapGestureRecognizer()..onTap = () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Show terms of service!'),
                          ));
                        },
                        style: const TextStyle(
                          color: Color(0xff603192),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        recognizer: TapGestureRecognizer()..onTap = () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text('Show privacy policy!'),
                          ));
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
            ),
            Container(
              height: 60,
              color: Colors.transparent,
            ),
            ElevatedButton(
              child: const Text('Sign Up'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpWidget(title: 'Sign Up',)),
                );
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff603192),
                  padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 10),
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

  _genderBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Gender',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            height: 5,
            color: Colors.transparent,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  icon: Image.asset('assets/images/male.png',
                    width: 15,
                    height: 15,
                  ),
                  label: const Text('Male'),
                  onPressed: () => null,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff603192),
                  ),
                ),
              ),
              Container(
                width: 5,
                color: Colors.transparent,
              ),
              Expanded(
                child: ElevatedButton.icon(
                  icon: Image.asset('assets/images/female.png',
                    width: 15,
                    height: 15,
                  ),
                  label: const Text('Female', style: TextStyle(color: Color(0xff603192)),),
                  onPressed: () => null,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffffffff),
                  ),
                ),
              ),
              Container(
                width: 5,
                color: Colors.transparent,
              ),
              Expanded(
                child: ElevatedButton.icon(
                  icon: Image.asset('assets/images/gender.png',
                    width: 15,
                    height: 15,
                  ),
                  label: const Text('Other', style: TextStyle(color: Color(0xff603192)),),
                  onPressed: () => null,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffffffff),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}