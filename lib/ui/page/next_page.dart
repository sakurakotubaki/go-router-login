import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/auth_provider.dart';

class NextPage extends HookConsumerWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ログイン後のページ'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () async {
              // ログアウトするメソッド
              await ref.read(firebaseAuthProvider).signOut();
            }, child: const Text('Go Back')),
          ],
        )
      ),
    );
  }
}
