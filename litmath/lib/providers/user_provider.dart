import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:litmath/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class UserProvider with ChangeNotifier{

  String _token = '';
  String _userId ='';

  bool get isAuth {
    return _token != null;
  }

  String get userId {
    return _userId;
  }
  
  //-------------------SIGNUP-------------------------------------------------------------------------
  Future<void> signup(String email, String password) async {

    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc';
    const verifyUrl =
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc';

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
    
    notifyListeners();
    if (response.statusCode >= 400) {
      throw HttpException('Hubo un problema al intentar registrarse');
    } else {
      final emailResponse = await http.post(Uri.parse(verifyUrl),
          body: json.encode({
            'requestType': "VERIFY_EMAIL",
            'idToken': json.decode(response.body)['idToken'],
          }));
      if(emailResponse.statusCode >= 400) {
        throw HttpException('Hubo un problema al intentar enviar el correo de verficación');
      } else {
        String dbURL = "https://litmath-default-rtdb.firebaseio.com/users.json";
        final userTypeResponse = await http.post(Uri.parse(dbURL), body: json.encode(
          {
            "userId": uuid,
          }
        ));
        print(userTypeResponse.statusCode);
      }
    }
  }
}