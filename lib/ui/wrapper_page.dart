import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/common/colors.dart';
import 'package:tubes_flutter/ui/auth/login_page.dart';

import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:tubes_flutter/home.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({Key? key}) : super(key: key);

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  Future<void> _initData() async {
    UserProvider provider = context.read<UserProvider>();
    await provider.init();
    Navigator.pushReplacementNamed(
      context,
      provider.token == null ? LoginPage.routeName : MyHomePage.routeName,
    );
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
    );
  }
}