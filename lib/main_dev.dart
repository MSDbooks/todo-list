import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'my_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCzn_NvI419nvNISj5JAXpoHgsrFAZHm2U",
      appId: "1:1038270523947:android:e7146edde84083c37c186e",
      messagingSenderId: "1038270523947",
      projectId: "todo-list-clean-code",
    ),
  );
  
  runApp(const MyApp());
}




