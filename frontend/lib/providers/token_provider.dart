import 'package:flutter/material.dart';

class TokenProvider extends ChangeNotifier {
  String _token = "";
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _refreshToken = "";

  void updateValues(String token, String firstName, String lastName,
      String email, String refreshToken) {
    _token = token;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _refreshToken = refreshToken;
    notifyListeners();
  }

  String getToken() {
    return _token; 
  }

  String getFirstName() {
    return _firstName; 
  }

  String getLastName() {
    return _lastName; 
  }

  String getEmail() {
    return _email; 
  }

  Map<String, String> getValues() {
    return {
      "first_name": _firstName,
      "last_name": _lastName,
      "email": _email,
    };
  }
}
