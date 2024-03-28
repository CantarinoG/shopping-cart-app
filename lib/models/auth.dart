import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/secrets.dart';

class Auth with ChangeNotifier {
  static const _url = Secrets.API_SIGNUP_URL;

  Future<void> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
  }
}
