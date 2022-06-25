import 'package:flutter/material.dart';
import 'package:tubes_flutter/common/constants.dart';
import 'package:tubes_flutter/model/user_register_response.dart';
import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/common/text_styles.dart';
import 'package:tubes_flutter/widget/custom_form_field.dart';
import 'package:tubes_flutter/common/colors.dart';

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

  Future<void> _register() async{
    setState(() => _onSend = true);
    try {
      UserProvider provider = context.read<UserProvider>();
      UserRegisterResponse register = await provider.register(
        username: _usernameController.text, 
        name: _nameController.text, 
        email: _emailController.text, 
        address: _addressController.text, 
        password: _passwordController.text, 
        conPassword: _conPasswordController.text);

      setState(() => _onSend = false);

      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Register Successfully!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
      );
    } catch (e) {
      showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Register Successfully!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
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
                                  textEditingController: _nameController,
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
                                  textEditingController: _addressController,
                                  textHint: 'Address',
                                  prefixIcon: Icons.home,
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
                                        _register();
                                      }
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: blackText.copyWith(fontSize: 16),
                                    ),
                                  ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text("Already have? "),
                              TextButton(
                                child: Text(
                                  "Login",
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
                                    Navigator.pop(context);
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