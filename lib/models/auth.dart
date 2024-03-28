import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/secrets.dart';

class Auth with ChangeNotifier {
  static const _url = Secrets.API_SIGNUP_URL;

  Future<void> _authenticate(
      String email, String password, bool isLogin) async {
    final url = isLogin ? Secrets.API_LOGIN_URL : Secrets.API_SIGNUP_URL;
    final response = await http.post(
      Uri.parse(
        url,
      ),
      body: jsonEncode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
  }

  Future<void> signup(String email, String password) async {
    _authenticate(email, password, false);
  }

  Future<void> login(String email, String password) async {
    _authenticate(email, password, true);
  }
}
