import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../screens/auction_screen.dart';

class AuctionButton extends StatelessWidget {
  const AuctionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToAuctionScreen() {
      Navigator.pushNamed(context, AuctionScreen.routeName);
    }

    return InkWell(
      onTap: navigateToAuctionScreen,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: GlobalVariable.selectedNavBarColor.withOpacity(0.7),
        ),
        child: const Center(
          child: Text(
            "Auction",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
