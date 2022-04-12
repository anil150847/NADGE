import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:nudj/ui/widgets/LoginWidget.dart';

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
      backgroundColor: Color(0xffFDFAFF),
      body: LayoutBuilder(builder: (context, constraints) {
        // Loading views according to screen width
        if (constraints.maxWidth > 500) {
          return _wideSignUpWidget();
        }
        return _mSignUpWidget();
      }),
    );
  }
  _wideSignUpWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginWidget(
                            title: 'Login',
                          )),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding:
                    const EdgeInsets.only(left: 20, right: 24, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: const Color(0xff603192))),
                    alignment: Alignment.topRight,
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
            height: MediaQuery.of(context).size.height / 10,
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
                  height: 20,
                  color: Colors.transparent,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
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
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                        child: const Text('Sign Up'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpWidget(title: 'Sign Up',)),
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

        ],
      ),
    );
  }

  _mSignUpWidget(){
    return SingleChildScrollView(
      child: Column(
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