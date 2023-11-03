import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:value_notifier_example/provider/auth_provider.dart';

class FirstPage extends HookConsumerWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登録ページ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              await ref.read(firebaseAuthProvider).signInAnonymously();
            }, child: const Text('登録')),
          ],
        )
      ),
    );
  }
}
