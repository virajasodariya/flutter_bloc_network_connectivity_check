import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network_connectivity_check/Bloc/internet_bloc.dart';
import 'package:flutter_bloc_network_connectivity_check/View/check_connectivity_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InternetCheckBloc(),
      ),
    );
  }
}
