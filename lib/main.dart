import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/common/colors.dart';

import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:tubes_flutter/provider/story_provider.dart';
import 'package:tubes_flutter/ui/wrapper_page.dart';
import 'package:tubes_flutter/ui/auth/login_page.dart';
import 'package:tubes_flutter/ui/auth/register_page.dart';
import 'package:tubes_flutter/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Touristenziel",
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: greyColor),
        ),
        home: const WrapperPage(),
        onGenerateRoute: (RouteSettings settings){
          switch(settings.name){
            case LoginPage.routeName:
              return MaterialPageRoute(builder: (_) => const LoginPage());
            case RegisterPage.routeName:
              return MaterialPageRoute(builder: (_) => const RegisterPage());
            case MyHomePage.routeName:
              return MaterialPageRoute(builder: (_) => const MyHomePage(title: "Touristenziel",));
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}