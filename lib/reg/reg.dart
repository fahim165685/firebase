import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../custom_text_form_filed.dart';

class Reg extends StatefulWidget {
  const Reg({Key? key}) : super(key: key);

  @override
  State<Reg> createState() => _RegState();
}

class _RegState extends State<Reg> {
  TextEditingController emileCom = TextEditingController();
  TextEditingController passCon = TextEditingController();
  final formKey= GlobalKey<FormState>();

  final FirebaseAuth _auth= FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
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
                    return "emile*";
                  }
                  return null;
                },
                labelText: "Password"),
            CustomTextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return "com emile*";
                  }else if(value.toString() != passCon.text){
                    return "don't match";
                  }
                  return null;
                },
                labelText: "Com Password"),

            ElevatedButton(onPressed: (){
              final isValidFrom = formKey.currentState!.validate();
              if(isValidFrom){
                _auth.createUserWithEmailAndPassword(
                    email: emileCom.text.toString(),
                    password: passCon.text.toString()).then((isTrue){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Register from success")));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
                }).onError((error, stackTrace) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This emile account Already exist."),backgroundColor: Colors.red,));
                });

              }
            }, child: const Text("Registration")),
            TextButton(onPressed: (){
              Get.offAll(()=>const Login(),transition: Transition.upToDown,duration: const Duration(seconds: 1));
            }, child: Text("Login>"))
          ],
        ),
      ),
    );
  }
}
