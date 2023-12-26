import 'package:authentication_firebase/authentication/registerpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: Newlogin(),));
}

class Newlogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginstate();
}

class loginstate extends State<Newlogin> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpas = true;
  //globalkey multiple widget add cheyyaan
  //screen monitor cheyaan vndi ulla key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // title: const Text("Login page"),backgroundColor: Colors.lightBlue[900],
      //),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 180,
                ),
                const Image(
                  image: NetworkImage(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb"
                      "/f/f4/BMW_logo_%28gray%29.svg/220px-BMW_logo_%28gray%29.svg.png"),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Mobile number or email address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      validator: (uname) {
                        if (uname!.isEmpty ||
                            !uname.contains("@") ||
                            !uname.contains(".")) {
                          return "Please enter valid userName";
                        } else {
                          return null;
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: TextFormField(
                      obscureText: showpas,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (showpas) {
                                  showpas = false;
                                } else {
                                  showpas = true;
                                }
                              });
                            },
                            icon: Icon(showpas == true
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: "Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                      validator: (upassword) {
                        if (upassword!.isEmpty || upassword.length < 6) {
                          return "please enter valid password";
                        } else {
                          return null;
                        }
                      }),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    final valid = formkey.currentState!.validate();
                    if (valid) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Hompage()));
                    } else {
                      return null;
                    }
                  },
                  child: Text("Log in"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(290, 30),
                      backgroundColor: Colors.blue[900]),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgotten Password?",
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  height: 130,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registeratonn()));
                  },
                  child: Text("Create new account"),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(
                          290, 30), //fixed size box nde leghn cheyyan
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.blue.shade900,
                      elevation: 0,
                      side: const BorderSide(width: 1.0, color: Colors.blue)),
                ),
                //SizedBox(height: 10,),
                //Image(image: AssetImage("assets/meta.png"),height: 50,width: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
