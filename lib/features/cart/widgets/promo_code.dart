import 'package:flutter/material.dart';

class PromoCode extends StatelessWidget {
  const PromoCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _promoController = TextEditingController();

    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40),
            child: const Text(
              "Promo Code",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black26,
              ),
            ),
          ),
          const SizedBox(
            width: 140,
          ),
          Container(
            height: 40,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Apply",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
