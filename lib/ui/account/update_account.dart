import 'package:flutter/material.dart';
import 'package:tubes_flutter/model/user_update_response.dart';
import 'package:tubes_flutter/widget/custom_scaffold.dart';
import 'package:tubes_flutter/common/colors.dart';
import 'package:tubes_flutter/common/text_styles.dart';
import 'package:tubes_flutter/ui/auth/login_page.dart';
import 'package:tubes_flutter/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:tubes_flutter/widget/custom_form_field.dart';


class UpdateAccount extends StatefulWidget{
  const UpdateAccount({Key? key}) : super(key: key);
  static const routeName = "updateprofile";

  @override
  _UpdateAccountState createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {
  final _formKey = GlobalKey<FormState>();
  bool _onSend = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    _userData();
    super.initState();
  }

  Future<void> _userData() async {
    UserProvider provider = context.read<UserProvider>();

    String email = provider.email ?? "";
    String name = provider.name ?? "";
    String address = provider.address ?? "";
    String phoneNumber = provider.phoneNumber ?? "";

    _emailController = TextEditingController(text : email);
    _nameController = TextEditingController(text : name);
    _addressController = TextEditingController(text : address);
    _phoneNumberController = TextEditingController(text : phoneNumber);
  }

  Future<void> _updateProfile() async {
    UserProvider provider = context.read<UserProvider>();
    setState(() => _onSend = true);

    // try {
      
      UserUpdateResponse updateProfile = await provider.updateProfile(
        name: _nameController.text, 
        email: _emailController.text, 
        phoneNumber: _phoneNumberController.text, 
        address: _addressController.text
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Update Profile Success!"),
        ),
      );

    // } catch (e) {
    //   print(e);
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text("Update Profile Failed!"),
    //     ),
    //   );
    // }

  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      textAppbar: "Update Profile", 
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
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CustomFormField(
                textEditingController: _nameController,
                textHint: 'Fullname',
                prefixIcon: Icons.people,
                enable: !_onSend,
              ),
              const SizedBox(height: 20),
              CustomFormField(
                textEditingController: _emailController,
                textHint: 'Email',
                prefixIcon: Icons.mail,
                enable: !_onSend,
              ),
              const SizedBox(height: 20),
              CustomFormField(
                textEditingController: _addressController,
                textHint: 'Address',
                prefixIcon: Icons.home,
                enable: !_onSend,
              ),
              const SizedBox(height: 20),
              CustomFormField(
                textEditingController: _phoneNumberController,
                textHint: 'Phone Number',
                prefixIcon: Icons.phone,
                enable: !_onSend,
              ),
            ],
          )
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
          ),
          onPressed: () {
            _updateProfile();
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
            Navigator.pop(context);
          },
          child: Text(
            'Back',
            style: blackText.copyWith(fontSize: 16),
          ),
        ),
      ]
    );
  }
}
