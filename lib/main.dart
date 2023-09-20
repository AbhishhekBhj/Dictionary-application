import 'package:dictionary/repository/dictionary_repo.dart';
import 'package:dictionary/screens/home/cubit/dictionary_cubit.dart';
import 'package:dictionary/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary Application',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        child: const Home(),
        create: (context) => DictionaryCubit(DictionaryRepository()),
      ),
    );
  }
}
