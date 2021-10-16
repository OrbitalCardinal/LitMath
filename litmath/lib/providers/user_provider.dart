import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:litmath/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:litmath/utilities/api.dart';
class UserProvider {
  //-------------------SIGNUP-------------------------------------------------------------------------
  Future<void> signup(String email, String password, String name) async {
    var SignUpUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc';
    //var SaveToDBUrl = 'https://litmath-default-rtdb.firebaseio.com/users.json';

    final response = await http.post(
      Uri.parse(SignUpUrl),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    

    String uuid = json.decode(response.body)["localId"];
    print(uuid);
    if (response.statusCode >= 400) {
      throw HttpException('Hubo un problema al intentar registrarse');
    } 
    else {
      String dbURL = 'https://litmath-default-rtdb.firebaseio.com/Users.json?${uuid}';
        final userTypeResponse = await http.post(Uri.parse(dbURL), body: json.encode(
          {
            'userId': uuid,
            'email': email,
            'name': name,
          }
        ));
        print(userTypeResponse.statusCode);
    }
  }
//--------------------------SignIn------------------------------------------------------------------------
  Future<void> signIn(String email, String password) async {
    var SignUpUrl = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc';
    //var SaveToDBUrl = 'https://litmath-default-rtdb.firebaseio.com/users.json';

    final response = await http.post(
      Uri.parse(SignUpUrl),
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    

    String uuid = json.decode(response.body)["localId"];
    print(uuid);
    if (response.statusCode >= 400) {
      throw HttpException('Hubo un problema al iniciar sesion');
    }
  }

  
}
