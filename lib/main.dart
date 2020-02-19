import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FocusNode _username = FocusNode();
  final FocusNode _password = FocusNode();

  TextStyle defaultStyle = TextStyle(fontSize: 16.0);
  TextStyle linkStyle = TextStyle(color: Color(0xff6C63FF), fontSize: 16.0);

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xff6C63FF),
        fontFamily: 'Roboto',
        unselectedWidgetColor: Color(0xff6C63FF),
      ),
      home: Scaffold(
        body: new GestureDetector(
          onTap: () {
            // call this method here to hide soft keyboard
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: new Container(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: SvgPicture.asset(
                          'images/professor_wallpaper.svg',
                        ),
//                        child: Image.asset('images/login_wallpaper.png'),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 40.0,
                              ),
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: _username,
                              onFieldSubmitted: (term) {
                                _fieldFocusChange(
                                    context, _username, _password);
                              },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(
                                  50.0,
                                ))),
                                labelText: 'Username',
                              ),
                              onSaved: (String value) {},
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                            TextFormField(
                              focusNode: _password,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      50.0,
                                    ),
                                  ),
                                ),
                                labelText: 'Password',
                              ),
                              onSaved: (String value) {},
                              validator: (String value) {
                                return value.contains('@')
                                    ? 'Do not use the @ char.'
                                    : null;
                              },
                            ),
                            Row(
                              children: <Widget>[
                                CircularCheckBox(
                                  value: isChecked,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                  activeColor: Color(
                                    0xff6C63FF,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: defaultStyle,
                                    children: <TextSpan>[
                                      TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        text: 'I accept the ',
                                      ),
                                      TextSpan(
                                          text: 'Licence Agreement',
                                          style: linkStyle,
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Licence Agreement');
                                              // TODO : Open Link
                                            }),
                                      TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        text: ' and ',
                                      ),
                                      TextSpan(
                                          text: 'Privacy Policy',
                                          style: linkStyle,
                                          recognizer: new TapGestureRecognizer()
                                            ..onTap = () {
                                              print('Privacy Policy');
                                              // TODO : Open Link
                                            }),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Center(
                              child: RaisedButton(
                                padding:
                                    EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    40.0,
                                  ),
//                side: BorderSide(color: Color(0xff6C63FF)),
                                ),
                                color: Color(
                                  0xff6C63FF,
                                ),
                                textColor: Colors.white,
                                onPressed: () {},
                                child: Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
