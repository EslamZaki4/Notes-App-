import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/presentation/models/note_model.dart';
import 'package:notes_app/presentation/views/notes_view.dart';
import 'package:notes_app/simple_bloc_observer.dart';

void main() async {
  await Firebase.initializeApp();
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      initialRoute: '/notes', // Set the initial route to login
      routes: {
        // '/login': (context) => LoginScreen(),
        '/notes': (context) => const NotesView(),
      },
    );
  }
}

void initializeFacebookAuth() {
  FacebookAuth.instance.webInitialize(
    appId: '2079467939086230', // Use your Facebook App ID here
    cookie: true,
    xfbml: true,
    version: 'v11.0', // Facebook Graph API version
  );
}
