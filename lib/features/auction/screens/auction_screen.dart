import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../../constants/global_variables.dart';
import '../../search/screens/search_screen.dart';

class AuctionScreen extends StatefulWidget {
  static const routeName = '/auction-screen';
  const AuctionScreen({Key? key}) : super(key: key);

  @override
  State<AuctionScreen> createState() => _AuctionScreenState();
}

class _AuctionScreenState extends State<AuctionScreen> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (() {}),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: 'Search Naulo.np',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
            left: 80,
            top: 15,
            right: 80,
            child: Center(
              child: Text(
                'Live Auction',
                style: TextStyle(
                  color: GlobalVariable.secondaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 80,
            right: 80,
            top: 60,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1686890121533-ac7aecfb15cf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 350,
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 40, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rocky (Pure Breed labrador)",
                        style: TextStyle(
                          color: GlobalVariable.selectedNavBarColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Owner",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black.withOpacity(0.2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Ending in",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black.withOpacity(0.2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://th.bing.com/th/id/OIP.FMXcWvy8DeSem2kV_8KH0gHaEK?w=293&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Pew di pie",
                            style: TextStyle(
                              // color: GlobalVariable.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                            ),
                          ),
                          const Text(
                            "18:00:00",
                            style: TextStyle(
                              // color: GlobalVariable.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                          // color: GlobalVariable.secondaryColor,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Meet Rocky, a spirited and affectionate four-legged friend who is on a quest to find his forever home. Rocky is a bundle of joy, ready to shower you with unconditional love and endless adventures.\nBut right now, Rocky finds himself longing for a place to call his own. A place where he can run, play, and be cherished by a loving family.\nRocky is a loyal companion, always by your side through thick and thin. Whether it's a morning jog or a cozy movie night, he's always up for anything! So, if you're searching for a furry friend who will fill your days with joy, love, and endless laughter, look no further than Rocky!\nReach out to us today, and give Rocky the home he's been dreaming of. Together, you'll embark on a journey filled with love and unforgettable moments.",
                        maxLines: 8,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 25),
                              child: Column(
                                children: const [
                                  Text(
                                    "Highest Bid",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "20.92 Dollar",
                                    style: TextStyle(
                                      // color: GlobalVariable.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 130,
                            ),
                            Container(
                              height: 35,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.yellow.shade300,
                              ),
                              child: const Center(
                                child: Text(
                                  'Place a bid',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
