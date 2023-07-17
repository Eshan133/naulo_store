import 'package:flutter/material.dart';
import 'package:naulo/features/auth/services/auth_service.dart';

import 'account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  final AuthService _authService = AuthService();

  void logOut() {
    _authService.logOut(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Your Orders", onTap: () {}),
            AccountButton(text: "Turn Seller", onTap: () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(text: "Log Out", onTap: logOut),
            AccountButton(text: "Your Whis List", onTap: () {}),
          ],
        ),
      ],
    );
  }
}
