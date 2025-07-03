import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Item Exchange'),
            onTap: () => Navigator.pushNamed(context, '/itemExchange'),
          ),
          ListTile(
            title: const Text('Auction'),
            onTap: () => Navigator.pushNamed(context, '/auction'),
          ),
          ListTile(
            title: const Text('Admin Panel'),
            onTap: () => Navigator.pushNamed(context, '/admin'),
          ),
          ListTile(
            title: const Text('Analytics'),
            onTap: () => Navigator.pushNamed(context, '/analytics'),
          ),
        ],
      ),
    );
  }
}
