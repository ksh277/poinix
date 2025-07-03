import 'package:flutter/material.dart';

class ItemExchangeScreen extends StatelessWidget {
  const ItemExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item Exchange')),
      body: const Center(child: Text('Exchange Items here')),
    );
  }
}
