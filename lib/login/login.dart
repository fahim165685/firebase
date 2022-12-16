import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore/custom_text_form_filed.dart';
import 'package:firestore/home/home.dart';
import 'package:firestore/reg/reg.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emileCom = TextEditingController();
  TextEditingController passCon = TextEditingController();
  final formKey= GlobalKey<FormState>();
  final FirebaseAuth _auth  =FirebaseAuth.instance;

  void isLogIn(){
    _auth.signInWithEmailAndPassword(
        email: emileCom.text.toString(),
        password: passCon.text.toString()
    ).then((value) {
      setState(() {
        isLode=!isLode;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(),));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Success"),backgroundColor: Colors.green,));
    }).onError((error, stackTrace) {
      setState(() {
        isLode=!isLode;
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This account not value"),backgroundColor: Colors.red,));
    });
  }

  bool isLode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
                controller: emileCom,
                validator: (value) {
                  if(value!.isEmpty){
                    return "emile*";
                  }
                  return null;
                },
                labelText: "Emile"),
            CustomTextFormField(
                controller: passCon,
                validator: (value) {
                  if(value!.isEmpty){
                    return "password*";
                  }
                  return null;
                },
                labelText: "Password"),


            (isLode == true)?const CircularProgressIndicator():
          ElevatedButton(onPressed: (){
            final isValidFrom = formKey.currentState!.validate();
            if(isValidFrom){
              setState(() {
                isLode = !isLode;
              });
              isLogIn();
            }
          }, child: const Text("Login")),

            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Reg(),));
            }, child: const Text("Registration"))
          ],
        ),
      ),
    );
  }
}
