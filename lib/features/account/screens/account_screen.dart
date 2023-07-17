import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../widgets/below_app_bar.dart';
import '../widgets/orders.dart';
import '../widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                // child: Image.asset(
                //   'assets/images/naulo2.jpg',
                //   width: 120,
                //   height: 45,
                // ),
                child: Text(
                  "Naulo Bazzar",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 25),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          BelowAppBar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
          SizedBox(
            height: 20,
          ),
          Orders(),
        ],
      ),
    );
  }
}
