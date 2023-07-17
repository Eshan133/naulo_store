import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../models/product.dart';
import '../../product_details/screens/product_detail_screen.dart';
import '../services/home_services.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailsScreen() {
    Navigator.pushNamed(context, ProductDetailScreen.routeName,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: navigateToDetailsScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 10),
                      child: const Center(
                        child: Text(
                          "Deal of the day",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.deepPurple),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Image.network(
                      product!.images[0],
                      // height: 235,
                      fit: BoxFit.contain,
                    ),

                    // Container(
                    //   padding: const EdgeInsets.only(
                    //     left: 15,
                    //   ),
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     '\$${product!.price}',
                    //     style: const TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w700,
                    //     ),
                    //   ),
                    // ),

                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: product!.images
                    //         .map(
                    //           (e) => Image.network(
                    //             e,
                    //             fit: BoxFit.fitWidth,
                    //             width: 100,
                    //             height: 100,
                    //           ),
                    //         )
                    //         .toList(),
                    //   ),
                    // ),
                    // Container(
                    //   padding:
                    //       const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                    //   alignment: Alignment.topLeft,
                    //   child: Text(
                    //     "See all deals",
                    //     style: TextStyle(
                    //       color: Colors.cyan[800],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
  }
}
