import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/color_util.dart';
import '../core/widgets/bottom_nav_bar.dart';
import '../core/widgets/liesure_Card.dart';
import 'liesure_booking.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> badgesList = [
    {
      'title': 'Tour Guide',
      'icon': Icons.tour,
      'color': Colors.blue,
    },
    {
      'title': 'First Ride',
      'icon': Icons.directions_car,
      'color': Colors.green,
    },
    {
      'title': '5 Stars',
      'icon': Icons.star,
      'color': Colors.amber,
    },
    {
      'title': 'VIP',
      'icon': Icons.workspace_premium,
      'color': Colors.purple,
    },
  ];

  final List<Map<String, dynamic>> leisureList = [
    {
      'imagePath': 'assets/images/Rectangle 2976.png',
      'title': 'Boat Cruise',
      'price': '₦100,000 / hr',
    },
    {
      'imagePath': 'assets/images/Rectangle 2977.png',
      'title': 'Transportation',
      'price': '₦200,000 / trip',
    },
    {
      'imagePath': 'assets/images/image 1.png',
      'title': 'Kayak',
      'price': '₦25,000 / hr',
    },
    {
      'imagePath': 'assets/images/Rectangle 2976 (1).png',
      'title': 'Jet Ski',
      'price': '₦50,000 / hr',
    },
    {
      'imagePath': 'assets/images/Rectangle 2976 (2).png',
      'title': 'Sailing',
      'price': '₦75,000 / hr',
    },
    {
      'imagePath': 'assets/images/Rectangle 2976 (3).png',
      'title': 'Kayaks',
      'price': '₦30,000 / hr',
    },
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 24.r,
                    backgroundImage: AssetImage('assets/images/Group 65.png'),
                  ),
                  Row(
                    children: [
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -8.h, end: -8.w),
                        badgeContent: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: AppColors.accentOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: AppColors.inputFieldBlue,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.notifications_outlined,
                            color: AppColors.textWhite,
                            size: 24.w,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -8.h, end: -8.w),
                        badgeContent: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: AppColors.accentOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: AppColors.inputFieldBlue,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: AppColors.textWhite,
                            size: 24.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/crown.png",
                              height: 24.h,
                              width: 24.w,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                'Silver Membership Plan',
                                style: TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        'Leisures',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 19.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: leisureList.length,
                        itemBuilder: (context, index) {
                          final leisure = leisureList[index];
                          return LeisureCard(
                            imagePath: leisure['imagePath'],
                            title: leisure['title'],
                            price: leisure['price'],
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LiesureBooking(
                                    imagePath: leisure['imagePath'],
                                    title: leisure['title'],
                                    price: leisure['price'],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(height: 32.h),
                      Text(
                        'Your Badges',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: badgesList.length,
                        itemBuilder: (context, index) {
                          final badge = badgesList[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: badge['color'].withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: badge['color'].withOpacity(0.3),
                                width: 1.w,
                              ),
                            ),
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  badge['icon'] as IconData,
                                  color: badge['color'] as Color,
                                  size: 32.w,
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  badge['title'] as String,
                                  style: TextStyle(
                                    color: AppColors.textWhite,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 32.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}