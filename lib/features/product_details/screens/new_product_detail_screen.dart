import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants/global_variables.dart';
import '../services/product_details_services.dart';

class NewProductDetailScreen extends StatefulWidget {
  static const String routeName = '/new-product-detail-screen';
  // final Product product;
  const NewProductDetailScreen({
    Key? key,
    // required this.product,
  }) : super(key: key);

  @override
  State<NewProductDetailScreen> createState() => _NewProductDetailScreenState();
}

class _NewProductDetailScreenState extends State<NewProductDetailScreen> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  double avgRating = 0;
  double myRating = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    double totalRating = 0;
    // for (int i = 0; i < widget.product.rating!.length; i++) {
    //   totalRating += widget.product.rating![i].rating;
    //   if (widget.product.rating![i].userId ==
    //       Provider.of<UserProvider>(context, listen: false).user.id) {
    //     myRating = widget.product.rating![i].rating;
    //   }
    // }
    // if (totalRating != 0) {
    //   avgRating = totalRating / widget.product.rating!.length;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(),
              height: 390,
              child: Image.asset(
                'assets/images/demo.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 370,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: GlobalVariable.greyBackgroundCOlor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Product Details"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Product Price",
                      style: TextStyle(
                          color: GlobalVariable.selectedNavBarColor,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: GlobalVariable.secondaryColor,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Container(
                  width: 35,
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                Container(
                  color: Colors.black,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
