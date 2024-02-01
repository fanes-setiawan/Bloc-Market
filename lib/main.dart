import 'package:blocmarket/bloc/home/product_bloc.dart';
import 'package:blocmarket/bloc/login/login_bloc.dart';
import 'package:blocmarket/data/datasources/api_data_sources.dart';
import 'package:blocmarket/screens/login_screen.dart';
import 'package:blocmarket/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(ApiDataSources()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
          useMaterial3: true,
        ),
        home: FutureBuilder(
            future: checkLoginStatus(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return snapshot.data != null
                    ? BlocProvider(
                        create: (context) =>
                            ProductBloc()..add(GetProductEvent()),
                        child: const TabBarMain(),
                      )
                    : const LoginScreen();
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else {
                return Container(
                  child: const Text("Loading..."),
                );
              }
            }),
      ),
    );
  }
}

checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? authToken = prefs.getString('token');
  return authToken;
}
