import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:nudj/ui/widgets/SetPasswordWidget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../ui/widgets/HomeWidget.dart';
import '../../ui/widgets/SignUpWidget.dart';
import 'LoginWidget.dart';

class OtpVerificationWidget extends StatefulWidget {
  const OtpVerificationWidget({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<OtpVerificationWidget> createState() => _OtpVerificationWidgetState();
}

class _OtpVerificationWidgetState extends State<OtpVerificationWidget> {
  bool _passwordIsObscure = true;
  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

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
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 8, bottom: 8),
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
                  height: 20,
                  color: Colors.transparent,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'OTP Verification',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 15,
                  color: Colors.transparent,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'We have sent the verification code to the provided\nemail address',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  color: Colors.transparent,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Text(
                        'email@example.com',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: const Color(0xffF18F25),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            border: Border.all(color: const Color(0xffF18F25))),
                        child: Image.asset(
                          'assets/images/edit_icon.png',
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 20,
                  color: Colors.transparent,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      /* obscureText: true,
                obscuringCharacter: '*',
                obscuringWidget: const FlutterLogo(
                  size: 24,
                ),*/
                      backgroundColor: Colors.white,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 6) {
                          return "Plese enter valid OTP";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.white,
                          selectedColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          activeColor: Colors.grey,
                          inactiveColor: Colors.grey),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
                Container(
                  height: 20,
                  color: Colors.transparent,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    'Resend code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff603192),
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  color: Colors.transparent,
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 120,
                      height: 40,
                      child: ElevatedButton(
                        child: const Text('Verify code'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetPasswordWidget(
                                      title: 'Set Password',
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
    return Scaffold(
      backgroundColor: Color(0xffFDFAFF),
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
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Container(
                height: 100,
                alignment: Alignment.topLeft, // This is needed
                child: Image.asset(
                  'assets/images/otp_verification_logo.png',
                  fit: BoxFit.contain,
                  width: 100,
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
                  'Verification code',
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
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'We have sent the verification code to the\nprovided email address',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              color: Colors.transparent,
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(
                    'email@example.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xffF18F25),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: const Color(0xffF18F25))),
                    child: Image.asset(
                      'assets/images/edit_icon.png',
                      width: 10,
                      height: 10,
                    ),

                  ),
                ),
              ],
            ),
            Container(
              height: 30,
              color: Colors.transparent,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  /* obscureText: true,
                  obscuringCharacter: '*',
                  obscuringWidget: const FlutterLogo(
                    size: 24,
                  ),*/
                  backgroundColor: Colors.white,
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: Colors.grey,
                      inactiveColor: Colors.grey),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
            Container(
              height: 30,
              color: Colors.transparent,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Text(
                'Resend code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff603192),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 30,
              color: Colors.transparent,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    child: const Text('Verify code'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SetPasswordWidget(
                              title: 'Set Password',
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
            Container(
              height: 30,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
