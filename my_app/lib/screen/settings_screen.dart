import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(title: Text("Dark Mode"), value: false, onChanged: (val){}),
          ListTile(title: Text("Profile Change"), trailing: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}