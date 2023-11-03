import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Firebase Authenticationのインスタンスを生成するプロバイダー
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);

// ログイン状態を監視するプロバイダー
final authStateProvider = StreamProvider((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});