import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';
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
    final body = jsonDecode(response.body);
    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, false);
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, true);
  }
}
