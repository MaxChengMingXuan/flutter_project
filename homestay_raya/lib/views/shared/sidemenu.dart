import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../screens/loginscreen.dart';
import '../screens/mainscreen.dart';
import '../screens/profilescreen.dart';
import '../screens/hostscreen.dart';
import '../screens/registrationscreen.dart';
import 'transition.dart';

class MainMenuWidget extends StatefulWidget {
  final User user;
  const MainMenuWidget({super.key, required this.user});

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Drawer(
      width: 250,
      elevation: 10,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(widget.user.email.toString()),
            accountName: Text(widget.user.name.toString()),
            currentAccountPicture: const CircleAvatar(
              radius: 30.0,
            ),
          ),
          ListTile(
            title: const Text('Registration'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                  context,
                  // EnterExitRoute(
                  //     exitPage: MainScreen(user: widget.user),
                  //     enterPage: RegistrationScreen(user: widget.user)));
                  MaterialPageRoute(
                      builder: (context) =>
                          RegistrationScreen(user: widget.user)));
            },
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                  context,
                  // EnterExitRoute(
                  //     exitPage: MainScreen(user: widget.user),
                  //     enterPage: RegistrationScreen(user: widget.user)));
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(user: widget.user)));
            },
          ),
          ListTile(
            title: const Text('Discover'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (content) => MainScreen()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      // exitPage: MainScreen(), enterPage: MainScreen()));
                      exitPage: MainScreen(user: widget.user),
                      enterPage: MainScreen(user: widget.user)));
            },
          ),
          ListTile(
            title: const Text('Host'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (content) => const SellerScreen()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      // exitPage: MainScreen(), enterPage: HostScreen()));
                      exitPage: MainScreen(user: widget.user),
                      enterPage: HostScreen(user: widget.user)));
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (content) => const ProfileScreen()));
              Navigator.push(
                  context,
                  EnterExitRoute(
                      // exitPage: MainScreen(), enterPage: ProfileScreen()));
                      exitPage: MainScreen(user: widget.user),
                      enterPage: ProfileScreen(
                        user: widget.user,
                      )));
            },
          ),
        ],
      ),
    );
  }
}
