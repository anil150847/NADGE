import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MySeparator.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _bottomBarSelectedIndex = 4;

  /*
  * This index tells us which widget(fragment) needs to be
  * shown in the UI, for the Profile selection.
  * 0 - Profile Home
  * 1 - Patient Profile
  * 2 - Medication List
  * 3 - Your team & Contacts
  * 4 - Settings(Not for web, only for mobile & tablet) */
  int _profileFragmentIndex = 0;

  bool _receiveTextMessagesPatient = true;
  bool _receiveTextMessagesGuardian = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        // Loading views according to screen width
        if (constraints.maxWidth > 500) {
          return _wideHome();
        }
        return _home();
      }),
    );
  }

  _wideHome() {
    return Scaffold(
      body: Row(
        children: [
          _wideHomeNavigationBar(),
          Expanded(child: _wideHomeBody()),
        ],
      ),
    );
  }

  _wideHomeNavigationBar() {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: 200,
      child: Column(
        children: [
          _profileLayout(),
          _wideHomeNavigationItems(),
          _wideHomeLogoutWidget(),
        ],
      ),
    );
  }

  _profileLayout() {
    return Container(
      width: 200,
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
            Container(
              height: 25,
              color: Colors.transparent,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: const Center(
                child: Text('GG', style: TextStyle(fontSize: 18),),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 2.0),
              child: Text(
                'Garry Gergich',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 2.0),
              child: Text(
                'Manage your account',
                style: TextStyle(
                  fontSize: 12,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 2.0),
              child: Container(
                height: 0.5,
                color: Colors.grey,
                width: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _wideHomeNavigationItems() {
    return Column(
      children: [
        InkWell(
          onTap: () {
            _checkInClicked();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36.0, 24.0, 8.0, 12.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.waving_hand_outlined,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                      child: Text('Check in', style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _progressClicked();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36.0, 12.0, 8.0, 12.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.dashboard,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                      child: Text('Progress', style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _learnClicked();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36.0, 12.0, 8.0, 12.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.school,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                      child: Text('Learn', style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            _communityClicked();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(36.0, 12.0, 8.0, 24.0),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.group,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                      child: Text('Community', style: TextStyle(fontSize: 12),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Container(
            height: 0.5,
            color: Colors.grey,
            width: 150,
          ),
        ),
      ],
    );
  }

  _communityClicked() {

  }

  _learnClicked() {

  }

  _progressClicked() {

  }

  _checkInClicked() {

  }

  _wideHomeLogoutWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(36.0, 24.0, 8.0, 12.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.logout,
                    size: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                    child: Text('Log out', style: TextStyle(fontSize: 12),),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _wideHomeBody() {
    if(_profileFragmentIndex == 0) {
      return _wideProfileHome();
    } else if(_profileFragmentIndex == 1) {
      return _wideProfileDetail();
    } else if(_profileFragmentIndex == 2) {
      return _wideProfileMedicationList();
    } else if(_profileFragmentIndex == 3) {
      return _wideProfileContactsList();
    } else if(_profileFragmentIndex == 4) {
      // This should only be returned for mobile and tablets, not for web
      return _wideProfileSettings();
    } else {
      // TODO : Show a window with an error message and a infographic
      // TODO : Remove SizedBox
      return const SizedBox(width: 0, height: 0,);
    }
  }

  _wideProfileHome() {
    return Container(
      color: const Color(0xfff0f1f2),
      height: MediaQuery.of(context).size.height,
      child: Expanded(child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 50.0),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 18.0),
                  child: Text(
                    'Your Account',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black87
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 18.0, 0.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _profileFragmentIndex = 1;
                          });
                        },
                        child: Container(
                          height: 200,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(36.0, 48.0, 48.0, 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Patient Profile',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff10121c),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Review the basic personal details we have on record to reach you',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff555f6e),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 18.0, 0.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _profileFragmentIndex = 2;
                          });
                        },
                        child: Container(
                          height: 200,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(36.0, 48.0, 48.0, 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Medication List',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff10121c),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Review current and past medications associated with your patient profile',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff555f6e),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 18.0, 0.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            _profileFragmentIndex = 3;
                          });
                        },
                        child: Container(
                          height: 200,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(36.0, 48.0, 48.0, 12.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: const [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Your Team & Contacts',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff10121c),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Get in touch with your care manager and team, or other crisis resources',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff555f6e),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: Container(
                  height: 0.5,
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                    child: Text('Privacy Policy', style: TextStyle(fontSize: 11, decoration: TextDecoration.underline),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                    child: Text('Terms and Conditions', style: TextStyle(fontSize: 11, decoration: TextDecoration.underline),),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    child: Text('\u00a9 2022 Nudj Health', style: TextStyle(fontSize: 11,),),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  _wideProfileDetail() {
    return Container(
      color: const Color(0xfff0f1f2),
      height: MediaQuery.of(context).size.height,
      child: Expanded(child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 50.0, 25.0, 50.0),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 18.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _profileFragmentIndex = 0;
                      });
                    },
                    child: const Text(
                      '<   Patient Profile',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex:5,
                          child: Column(
                            children: [
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 35,
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      width: 75,
                                      height: 75,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.orange,
                                      ),
                                      child: const Center(
                                        child: Text('GG', style: TextStyle(fontSize: 30),),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 2.0),
                                      child: Text(
                                        'Garry Gergich',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 36.0, 0.0, 0.0),
                                      child: Expanded(
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'cell phone',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      '1 (123) 123-1234',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(width: 0.5, height: 70, color: Colors.grey,),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'home phone',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    '1 (123) 123-1234',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black54,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), // Phone Info
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      child: Expanded(
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: const Padding(
                                              padding: EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Receive text messages?',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black87,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Switch(
                                                  value: _receiveTextMessagesPatient,
                                                  activeColor: const Color(0xff603192),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _receiveTextMessagesPatient = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), // Text Message Toggle Info
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      child: Expanded(
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'email',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      'garry.gergich@pawnee.gov',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), // Email Info
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      child: Expanded(
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(height: 25, color: Colors.transparent,),
                              Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 80,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.orange,
                                                      ),
                                                      child: const Center(
                                                        child: Text('M', style: TextStyle(fontSize: 18),),
                                                      ),
                                                    ),
                                                    Container(width: 12,),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: const [
                                                        Text(
                                                          'Millicent Gergich',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.black87,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                        Text(
                                                          'Daughter',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black54,
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 80,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: ElevatedButton(
                                                  child: const Text('GUARDIAN'),
                                                  onPressed: (){},
                                                  style: ElevatedButton.styleFrom(
                                                      primary: const Color(0xff324164),
                                                      textStyle: const TextStyle(
                                                        fontSize: 12,
                                                      )),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      child: Expanded(
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'cell phone',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      '1 (123) 123-1234',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(width: 0.5, height: 70, color: Colors.grey,),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'home phone',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black87,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    '1 (123) 123-1234',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black54,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Phone Info
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      child: Expanded(
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: const Padding(
                                              padding: EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Receive text messages?',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black87,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Switch(
                                                  value: _receiveTextMessagesGuardian,
                                                  activeColor: const Color(0xff603192),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _receiveTextMessagesGuardian = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), // Text Message Toggle Info
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                      child: Expanded(
                                        child: Container(
                                          height: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            height: 70,
                                            child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'email',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      'millicent.gergich@pawnee.gov',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black54,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), // Email Info
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 25,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.image,
                                        size: 48,
                                        color: Colors.grey,
                                      ),
                                      Container(height: 10,),
                                      const Text(
                                        'Which details can be edited?',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87
                                        ),
                                      ),
                                      Container(height: 5,),
                                      const Text(
                                        'At the time, your profile can only be '
                                        'edited by your care manager to ensure '
                                        'everything stays in sync with your '
                                        'medical record. If something does\'nt'
                                        ' look right, you can reach out to Leslie'
                                        ' Knope or flag it with them on your next call',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  // TODO: Remove this
  _createMedicationList() {
    // Creating static medication list
    List<Medication> _medication = <Medication>[];
    _medication.add(Medication('Carvedilol', '12.5mg', 'Take twice a day', 'With food', true));
    _medication.add(Medication('Eliquis', '2.5mg', 'Take twice a day', 'With food', true));
    _medication.add(Medication('Lipitor', '40mg', 'Take daily', 'With food', true));
    _medication.add(Medication('Multaq', '400mg', 'Take twice a day', '', true));
    _medication.add(Medication('Synthroid', '125mcg', 'Take daily', 'With food', true));
    _medication.add(Medication('diltiazem ER', '2.5mg', 'Take every evening', '', true));
    _medication.add(Medication('Hydrocortisol', '2.5mg', 'Take twice a day', '', true));
    // TODO : Create layout for inactive medication below the active medication listview
    // _medication.add(Medication('Aldactone', '25mg', '', '', false));
    return _medication;
  }

  _wideProfileMedicationList() {
    // Static Medication list
    List<Medication> _medication = _createMedicationList();

    return Container(
      color: const Color(0xfff0f1f2),
      height: MediaQuery.of(context).size.height,
      child: Expanded(child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 50.0, 25.0, 50.0),
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 18.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _profileFragmentIndex = 0;
                      });
                    },
                    child: const Text(
                      '<   Medication List',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87
                      ),
                    ),
                  ),
                ),
              ),
              /*ListView.builder(
                                  itemCount: _medication.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      height: 50,
                                      color: Colors.amber,
                                      child: Center(child: Text('Entry ${_medication[index]._name}')),
                                    );
                                  }
                              ),*/
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex:5,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 0.0),
                            child: Container(
                              height: 200,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 25,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.image,
                                        size: 48,
                                        color: Colors.grey,
                                      ),
                                      Container(height: 10,),
                                      const Text(
                                        'Which details can be edited?',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87
                                        ),
                                      ),
                                      Container(height: 5,),
                                      const Text(
                                        'At the time, your medication list can only be '
                                            'edited by your care manager to ensure '
                                            'everything stays in sync with your '
                                            'medical record. If something does\'nt'
                                            ' look right, you can reach out to Leslie'
                                            ' Knope or flag it with them on your next call',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  _wideProfileContactsList() {
    return Container(
      color: const Color(0xfff0f1f2),
      height: MediaQuery.of(context).size.height,
      child: Expanded(child: Padding(
        padding: const EdgeInsets.fromLTRB(50.0, 50.0, 25.0, 50.0),
        child: Container(
          color: Colors.transparent,
          child: Column(

            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 18.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _profileFragmentIndex = 0;
                      });
                    },
                    child: const Text(
                      '<   Your Team & Contacts',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex:5,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(color: const Color(0xffDEE4EB))
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 35,
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/SplashLogo3x.png'),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: BoxShape.circle,
                                      ),),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 2.0),
                                      child: Text(
                                        'Leslie Knope',
                                        style: TextStyle(
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                      color: Colors.transparent,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        color: const Color(0xff603192),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                        child: Text(
                                          'YOUR CARE MANAGER',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      margin: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: const Color(0xffF6F7F8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Phone number',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                '1(123) 123-1234',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color:  Color(0xff7337af),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      margin: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        color: const Color(0xffF6F7F8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'email',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'leslie@nudjhealth.com',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color:  Color(0xff7337af),
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                   // Email Info
                                    SizedBox(height: 30,),
                                    Container(child: const MySeparator(color: Colors.grey)),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/SplashLogo3x.png'),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                    ),
                                          Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'Ann Perkins',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black87,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    'Nutritionist',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    Divider(indent: 60,),// Email Info
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          height: 40,
                                          width: 40,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/SplashLogo3x.png'),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Dr. Richard Nygard',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black87,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                Text(
                                                  'Nudj MD',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ), /// Email Info

                                  ],
                                ),
                              ),

                              Container(height: 25, color: Colors.transparent,),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          width: 25,
                        ),
                        Expanded(
                          flex: 3,
                            child: Container(
                           //   margin: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                  border: Border.all(color: const Color(0xffDEE4EB))
                              ),
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 35,
                                        color: Colors.transparent,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Crisis hotlines',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.black87,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'If your are in crisis and need help immediately, get\nsupport now through one of the trusted\nresources below.',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 20,),

                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Nacional de Prevencion del Suicidio',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '1(123) 123-1234',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff603192),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(indent: 20,thickness: 2,),

                                      SizedBox(height: 10,),

                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Nacional de Prevencion del Suicidio',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '1(123) 123-1234',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff603192),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(indent: 20,thickness: 2,),
                                      SizedBox(height: 10,),

                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Nacional de Prevencion del Suicidio',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: const Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            '1(123) 123-1234',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff603192),
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20,),
                                      Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10)),
                                            color: Color(
                                                0xff021f40),
                                          ),
                                        alignment:Alignment.center ,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              SizedBox(width: 50,),
                                              const Icon(
                                                Icons.warning_amber_outlined,
                                                color: Colors.grey,
                                                size: 24.0,
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10)),
                                                    color: Color(
                                                        0xff021f40),
                                                  ),
                                                  height: 70,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(18.0),
                                                    child: Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(

                                                        child:const Text(
                                                          'If this is an emergency, please dial 911.',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.bold
                                                          ),
                                                          textAlign: TextAlign.left,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ), // Email Info

                                    ],
                                  ),

                                ],
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  _wideProfileSettings() {

  }

  _home() {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _homeBody(),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.waving_hand_outlined),
            label: 'Check In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_sharp),
            label: 'Arjun',
          ),
        ],
        currentIndex: _bottomBarSelectedIndex,
        selectedItemColor: const Color(0xff603192),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _bottomBarSelectedIndex = index;
    });
  }

  _homeBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: const Color(0xfff0f1f2),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 48.0, 16.0, 48.0),
        child: Column(
          children: [
            Container(height: 32, color: Colors.transparent,),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Your Account',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black54
                ),
              ),
            ),
            Container(height: 16, color: Colors.transparent,),
            Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff10121c),
                              ),
                            ),
                          ),
                          Text(
                            'Review current and past medications associated with your patient profile',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff555f6e),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 16, color: Colors.transparent,),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Medication List',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff10121c),
                              ),
                            ),
                          ),
                          Text(
                            'Review current and past medications associated with your patient profile',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff555f6e),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 16, color: Colors.transparent,),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Your Team & Contacts',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff10121c),
                              ),
                            ),
                          ),
                          Text(
                            'Review current and past medications associated with your patient profile',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff555f6e),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 16, color: Colors.transparent,),
                Container(
                  height: 100,
                  color: Colors.white,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff10121c),
                              ),
                            ),
                          ),
                          Text(
                            'Review current and past medications associated with your patient profile',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff555f6e),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(height: 16, color: Colors.transparent,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sample Medication List
class Medication {
  String _name;
  String _info;
  String _frequency;
  String _note;
  bool _isActive;

  Medication(this._name, this._info, this._frequency, this._note, this._isActive);

  bool get isActive => _isActive;

  set isActive(bool value) {
    _isActive = value;
  }

  String get frequency => _frequency;

  set frequency(String value) {
    _frequency = value;
  }

  String get info => _info;

  set info(String value) {
    _info = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get note => _note;

  set note(String value) {
    _note = value;
  }
}
