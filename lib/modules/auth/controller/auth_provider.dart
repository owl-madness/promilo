import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:promilo_app/modules/auth/model/auth_model.dart';
import 'package:promilo_app/modules/nav/screen/bottom_navigation_screen.dart';
import 'package:promilo_app/network/api_urls.dart';
import 'package:crypto/crypto.dart';

class AuthProvider extends ChangeNotifier {
  bool validated = false;
  bool passwordVisible = true;
  bool rememberMe= true;
  Dio dio = Dio()
    ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  visibilityChanged() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  loginUser(BuildContext context, String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        var bytes = utf8.encode(password);
        var digest = sha256.convert(bytes).toString();
        FormData formData = FormData.fromMap({
          'username': username,
          'password': digest,
          'grant_type': 'password',
        });
        dio.options.headers['Authorization'] = ApiUrls.authorization;

        Response response =
            await dio.post(ApiUrls.baseUrl + ApiUrls.loginApi, data: formData);
        if (response.statusCode == 200) {
          var model = LoginResponseModel.fromJson(response.data);
          //store access token and refresh token from model
          if (model.response?.accessToken != null) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => NavScreen(),
                ));
          }
          return model;
        }
        return null;
      } catch (e) {
        print(e);
        throw Exception(e);
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid ID or Password')));
    }
  }
  
  changeRemember() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  textChanged(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      validated = false;
      notifyListeners();
    } else {
      validated = true;
      notifyListeners();
    }
  }
}
