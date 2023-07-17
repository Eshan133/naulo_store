import 'package:flutter/material.dart';

import '../../../common/widgets/loader.dart';
import '../../../constants/global_variables.dart';
import '../../../models/product.dart';
import '../../product_details/screens/product_detail_screen.dart';
import '../services/home_services.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static const String routeName = '/category-details';

  final String category;
  const CategoryDetailsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

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
          title: Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Text(
              widget.category,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: productList == null
          ? Loader()
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Keep Shopping for ${widget.category}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.4,
                      ),
                      itemCount: productList!.length,
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: (() {
                            Navigator.pushNamed(
                                context, ProductDetailScreen.routeName,
                                arguments: product);
                          }),
                          child: Column(children: [
                            SizedBox(
                              height: 130,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                    product.images[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 5,
                                right: 15,
                              ),
                              child: Text(
                                product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ]),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
