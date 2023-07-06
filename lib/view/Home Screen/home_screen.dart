import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import '../../constatnts/colors.dart';
import '../../widgets/text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> names = <String>[
    'T-Shirts',
    'Trousers',
    'Shoes',
    'Socks',
    'Sunglasses',
    'Watches',
  ];

  final List<String> pics = <String>[
    'assets/images/tshirt.png',
    'assets/images/trousers.png',
    'assets/images/shoes.png',
    'assets/images/socks.png',
    'assets/images/sunglasses.png',
    'assets/images/wristwatch.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: 0,
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        iconSize: 27,
        containerHeight: 60,
        onItemSelected: (index) {},
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Ionicons.home_outline),
            title: const Text(
              'Home Page',
              textAlign: TextAlign.center,
            ),
            activeColor: AppColors.orange,
            inactiveColor: AppColors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Ionicons.cart_outline),
            title: const Text(
              'Your Cart',
              textAlign: TextAlign.center,
            ),
            textAlign: TextAlign.center,
            activeColor: AppColors.orange,
            inactiveColor: AppColors.black,
          ),
          BottomNavyBarItem(
            icon: const Icon(Ionicons.person_outline),
            title: const Text(
              'Your Profile',
              textAlign: TextAlign.center,
            ),
            activeColor: AppColors.orange,
            inactiveColor: AppColors.black,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Buyer',
                      style: GoogleFonts.rubik(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.orange),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  textField(
                    width: 60.w,
                    height: 7.5.h,
                    textType: TextInputType.name,
                    iconLead: Ionicons.search_outline,
                    iconSize: 24,
                    hintText: 'Search for a product',
                    labelText: 'Search for a product',
                    labelColor: AppColors.lightGrey,
                    labelFloating: FloatingLabelBehavior.never,
                    textSize: 18,
                    labelSize: 18,
                    hintSize: 14,
                    onSave: (value) {
                      //controller.email = value;
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.orange,
                        size: 3.6.h,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ImageSlideshow(
              indicatorColor: AppColors.orange,
              indicatorBackgroundColor: AppColors.lightGrey,
              onPageChanged: (value) {},
              autoPlayInterval: 2000,
              width: 100.w,
              height: 15.h,
              isLoop: true,
              children: [
                Image.asset(
                  'assets/images/scroll1.png',
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/scroll2.png',
                  fit: BoxFit.fill,
                ),
                Image.asset(
                  'assets/images/scroll3.png',
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                'Categories',
                style: GoogleFonts.rubik(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.orange),
              ),
            ),
            listViewCategory(),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 15),
              child: Text(
                'Best Selling',
                style: GoogleFonts.rubik(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.orange),
              ),
            ),
            listViewProducts()
          ],
        ),
      ),
    );
  }

  Widget listViewCategory() {
    return SizedBox(
      height: 14.h,
      child: ListView.separated(
        itemCount: names.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(38, 255, 164, 89),
                    ),
                    height: 65,
                    width: 65,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.asset(
                        pics[index],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    names[index],
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 0,
        ),
      ),
    );
  }

  Widget listViewProducts() {
    return SizedBox(
      height: 320,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 40.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: const Image(
                            image: NetworkImage(
                              'https://eg.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/95/905162/1.jpg?1422',
                            ),
                          )),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Oversize T-Shirt',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'description of this item is that',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          "100\$",
                          style: GoogleFonts.rubik(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 0,
        ),
      ),
    );
  }
}
