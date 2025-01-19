import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbook/app/cubit/root_page_cubit.dart';
import 'package:readbook/features/home/home_page.dart';
import 'package:readbook/features/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootPageCubit()..start(),
      child:
          BlocBuilder<RootPageCubit, RootPageState>(builder: (context, state) {
        final user = state.user;
        if (user == null) {
          return LoginPage();
        }

        return HomePage(user: user);
      }),
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RootP(),
//       child: BlocBuilder<RootP, RootPageState>(
//         builder: (context, state) {
//           return StreamBuilder<User?>(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               final user = snapshot.data;
//               if (user == null) {
//                 return LoginPage();
//               }

//               return HomePage(user: user);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
