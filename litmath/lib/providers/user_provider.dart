import 'dart:convert';

import 'package:litmath/models/user.dart';
import 'package:http/http.dart' as http;

class UserProvider {

  static const jsonCode = JsonCodec();

  void createUser(User user){
    var json = jsonCode.encode(user);
    var url = 'https://litmath-default-rtdb.firebaseio.com/';
    //var httpClient = createHttpClient();
  }
}