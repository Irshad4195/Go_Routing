import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/swipe/swipe_bloc.dart';
import 'Navigation/app_navigation.dart';
import 'Temp/theme.dart';
import 'UserModel/userModel.dart';
import 'UserModel/userRepo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository(users: User.users);
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwipeBloc(userRepository: userRepository),
      child: MaterialApp.router(
        title: 'Go Router Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: theme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.deepPurple,
        ),
        routerConfig: AppNavigation.router,
      ),
    );
  }
}
