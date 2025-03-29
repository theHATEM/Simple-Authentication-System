import 'package:flutter/material.dart';
import 'package:frontend/components/custom_button.dart';
import 'package:frontend/components/custom_textfield.dart';
import 'package:frontend/util/auth_functions.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

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
                  hintText: "First Name",
                  controller: firstNameController,
                  validator: (name) =>
                      name!.isEmpty ? "* This Field is required" : null,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Last Name",
                  controller: lastNameController,
                  validator: (name) =>
                      name!.isEmpty ? "* This Field is required" : null,
                ),
                SizedBox(
                  height: 10,
                ),
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
                  height: 10,
                ),
                CustomTextField(
                  hintText: "Phone",
                  controller: phoneController,
                  validator: (name) =>
                      name!.isEmpty ? "* This Field is required" : null,
                ),
                SizedBox(
                  height: 60,
                ),
                CustomButton(
                  title: "Signup",
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await signup(
                          firstNameController.text,
                          lastNameController.text,
                          passwordController.text,
                          emailController.text,
                          phoneController.text,
                        );
                        if (context.mounted) {
                          Navigator.of(context).pushReplacementNamed("/login");
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
                    Navigator.of(context).pushReplacementNamed("/login");
                  },
                  child: const Text(
                    "I have an account",
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
