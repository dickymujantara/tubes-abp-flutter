import 'package:flutter/material.dart';
import 'package:tubes_flutter/common/constants.dart';
import 'package:tubes_flutter/model/user_response.dart';
import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/common/text_styles.dart';
import 'package:tubes_flutter/widget/custom_form_field.dart';
import 'package:tubes_flutter/common/colors.dart';
import 'package:tubes_flutter/ui/auth/login_page.dart';

class RegisterPage extends StatefulWidget{
  static const routeName = "register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _conPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _onSend = false;

  Future<void> _login() async{
    setState(() => _onSend = true);
    // UserProvider provider = context.read<UserProvider>();
    // UserResponse auth = await provider.login(username: _usernameController.text, password: _passwordController.text);
    // print(auth);
    // if(auth.data?.token == null){
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(
    //         loginFailed,
    //       ),
    //     ),
    //   );
    // }else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LoginPage.routeName,
        (Route<dynamic> route) => false,
      );
    // }
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
                                  'Sign Up!',
                                  style: primaryText.copyWith(fontSize: 28),
                                ),
                                const SizedBox(height: 20),
                                CustomFormField(
                                  textEditingController: _usernameController,
                                  textHint: 'Username',
                                  prefixIcon: Icons.people,
                                  enable: !_onSend,
                                ),
                                const SizedBox(height: 10),
                                CustomFormField(
                                  textEditingController: _usernameController,
                                  textHint: 'Full Name',
                                  prefixIcon: Icons.perm_identity,
                                  enable: !_onSend,
                                ),
                                const SizedBox(height: 10),
                                CustomFormField(
                                  textEditingController: _emailController,
                                  textHint: 'Email',
                                  prefixIcon: Icons.mail,
                                  enable: !_onSend,
                                ),
                                const SizedBox(height: 10),
                                CustomFormField(
                                  textEditingController: _passwordController,
                                  textHint: 'Password',
                                  obsecureText: true,
                                  prefixIcon: Icons.lock_outline,
                                  suffixIcon: Icons.visibility,
                                  enable: !_onSend,
                                ),
                                const SizedBox(height: 10),
                                CustomFormField(
                                  textEditingController: _conPasswordController,
                                  textHint: 'Confirm Password',
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
                                      'Sign Up',
                                      style: blackText.copyWith(fontSize: 16),
                                    ),
                                  ),
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