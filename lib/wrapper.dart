import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temis/User/ui/screens/home.dart';
import 'package:temis/User/ui/screens/sign_in.dart';

import 'User/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // Return HomePage or AuthenticatePage
    if (user == null) {
      return SignIn();
    } else {
      return Home();
    }
  }
}
