import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/common_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../constants/global_variables.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  List<PaymentItem> paymentItems = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   paymentItems.add(
  //     PaymentItem(
  //       amount: widget.totalAmount,
  //       label: 'Total Amount',
  //       status: PaymentItemStatus.final_price,
  //     ),
  //   );
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  void onGooglePayResult(res) {}
  void onApplePayResult(res) {}
  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    var address = '101 Fake Address, America';
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appBarGradient),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController,
                      hintText: "Flat, House np, Building",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: areaController,
                      hintText: "Area, Street",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: pincodeController,
                      hintText: "Pincode",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: cityController,
                      hintText: "Town/City",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              // ApplePayButton(
              //   paymentConfiguration:
              //       PaymentConfiguration.fromJsonString('applepay.json'),
              //   paymentItems: paymentItems,
              //   style: ApplePayButtonStyle.black,
              //   type: ApplePayButtonType.buy,
              //   margin: const EdgeInsets.only(top: 15.0),
              //   height: 50,
              //   onPaymentResult: onApplePayResult,
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
              // GooglePayButton(
              //   onPaymentResult: onGooglePayResult,
              //   paymentItems: paymentItems,
              //   height: 50,
              //   type: GooglePayButtonType.buy,
              //   margin: const EdgeInsets.only(top: 15),
              //   loadingIndicator: const Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
