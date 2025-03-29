import 'package:http/http.dart' as http;

import 'dart:convert' as convert;

Future<void> signup(String firstName, String lastName, String password,
    String email, String Phone) async {
  final url = Uri.parse("http://10.0.2.2:8000/users/signup");

  Map<String, String> body = {
    "First_name": firstName,
    "Last_name": lastName,
    "Password": password,
    "Email": email,
    "Phone": Phone,
    "User_type": "ADMIN"
  };

  final response = await http.post(url, body: convert.jsonEncode(body));

  final responseBody = convert.jsonDecode(response.body);

  if (response.statusCode != 200) {
    throw Exception(responseBody["error"]);
  }
}

Future<Map> login(String email, String password) async {
  final url = Uri.parse("http://10.0.2.2:8000/users/login");

  Map<String, String> body = {
    "Password": password,
    "Email": email,
  };

  final response = await http.post(url, body: convert.jsonEncode(body));
  final responseBody = convert.jsonDecode(response.body);

  print("***********************");
  print(convert.jsonDecode(response.body));
  print(response.statusCode);
  print("********************");

  if (response.statusCode != 200) {
    throw Exception(responseBody["error"]);
  }
  return responseBody;
}

Future getUsers(String token) async {
  final url = Uri.parse("http://10.0.2.2:8000/users");

  Map<String, String> headers = {"token": token};

  final response = await http.get(url, headers: headers);
  return convert.jsonDecode(response.body);
}
