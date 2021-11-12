import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:litmath/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:litmath/utilities/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider {
  var idToken = 'e';
  var localId = '';
  String name = '';
  String email = '';
  //-------------------SIGNUP-------------------------------------------------------------------------
  Future<void> signup(String email, String password, String name) async {
    var SignUpUrl =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc';
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
    print(email);
    print(name);
    if (response.statusCode >= 400) {
      throw HttpException('Hubo un problema al intentar registrarse');
    } else {
      String dbURL =
          'https://litmath-default-rtdb.firebaseio.com/Users.json?${uuid}';
      final userTypeResponse = await http.post(Uri.parse(dbURL),
          body: json.encode({
            'userId': uuid,
            'email': email,
            'name': name,
          }));
      print(userTypeResponse.statusCode);
    }
  }

//--------------------------SignIn------------------------------------------------------------------------
  Future<bool> signIn(String email, String password) async {
    var SignUpUrl =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc';
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
    print(response.statusCode);
    if (response.statusCode >= 400) {
      // throw const HttpException('Hubo un problema al iniciar sesion');
      return false;
    } else {
      var uuid = json.decode(response.body)["idToken"];
      idToken = uuid;
      localId = json.decode(response.body)["localId"];
      print(idToken);

      ///////////////////////////////////////////////////////////////////
      final prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> user = {
        'idToken': idToken,
        'localId': localId,
      };
      bool result = await prefs.setString('user', jsonEncode(user));
      ////////////////////////////////////////////////////////////////
      return true;
    }

    /* 
    if(response == null) {
      throw HttpException('No se encuentra al usuario, Registrese por favor');
    } */
  }

  Future getUserInfoD() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');
    Map<String, dynamic> userMap =
        jsonDecode(userPref!) as Map<String, dynamic>;
    String localId = userMap.values.toList()[1];
    print(localId);
    final url = Uri.parse(
        'https://litmath-default-rtdb.firebaseio.com/Users.json?&orderBy="userId"&equalTo="$localId"');
    final response = await http.get(url);
    // print(response.statusCode);
    final decodedResponse = json.decode(response.body);
    // print(decodedResponse[decodedResponse.keys.first]);
    name = decodedResponse[decodedResponse.keys.first]['name'];
    email = decodedResponse[decodedResponse.keys.first]['email'];
    print('userName: ' + name);
    print('userEmail: ' + email);
    //print(decodedResponse);

    await prefs.setString('name', name);
    await prefs.setString('email', email);
    print(prefs.getString('email'));
  }

  Future getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPref = prefs.getString('user');

    Map<String, dynamic> userMap =
        jsonDecode(userPref!) as Map<String, dynamic>;

    String idToken = userMap.values.toList()[0];

    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=AIzaSyBcrQcJoGYKHlIUwdAFDdYqlSmhjpQgBGc');
    final response = await http.post(url,
        body: json.encode({
          'idToken': idToken,
        }));
    var responseData = json.decode(response.body)['users'] as List;
    //var userData = json.decode(responseData)['localId'];
    //Map<String,dynamic> convertedData = jsonDecode(responseData) as Map<String, dynamic>;
    //print(userMap.values.toList());

    print(responseData.map((e) => null));

    //userMap['userId'] = responseData['localId'];

    // bool result = await prefs.setString('user', jsonEncode(user));
    //String uuid = json.decode(response.body)["localId"];
    //String uuid = json.decode(response.body);
    //print('user ID: '+ json.decode(response.body).toString());
    //  if (response.statusCode >= 400) {
    //   throw HttpException('Hubo un problema al obtener datos');
    // }
  }

  Future sendEmail({
    required String? name,
    required String? email,
    required String? activity_score,
    required String? activity_name,
  }) async {
    final serviceId = 'service_d5g07lc';
    final templateId = 'template_hqer4pp';
    final userId = 'user_9ff0VOENZeXEdgEkCLFcU';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': 'litmath.app@gmail.com',
            'to_email': email,
            'activity_score': activity_score,
            'activity_name': activity_name,
          }
        }));

    print(response.body);
  }

  Future<void> sendReport(String activity_name, String activity_score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserProvider().sendEmail(
        name: prefs.getString('name'),
        email: prefs.getString('email'),
        activity_score: activity_score,
        activity_name: activity_name);
  }

  Future<void> clearSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
