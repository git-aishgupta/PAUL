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
  String username;
  String password;

  final FocusNode _username = FocusNode();
  final FocusNode _password = FocusNode();

  TextStyle defaultStyle = TextStyle(fontSize: 16.0);
  TextStyle linkStyle = TextStyle(color: Color(0xff6C63FF), fontSize: 16.0);

  bool isChecked = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  bool passwordVisible;

  @override
  void initState() {
    passwordVisible = true;
  }

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
        body: GestureDetector(
          onTap: () {
            // call this method here to hide soft keyboard
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.loose,
                      child: Builder(
                        builder: (context) => SvgPicture.asset(
                          'images/teacher.svg',
                          height: (MediaQuery.of(context).size.height) * 0.4,
                        ),
                      ),
//                        child: Image.asset('images/login_wallpaper.png'),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 40.0,
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  obscureText: false,
                                  textInputAction: TextInputAction.next,
                                  focusNode: _username,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50.0,
                                        ),
                                      ),
                                    ),
                                    labelText: 'Username',
                                  ),
                                  onSaved: (String value) {
                                    username = value;
                                  },
                                  validator: _validateUsername,
                                  onFieldSubmitted: (term) {
                                    _fieldFocusChange(
                                        context, _username, _password);
                                  },
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                TextFormField(
                                  obscureText: passwordVisible,
                                  textInputAction: TextInputAction.done,
                                  focusNode: _password,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Color(0xff6C63FF),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          passwordVisible = !passwordVisible;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50.0,
                                        ),
                                      ),
                                    ),
                                    labelText: 'Password',
                                  ),
                                  onSaved: (String value) {
                                    password = value;
                                  },
                                  validator: _validatePassword,
                                ),
                                SizedBox(
                                  height: 30.0,
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
                                            style:
                                                TextStyle(color: Colors.black),
                                            text: 'I accept the ',
                                          ),
                                          TextSpan(
                                              text: 'Licence Agreement',
                                              style: linkStyle,
                                              recognizer:
                                                  new TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print(
                                                          'Licence Agreement');
                                                      // TODO : Open Link
                                                    }),
                                          TextSpan(
                                            style:
                                                TextStyle(color: Colors.black),
                                            text: ' and ',
                                          ),
                                          TextSpan(
                                              text: 'Privacy Policy',
                                              style: linkStyle,
                                              recognizer:
                                                  new TapGestureRecognizer()
                                                    ..onTap = () {
                                                      print('Privacy Policy');
                                                      // TODO : Open Link
                                                    }),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Center(
                                  child: Builder(
                                    builder: (context) => RaisedButton(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 20.0, 30.0, 20.0),
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
                                      onPressed: () {
                                        final form = _formKey.currentState;
                                        if (form.validate()) {
                                          // Text forms was validated.
                                          form.save();
                                          if (isChecked) {
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Successfully Logged in',
                                                ),
                                              ),
                                            );
                                          } else if (!isChecked) {
                                            // The checkbox wasn't checked
                                            Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Please accept the License Agreement and Privacy Policy',
                                                ),
                                              ),
                                            );
                                          } else {
                                            setState(
                                                () => _autoValidate = true);
                                          }
                                        }
                                      },
                                      child: Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
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
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

String _validateUsername(String value) {
  if (value.isEmpty) {
    // The form is empty
    return "Enter username";
  } else {
    return null;
  }
}

String _validatePassword(String value) {
  if (value.isEmpty) {
    // The form is empty
    return "Enter password";
  } else {
    return null;
  }
}
