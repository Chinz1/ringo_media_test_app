import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ringo_media_test_app/auth/bloc/auth_bloc.dart';
import 'package:ringo_media_test_app/auth/log_in_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: LogInScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
