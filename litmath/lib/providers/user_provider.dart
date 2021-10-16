import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:litmath/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class UserProvider {
  //-------------------SIGNUP-------------------------------------------------------------------------
  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );

    String uuid = json.decode(response.body)["localId"];
    if (response.statusCode >= 400) {
      throw HttpException('Hubo un problema al intentar registrarse');
    }
  }
}
