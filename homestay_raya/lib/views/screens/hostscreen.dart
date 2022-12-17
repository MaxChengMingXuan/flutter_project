import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../shared/sidemenu.dart';

class HostScreen extends StatefulWidget {
  final User user;
  const HostScreen({super.key, required this.user});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Host Page")),
        body: const Center(child: Text("Host")),
        drawer: MainMenuWidget(
          user: widget.user,
        ));
  }
}
