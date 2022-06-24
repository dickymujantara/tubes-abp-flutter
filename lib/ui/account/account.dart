import 'package:flutter/material.dart';
import 'package:tubes_flutter/widget/custom_scaffold.dart';
import 'package:tubes_flutter/common/colors.dart';
import 'package:tubes_flutter/common/text_styles.dart';
import 'package:tubes_flutter/ui/auth/login_page.dart';

class Account extends StatelessWidget {
  static const routeName = "profile";
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
              Text('admin', style: primaryText.copyWith(fontSize: 20), overflow: TextOverflow.ellipsis,),
              Text("admin@gmail.com",style: greyText.copyWith(fontSize: 15),overflow: TextOverflow.ellipsis)
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
                    TextSpan(text: "Admin", style: blackText),
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
                    TextSpan(text: 'Telkom University', style: blackText),
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 150,
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
