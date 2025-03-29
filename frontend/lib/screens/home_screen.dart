import 'package:flutter/material.dart';
import 'package:frontend/providers/token_provider.dart';
import 'package:frontend/util/auth_functions.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 80,
                ),
              ),
              const Divider(),
              const Text(
                "Profile Info",
                style: TextStyle(fontSize: 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "First Name: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(context.watch<TokenProvider>().getFirstName()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Name: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(context.watch<TokenProvider>().getLastName()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(context.watch<TokenProvider>().getEmail()),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.purple,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
        backgroundColor: Colors.amber,
        title: const Text("HomeScreen"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          print(snapshot.data);
          return ListView.separated(
            padding: EdgeInsets.all(
              16,
            ),
            itemCount: snapshot.data["total_count"],
            itemBuilder: (context, index) => Container(
              height: 60,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("First Name: "),
                      Text(snapshot.data["user_item"][index]["first_name"]
                          .toString())
                    ],
                  ),
                  Row(
                    children: [
                      Text("Last Name: "),
                      Text(snapshot.data["user_item"][index]["last_name"]
                          .toString())
                    ],
                  ),
                  Row(
                    children: [
                      Text("Email: "),
                      Text(
                          snapshot.data["user_item"][index]["email"].toString())
                    ],
                  ),
                ],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        },
        future: getUsers(context.read<TokenProvider>().getToken()),
      ),
    );
  }
}
