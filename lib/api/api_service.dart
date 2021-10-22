import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_apps/model/model_login.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_apps/model/model_profile.dart';

class APIData{
  var url = 'https://backend-service-development-dot-mogawe-222614.appspot.com/api/mogawers';
  var headers = {'Content-Type': 'application/json'};
  final storage = FlutterSecureStorage();

  Future<LoginModel> LoginConnect(email, password) async {
    Response response;
    Dio dio = Dio();
    var encodedata = utf8.encode(password);         // data being hashed
    var password_baru = sha256.convert(encodedata);
    var convert_string = password_baru.toString();
    print(password_baru);
    var body = {

      "email": email,
      "password": convert_string,

    };

    var responsee = await http.post(
        Uri.parse('$url/logIn'),
        body: jsonEncode(body),
        headers: headers
    );
    print(responsee);
    print(responsee.statusCode);

    var json_isi = json.decode(responsee.body);
    if (responsee.statusCode == 200) {
      print('berhasil');

      return LoginModel.fromJson(json_isi);
    }
    else{
      return LoginModel.fromJson(json_isi);
    }
    // print(res.body);
  }

  Future<ModelProfil> getProfil(token) async {

    print(token);
    var body = {

      "token": token,
    };

    var responsee = await http.post(
        Uri.parse('$url/v2/getProfile'),
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': '$token',}
    );
    print(responsee);
    print(responsee.statusCode);

    var json_isi = json.decode(responsee.body)['object'];
    if (responsee.statusCode == 200) {
      print('berhasil');

      return ModelProfil.fromJson(json_isi);
    }
    else{
      return ModelProfil.fromJson(json_isi);
    }
  }

  Future writeSecureData(String key, String value) async {
    var writeData = await storage.write(key: key, value: value);
    return writeData;
  }

  Future readSecureData(String key) async {
    var readData = await storage.read(key: key);

    return readData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await storage.delete(key: key);

    return deleteData;
  }
}