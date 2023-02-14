import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshopuz/view/category/categoryPage.dart';
import 'package:eshopuz/view/home/homePage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'addModel.dart';



class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  String? imagePath;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imagePath == null
                  ? SizedBox.shrink()
                  : Image.file(File(imagePath!)),
              // TextFormField(
              //   controller: titleController,
              //   decoration: InputDecoration(
              //       labelText: "title"
              //   ),
              // ),
              TextFormField(
                controller: descController,
                decoration: InputDecoration(
                    labelText: "sname"
                ),
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(
                    labelText: "sale"
                ),
              ),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(
                    labelText: "date"
                ),
              ),

              ElevatedButton(onPressed: () async {
                final XFile? image=await _picker.pickImage(source: ImageSource.gallery);
                imagePath = image?.path;
                setState(() {});
              }, child: Text("galereya")),
              ElevatedButton(
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});
                    print("salom1");
                    final storageRef = FirebaseStorage.instance.ref().child("productImage/${DateTime.now().toString()}");
                    await storageRef.putFile(File(imagePath ?? ""));

                    String url = await storageRef.getDownloadURL();

                    firestore
                        .collection("banner")
                        .add(BannerModel(
                        image: url,
                        sale: priceController.text,
                        sname: titleController.text,
                        date: categoryController.text).toJson()).then((value) {
                      isLoading = false;
                      setState(() {});
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>CategorePage()));
                    });
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}

