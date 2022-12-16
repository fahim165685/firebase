import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore/controller/controller.dart';
import 'package:firestore/custom_text_form_filed.dart';
import 'package:firestore/home/profile/components/profile_image.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  void initState() {
    updatCounter();
    super.initState();
  }
  updatCounter() async {
    final cRef = FirebaseFirestore.instance.collection('VISITS');
    await cRef
        .doc('marketingbaz-e94c0')
        .set({"count": FieldValue.increment(1)}, SetOptions(merge: true));
    print(cRef);
  }

  final formKey=GlobalKey<FormState>();
  TextEditingController nameCon =TextEditingController();
  TextEditingController priceCon =TextEditingController();
  TextEditingController dTimeCon =TextEditingController();
  TextEditingController mTime =TextEditingController();
  TextEditingController disCon =TextEditingController();
  TextEditingController imgCon =TextEditingController();
  bool isLoading =false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          children: [

            ElevatedButton(onPressed: (){
              updatCounter();

            }, child: Text("sdfsf")),
            ProfileImage(),
            CustomTextFormField(
              controller: nameCon,
              validator: (value) {
                if(value!.isEmpty){
                  return"please fill out the fill";
                }
                return null;
              },
                labelText: "Name"),
            CustomTextFormField(
                controller: priceCon,
                validator: (value) {
                  if(value!.isEmpty){
                    return"please fill out the fill";
                  }
                  return null;
                },
                labelText: "Price"),
            CustomTextFormField(
                controller: mTime,
                validator: (value) {
                  if(value!.isEmpty){
                    return"please fill out the fill";
                  }
                  return null;
                },
                labelText: "Making time"),
            CustomTextFormField(
                controller: dTimeCon,
                validator: (value) {
                  if(value!.isEmpty){
                    return"please fill out the fill";
                  }
                  return null;
                },
                labelText: "Delivery time "),
            CustomTextFormField(
                controller: disCon,
                validator: (value) {
                  if(value!.isEmpty){
                    return"please fill out the fill";
                  }
                  return null;
                },
                labelText: "Product description"),
            CustomTextFormField(
                controller: imgCon,
                validator: (value) {
                  if(value!.isEmpty){
                    return"please fill out the fill";
                  }
                  return null;
                },
                labelText: "Product image url "),
            if ( isLoading== true) const Center(child:CircularProgressIndicator() ,)
            else ElevatedButton(onPressed: (){
              final isValidFrom = formKey.currentState!.validate();
              if(isValidFrom){
                setState(() {
                  isLoading=!isLoading;
                });
                FirebaseController().uploadData(
                    name: nameCon.text,
                    price: priceCon.text,
                    makingTime: mTime.text,
                    deliveryTime: dTimeCon.text,
                    productImageURL: imgCon.text,
                    productDescription: disCon.text).then((value) {
                  setState(() {
                    isLoading=!isLoading;
                  });
                      print(">>>>>>>>>>>>>>>>>>>>>>SUCCESS<<<<<<<<<<<<<<<<");
                }).onError((error, stackTrace){
                  setState(() {
                    isLoading=!isLoading;
                  });
                  print(">>>>>>>>>>>>>>>>>>>>>>Error<<<<<<<<<<<<<<<<");
                });
              }
            },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
