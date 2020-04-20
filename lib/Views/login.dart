import 'package:flutter/material.dart';
import 'package:flutter_fliplearn/Views/homescren.dart';
import 'main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:async_loader/async_loader.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class LoginScreen extends StatefulWidget {
  @override
  Login createState() => Login();
}

class Login extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  var username = "";
  var password = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<AsyncLoaderState> asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
//    var _asyncLoader = new AsyncLoader(
//      key: asyncLoaderState,
//      initState: () async => await getRepositories(),
//      renderLoad: () => Center(child: new CircularProgressIndicator()),
//      renderError: ([error]) => getNoConnectionWidget(),
//      renderSuccess: ({data}) => getListView(data),
//    );
    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "drawablehdpi/bg_profile.png",
                  ),
                ),
              ),
              height: 200.0,
              child: Center(
                child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(top: 70.0),
                      child: new Image.asset(
                        'drawablehdpi/ic_page_logo.png',
                        height: 60,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(6),
                child: Text(
                  'Your Learning Journey Awaits You',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      //     fontWeight: FontWeight.w500,
                      fontSize: 14),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(6),
                child: Text(
                  'Starts Now',
                  style: TextStyle(fontSize: 14),
                )),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              height: 60,

//            padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
//                border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              height: 60,

//            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
//                border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                child: Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: Colors.deepPurple,
                  child: Text('Forgot Password'),
                ),
                FlatButton(
                  textColor: Colors.deepPurple,
                  child: Text(
                    'Username',
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 200,
              margin: const EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                textColor: Colors.white,
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple, Color(0xFF4A148C)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  loginPress(
                      nameController.text, passwordController.text, context);
                  print(nameController.text);
                  print(passwordController.text);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
              ),
            ),
            Container(
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10.0, top: 15.0),
                                child: Divider(
                                  color: Colors.blueGrey,
                                  height: 14,
                                ))),

                        Text("Or",
                            style: TextStyle(
                              fontSize: 14,
                            )),
                        //                       ),
                        Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10.0, top: 10.0),
                                child: Divider(
                                  color: Colors.blueGrey,
                                  height: 14,
                                ))),
                      ],
                    ))),
            Container(
              alignment: Alignment.center,
              height: 40,
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.deepPurple),
                child: Ink(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Use Your Phone Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  );
                  print(nameController.text);
                  print(passwordController.text);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                padding: EdgeInsets.all(0.0),
              ),
            ),
          ])),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Color(0xFFB0BEC5),
          alignment: Alignment.center,
          child: Text(
              "By Loggin in you are agree to our\n Privacy policy and Terms and conditions"),
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          height: 60,
          width: double.infinity,
        ),
      ),
    ));
  }

  bool checkValidation(String username, String password, BuildContext context) {
    var status = false;
    if (username != "" && password != "") {
      status = true;
    } else {
//         SnackBar snackBar = messgePrint("username or password cannot be blank");
//    Scaffold.of(context).showSnackBar(snackBar);
      Fluttertoast.showToast(
          msg: 'username or password cannot be blank',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
    return status;
  }

  void loginPress(String username, String password, BuildContext context) {
    if (checkValidation(username, password, context)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    }
  }
//  SnackBar messgePrint(String msg) {
//    return SnackBar(
//      content: Text(msg),
//      action: SnackBarAction(
//        label: 'Undo',
//        onPressed: () {
//          // Some code to undo the change.
//        },
//      ),
//    );
//    ;
//  }

}
