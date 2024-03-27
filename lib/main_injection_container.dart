import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:whatsapp_FBI/features/User/user_injection_cotainer.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);

  await userInjectionContainer();
  // await chatInjectionContainer();
  // await statusInjectionContainer();
  // await callInjectionContainer();
}
