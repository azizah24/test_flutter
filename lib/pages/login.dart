import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_apps/api/api_service.dart';
import 'package:test_apps/model/model_login.dart';
import 'package:test_apps/pages/profile.dart';
import 'package:test_apps/theme.dart';
import 'package:crypto/crypto.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode FocusNode_ = new FocusNode();
  FocusNode FocusNodePas = new FocusNode();
  bool kondisipassword = true;
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  LoginModel? loginModel;
  final storage = FlutterSecureStorage();

  void saveLoginToken(token) async {
    final storage = new FlutterSecureStorage();

    await storage.write(key: 'token', value: token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 45,),
            Center(child: Text('Halo MoGawers!', style: greystyle.copyWith(fontSize: 28),)),
            SizedBox(height: 45,),
            Padding(
              padding: const EdgeInsets.only(left: 44, right:44),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FormBuilderTextField(
                  focusNode: FocusNode_,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: FocusNode_.hasFocus ?  Colors.red : Colors.grey
                    ),
                    suffixIcon: Icon(Icons.person, color: Colors.red,),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      //  when the TextFormField in focused
                    ) ,
                  ),
                  controller: email,
                  name: '',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FormBuilderTextField(
                  focusNode: FocusNodePas,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: FocusNodePas.hasFocus ?  Colors.red : Colors.grey
                    ),
                    suffixIcon: IconButton(
                        icon: kondisipassword ?  Icon(
                            Icons.visibility_off, color: Colors.red) : Icon(Icons.visibility, color: Colors.red,),
                        onPressed: () {
                          setState(() {
                            kondisipassword = !kondisipassword;
                          });
                        }),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ) ,
                  ),
                  obscureText: kondisipassword,
                  controller: password,
                  name: '',
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(right: 44),
              child: Align(
                alignment: Alignment.topRight,
                child: Text('Lupa Password?', style: redstyle,),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44),
              child: Container(
                height: 44,
                child: RaisedButton(
                  onPressed: ()async{
                    try{
                      EasyLoading.show(
                          status: 'loading...');

                      var response = await APIData().LoginConnect(email.text, password.text).then((value) {
                        loginModel = value;

                        if(loginModel?.token != null){

                          APIData().writeSecureData('token', loginModel!.token!);

                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
                          EasyLoading.showSuccess('Sukses');
                        }
                        else{
                          EasyLoading.showError('${loginModel?.message}');
                        }

                      });

                    }catch(e){
                      print(e);
                    }

                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Text(
                    'Login', style: putihstyle.copyWith(
                    fontSize: 14,
                  ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                  Text('Atau', style: abureg,),
                  Container(
                    height: 1,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 44, right: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/fb.png', width: 40, ),
                  Image.asset('assets/google.png', width: 40, ),
                  Image.asset('assets/twitter.png', width: 40, ),
                ],
              ),
            ),
            SizedBox(height: 35,),
            Column(
              children: [
                Text('Mau uang tambahan?', style: abureg,),
                SizedBox(height: 5,),
                Text('Ayo Gabung!', style: redstyle,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
