import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';
import '../../../providers/user_provider.dart';
import '../../product_details/services/product_details_services.dart';
import '../services/cart_services.dart';

class NewCartProduct extends StatefulWidget {
  final int index;
  const NewCartProduct({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  State<NewCartProduct> createState() => _NewCartProductState();
}

class _NewCartProductState extends State<NewCartProduct> {
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  final CartServices cartServices = CartServices();
  void increaseQuantity(Product product) {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final productCart = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(productCart['product']);
    final quantity = productCart['quantity'];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 90,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // image: const DecorationImage(
                  //     image: NetworkImage('/assets/images/glass.jpg'),
                  //     fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                width: 75,
                height: 75,
                child: Image.network(
                  product.images[0],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      // 'Sunglasses',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                          fontSize: 11, color: Colors.black.withOpacity(0.3)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        GestureDetector(
                          onTap: () => decreaseQuantity(product),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  child: const Icon(
                                    Icons.remove_circle_outline,
                                    size: 27,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  quantity.toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () => increaseQuantity(product),
                                  child: Container(
                                    child: const Icon(
                                      Icons.add_circle_outline_rounded,
                                      size: 27,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
