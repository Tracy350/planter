import 'package:flourish/auth/authenticate.dart';
import 'package:flourish/features/home/screen/homepage.dart';
import 'package:flourish/models/usermodels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel?>(context);
    if(userModel == null) {
      return const Authenticate();
    } else {
      return const Homepage();
    }
   
  }
}