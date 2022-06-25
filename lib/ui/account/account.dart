import 'package:flutter/material.dart';
import 'package:tubes_flutter/widget/custom_scaffold.dart';
import 'package:tubes_flutter/common/colors.dart';
import 'package:tubes_flutter/common/text_styles.dart';
import 'package:tubes_flutter/ui/auth/login_page.dart';
import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/ui/auth/login_page.dart';

class Account extends StatefulWidget{
  static const routeName = "profile";

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String _username = "";
  String _email = "";
  String _name = "";
  String _address = "";
  String _phoneNumber = "";

  @override
  void initState() {
    _userData();
    super.initState();
  }

  Future<void> _userData() async {
    UserProvider provider = context.read<UserProvider>();

    String username = provider.username ?? "";
    String email = provider.email ?? "";
    String name = provider.name ?? "";
    String address = provider.address ?? "";
    String phoneNumber = provider.phoneNumber ?? "";

    setState(() {
      _username = username;
      _email = email;
      _name = name;
      _address = address;
      _phoneNumber = phoneNumber;
    });
  }

  Future<void> _logout() async {
    showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Are you sure want to logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                UserProvider provider = context.read<UserProvider>();
                provider.logout();
                Navigator.popAndPushNamed(context, LoginPage.routeName);
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppbar: "Profile", 
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 17, top: 18),
              padding: EdgeInsets.all(1.2),
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(image: AssetImage('assets/default_profile.png')),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              height: 64,
              width: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: secondaryColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_username, style: primaryText.copyWith(fontSize: 20), overflow: TextOverflow.ellipsis,),
              Text(_email,style: greyText.copyWith(fontSize: 15),overflow: TextOverflow.ellipsis)
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8, bottom: 10),
          child: Text(
            'Detail',
            style: greyText.copyWith(fontSize: 15),
          )
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'Full Name\n',
                        style: greyText.copyWith(fontSize: 15)),
                    TextSpan(text: _name, style: blackText),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
              const VerticalDivider(
                color: Colors.greenAccent,
                thickness: 1,
                indent: 15,
                endIndent: 15,
                width: 20,
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'Address\n',
                        style: greyText.copyWith(fontSize: 15)),
                    TextSpan(text: _address, style: blackText),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'Email\n',
                        style: greyText.copyWith(fontSize: 15)),
                    TextSpan(text: _email, style: blackText),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: 'Phone Number\n',
                        style: greyText.copyWith(fontSize: 15)),
                    TextSpan(text: _name, style: blackText),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginPage.routeName,
              (Route<dynamic> route) => false,
            );
          },
          child: Text(
            'Update Profile',
            style: blackText.copyWith(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: infoColor,
          ),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginPage.routeName,
              (Route<dynamic> route) => false,
            );
          },
          child: Text(
            'Log Out',
            style: blackText.copyWith(fontSize: 16),
          ),
        ),
      ]
    );
  }
}
