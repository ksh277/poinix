
import 'package:flutter/material.dart';
import 'delete_account_dialog.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const DeleteAccountDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('회원 탈퇴 확인')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showDeleteDialog(context),
          child: const Text('회원 탈퇴 테스트'),
        ),
      ),
    );
  }
}
