import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  'images/login.svg',
                  height: 150.0,
                ),
                Spacer(
                  flex: 3,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
                ),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                    labelText: 'Username',
                  ),
                  onSaved: (String value) {},
                  validator: (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.'
                        : null;
                  },
                ),
                Spacer(
                  flex: 1,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
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
                Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                      activeColor: Color(0xff6C63FF),
                    ),
                    Text(
                      'I accept the Licence Agreement and Privacy Policy',
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                ),
                Spacer(
                  flex: 1,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
//                side: BorderSide(color: Color(0xff6C63FF)),
                  ),
                  color: Color(0xff6C63FF),
                  textColor: Colors.white,
                  onPressed: () {},
                  child: Text('Sign up'),
                ),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
