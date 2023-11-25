import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_network_connectivity_check/Bloc/internet_bloc.dart';
import 'package:flutter_bloc_network_connectivity_check/Bloc/internet_state.dart';

class InternetCheckBloc extends StatelessWidget {
  const InternetCheckBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Connectivity Check"),
      ),

      /// make Ui and background both
      /// like a snackBar, dialog, popup, etc...
      body: Center(child: buildBlocConsumer()),

      /// make only snackBar, dialogBox, etc...
      // body: Center(child: buildBlocListener()),

      /// make only ui
      // body: Center(child: buildBlocBuilder()),
    );
  }

  /// to check ui and background both at the time
  BlocConsumer<InternetBloc, InternetState> buildBlocConsumer() {
    return BlocConsumer<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetGainedState) {
          return const Text("Connected!");
        } else if (state is InternetLostState) {
          return const Text("Not Connected!");
        } else {
          return const Text("Loading...");
        }
      },
      listener: (context, state) {
        if (state is InternetGainedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Internet Connected!"),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is InternetLostState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Internet Not Connected!"),
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
    );
  }

  /// to check in background like snackBar, dialogBox, etc...
  BlocListener<InternetBloc, InternetState> buildBlocListener() {
    return BlocListener<InternetBloc, InternetState>(
      listener: (context, state) {
        if (state is InternetGainedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Internet Connected!"),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is InternetLostState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Internet Not Connected!"),
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
      child: const Text('Check your Internet Connection'),
    );
  }

  /// to check in direct ui
  BlocBuilder<InternetBloc, InternetState> buildBlocBuilder() {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetGainedState) {
          return const Text("Connected!");
        } else if (state is InternetLostState) {
          return const Text("Not Connected!");
        } else {
          return const Text("Loading...");
        }
      },
    );
  }
}
