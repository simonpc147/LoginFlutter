import 'package:flutter/material.dart';

class FirstViewController extends ChangeNotifier {
  Size size = const Size(0, 0);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _acceptTerms = false;
  bool _receiveEmail = false;

  bool get acceptTerms => _acceptTerms;
  bool get receiveEmail => _receiveEmail;

  void setAcceptTerms(bool value) {
    _acceptTerms = value;
    notifyListeners();
  }

  void setReceiveEmail(bool value) {
    _receiveEmail = value;
    notifyListeners();
  }

  void goRecoverPassword(BuildContext context) {
    Navigator.pushNamed(context, 'recover_password');
  }
}
