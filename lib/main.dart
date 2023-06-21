import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/providers/chats_provider.dart';
import 'package:myapp/src/providers/firebase_provider.dart';
import 'package:myapp/src/providers/models_provider.dart';
import 'package:myapp/src/screen/MainScreens/initial_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
        Provider<FlutterFireAuthService>(
          create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FlutterFireAuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EntApp',
      home: Initial(),
    )
    );
  }
}
