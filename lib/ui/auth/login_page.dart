import 'package:flutter/material.dart';
import 'package:tubes_flutter/common/constants.dart';
import 'package:tubes_flutter/model/user_response.dart';
import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/common/text_styles.dart';
import 'package:tubes_flutter/widget/custom_form_field.dart';
import 'package:tubes_flutter/common/colors.dart';
import 'package:tubes_flutter/home.dart';
import 'package:tubes_flutter/ui/auth/register_page.dart';

class LoginPage extends StatefulWidget{
  static const routeName = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _onSend = false;

  Future<void> _login() async{
    setState(() => _onSend = true);
    UserProvider provider = context.read<UserProvider>();
    UserResponse auth = await provider.login(username: _usernameController.text, password: _passwordController.text);
    print(auth);
    if(auth.data.accessToken == null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            loginFailed,
          ),
        ),
      );
    }else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MyHomePage.routeName,
        (Route<dynamic> route) => false,
      );
    }
    setState(() => _onSend = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultMargin,vertical: defaultMargin),
                      child: Column(
                        children: [
                          const SizedBox(height: 45),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sign In!',
                                  style: primaryText.copyWith(fontSize: 28),
                                ),
                                const SizedBox(height: 20),
                                CustomFormField(
                                  textEditingController: _usernameController,
                                  textHint: 'Username',
                                  prefixIcon: Icons.people,
                                  enable: !_onSend,
                                ),
                                const SizedBox(height: 30),
                                CustomFormField(
                                  textEditingController: _passwordController,
                                  textHint: 'Password',
                                  obsecureText: true,
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon: Icons.visibility,
                                  enable: !_onSend,
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: _onSend
                                ? const LinearProgressIndicator()
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: primaryColor,
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _login();
                                      }
                                    },
                                    child: Text(
                                      'Sign In',
                                      style: blackText.copyWith(fontSize: 16),
                                    ),
                                  ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("Don't have an account? "),
                              TextButton(
                                child: Text(
                                  "Register",
                                  style: primaryText.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(10, 30),
                                  alignment: Alignment.centerLeft,
                                ),
                                onPressed: () {
                                  if (!_onSend) {
                                    Navigator.pushNamed(
                                      context, RegisterPage.routeName);
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}