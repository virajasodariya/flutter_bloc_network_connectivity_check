import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network_connectivity_check/Cubit/internet_cubic.dart';
import 'package:flutter_bloc_network_connectivity_check/Cubit/internet_state.dart';

class InternetCheckCubit extends StatelessWidget {
  const InternetCheckCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connectivity Check Cubit"),
      ),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetStateCubit>(
          builder: (context, state) {
            if (state == InternetStateCubit.Gained) {
              return const Text("Connected!");
            } else if (state == InternetStateCubit.Lost) {
              return const Text("Lost Connection!");
            } else {
              return const Text("Loading...");
            }
          },
          listener: (context, state) {
            if (state == InternetStateCubit.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Connected!"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state == InternetStateCubit.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Lost Connection!"),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Loading..."),
                  backgroundColor: Colors.teal,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
