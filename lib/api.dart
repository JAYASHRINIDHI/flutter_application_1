import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

String uploadUrl = "http://192.168.3.65:5000/api";
String downloadUrl = "http://192.168.3.65:5000/result";

Future getData(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  //return response.body;
  return jsonDecode(response.body);
}

uploadImage(File imageFile, String url) async {
  String base64Image = base64Encode(imageFile.readAsBytesSync());
  //http.Response response = await http.post(Uri.parse(url), body: base64Image);
  Response response= await Dio().post(url,data:base64Image);
  print(response);
}



