import 'package:flutter/material.dart';
import 'package:frontend/components/custom_button.dart';
import 'package:frontend/components/custom_textfield.dart';
import 'package:frontend/providers/token_provider.dart';
import 'package:frontend/util/auth_functions.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Signup",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Email",
                  controller: emailController,
                  validator: (name) =>
                      name!.isEmpty ? "* This Field is required" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Password",
                  controller: passwordController,
                  isPassword: true,
                  validator: (name) =>
                      name!.isEmpty ? "* This Field is required" : null,
                ),
                SizedBox(
                  height: 60,
                ),
                CustomButton(
                  title: "login",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        Map res = await login(
                          emailController.text,
                          passwordController.text,
                        );

                        context.read<TokenProvider>().updateValues(res["token"], res["first_name"], res["last_name"], res["email"], res["refresh_token"]);

                        if (context.mounted) {
                          Navigator.of(context).pushReplacementNamed("/home");
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                e.toString(),
                              ),
                            ),
                          );
                        }
                        print(e.toString());
                      }
                    }
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("/");
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
