import 'package:chat_app/bloc/message_bloc.dart';
import 'package:chat_app/pages/all_message_screen/all_message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/insert_message_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MessageCubit()),
        BlocProvider(create: (_) => MessageBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const AllMessageScreen(),
      ),
    );
  }
}
