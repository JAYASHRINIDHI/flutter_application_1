import 'result_page.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'api.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  late File _image;

  Future getImage(bool isCamera) async {
    File image;

    if (isCamera) {
      image = await ImagePicker().pickImage(source: ImageSource.camera) as File;
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery) as File;
    }
    

    uploadImage(image, uploadUrl);
    Fluttertoast.showToast(
      msg: 'IMAGE UPLOADED !',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.black,
      backgroundColor: Colors.white12,
      fontSize: 15.0,
);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.yellow,
            Colors.yellow,
            Colors.yellow,
            Colors.yellow,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Captioner',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.insert_drive_file),
                color: Colors.white,
                iconSize: 70,
                onPressed: () {
                  getImage(false);
                },
              ),
              const SizedBox(height: 70.0),
              IconButton(
                icon: const Icon(Icons.camera_alt),
                color: Colors.white,
                iconSize: 70,
                onPressed: () {
                  getImage(true);
                },
              ),
              const SizedBox(height: 70.0),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultPage(key: UniqueKey(), image: _image)),
            );
          },
          icon: const Icon(
            Icons.arrow_forward,
            color: Colors.black,
            size: 30,
          ),
          label: const Text(
            "Next",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
