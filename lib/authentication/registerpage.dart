
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Loginpage.dart';
import 'firebasehelper.dart';

// void main(){
//   runApp(MaterialApp(home: Registeratonn(),));
// }
class Registeratonn extends StatefulWidget{
  @override
  State<Registeratonn> createState() => _RegisteratonnState();
}

class _RegisteratonnState extends State<Registeratonn> {
  // TextEditingController logemail = TextEditingController();
  // TextEditingController password= TextEditingController();
  // TextEditingController confirmpassword = TextEditingController();
String? email;
String? passs;
String? name;
var formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Please Register"), backgroundColor: Colors.blue[800],),
      body: Form(
        key: formkey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: 90,),
                    Text("Hellooo!", style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          // Padding(
                          //     padding: const EdgeInsets.only(left: 50, right: 50),
                          //     child: TextFormField(
                          //       decoration: InputDecoration(
                          //         labelText: "Name",
                          //         fillColor: Colors.white,
                          //         filled: true,
                          //         disabledBorder: OutlineInputBorder(
                          //           borderSide: const BorderSide(
                          //               color: Colors.red, width: 2.0),
                          //           borderRadius: BorderRadius.circular(25.0),
                          //         ),
                          //         enabledBorder: OutlineInputBorder(
                          //           borderSide: const BorderSide(
                          //               color: Colors.black, width: 2.0),
                          //           borderRadius: BorderRadius.circular(25.0),
                          //         ),
                          //       ),
                          //     )
                          // ),
                          SizedBox(height: 20,),
                          Padding(
                              padding: const EdgeInsets.only(left: 50, right: 50),
                              child: TextFormField(
                                onSaved: (uname){
                                  uname=name;
                                },
                                decoration: InputDecoration(
                                  labelText: "User name",
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                              )
                          ),
                          SizedBox(height: 30,),
                          Padding(
                              padding: const EdgeInsets.only(left: 50, right: 50),
                              child: TextFormField(
                                onSaved: (mail){
                                  mail=email;
                                },
                                decoration: InputDecoration(
                                  labelText: "Email adress",
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),

                                ),
                                  validator: (uname) {
                                    if (uname!.isEmpty ||
                                        !uname.contains("@") ||
                                        !uname.contains(".")) {
                                      return "Please enter valid userName";
                                    } else {
                                      return null;
                                    }
                                  })
                          ),
                          SizedBox(height: 30,),
                          Padding(
                              padding: const EdgeInsets.only(left: 50, right: 50),
                              child: TextFormField(
                                onSaved: (pass){
                                  pass=passs;
                                }
                                  ,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                ),
                                  validator: (upassword) {
                                    if (upassword!.isEmpty || upassword.length < 6) {
                                      return "please enter valid password";
                                    } else {
                                      return null;
                                    }
                                  }
                              )
                          ),
                          SizedBox(height: 30,),
                          // Padding(
                          //     padding: const EdgeInsets.only(left: 50, right: 50),
                          //     child: TextFormField(
                          //       decoration: InputDecoration(
                          //         labelText: "Confirm password",
                          //         fillColor: Colors.white,
                          //         filled: true,
                          //         enabledBorder: OutlineInputBorder(
                          //           borderSide: const BorderSide(
                          //               color: Colors.black, width: 2.0),
                          //           borderRadius: BorderRadius.circular(25.0),
                          //         ),
                          //       ),
                          //         validator: (upassword) {
                          //           if (upassword!.isEmpty || upassword.length < 6) {
                          //             return "please enter valid password";
                          //           } else {
                          //             return null;
                          //           }
                          //         }
                          //     )
                          // ),
                          SizedBox(height: 20,),
                          ElevatedButton(onPressed: () {
                           if(formkey.currentState!.validate()){
                             formkey.currentState!.save();
                             FireHelper().signUp(mail: email!,password :passs!).then((value){
                               if(value==null){
                                 Get.to(Newlogin());
                               }else{
                                 Get.snackbar("Error",value);
                               }
                             });
                           }
                          }, child: Text(
                              "Register"), style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 20)),),
                        ],
                      ),
                    ),
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
//   void validateSignUp()async {
//     final email = logemail.text.trim();
//     final pass = password.text.trim();
//     final cpass = confirmpassword.text.trim();
//     final emailValidationResult = EmailValidator.validate(email);
//     if (email != "" && pass != "" && cpass != "") {
//       if (emailValidationResult == true) {
//         final passValidationResult = checkPassword(pass, cpass);
//         if (passValidationResult == true) {
//           final user = User(email: email, password: pass);
//           await DBFunction.instance.userSignUp(user);
//           Get.back();
//           Get.snackbar("Success", "Account created");
//           print("registr");
//         }
//       } else {
//         Get.snackbar("Error", "Provide a valid Email");
//       }
//     } else {
//       Get.snackbar("Error", "Fields Can not be empty");
//     }
//   }
//
//   bool checkPassword(String pass, String cpass) {
//     if (pass == cpass) {
//       if (pass.length < 6) {
//         Get.snackbar("Error", "Password length should be > 6");
//         return false;
//       }
//       else {
//         return true;
//       }
//     } else {
//       Get.snackbar("Error", "Password mismatch");
//       return false;
//     }
//   }
// }








//      if (email != "" && pass != "" && cpass != "") {
//        if (emailValidationResult == true) {
//          final passValidationResult = checkPassword(pass, cpass);
//          if (passValidationResult == true) {
//            final user = User(email: email, password: pass);
//            await DBFunction.instance.userSignUp(user);
//            Get.back();
//            Get.snackbar("Success", "Account created");
//          }
//        } else {
//          Get.snackbar("Error", "Provide a valid Email");
//        }
//      } else {
//        Get.snackbar("Error", "Fields Can not be empty");
//      }
//    }
//
//
//
//   checkPassword(String pass, String cpass) {
//       if(pass==cpass){
//         if(pass.length < 6){
//           Get.snackbar("Erro", "Password lenght should be > 6");
//         }
//         else{
//           return true;
//         }
//       }else{
//         Get.snackbar("Error", "Password mismatch");
//         return false;
//       }
//   }
// }