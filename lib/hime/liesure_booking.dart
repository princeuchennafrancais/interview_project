import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/utils/color_util.dart';

class LiesureBooking extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;

  const LiesureBooking({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  State<LiesureBooking> createState() => _LiesureBookingState();
}

class _LiesureBookingState extends State<LiesureBooking> {
  int selectedPeople = 10;
  String selectedDuration = '1hr';
  String selectedType = 'Instructor';
  TextEditingController peopleController = TextEditingController();

  bool get isJetSki => widget.title.toLowerCase().contains('jet ski');

  String _extractPriceNumber(String priceString) {
    final regex = RegExp(r'₦([\d,]+)');
    final match = regex.firstMatch(priceString);
    if (match != null) {
      return match.group(1)!.replaceAll(',', '');
    }
    return '100000';
  }

  String _calculateTotal() {
    int basePrice = int.parse(_extractPriceNumber(widget.price));
    int hours = int.parse(selectedDuration.replaceAll('hr', '').replaceAll('s', ''));
    int people = peopleController.text.isNotEmpty
        ? int.tryParse(peopleController.text) ?? selectedPeople
        : selectedPeople;

    int total = basePrice * hours;

    String formattedPrice = total.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
    );

    return '₦$formattedPrice.00';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      widget.imagePath,
                      width: double.infinity,
                      height: 400.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 400.h,
                          color: AppColors.inputFieldBlue,
                          child: Icon(
                            Icons.image_not_supported,
                            size: 50.sp,
                            color: AppColors.textWhite.withOpacity(0.5),
                          ),
                        );
                      },
                    ),
                    Positioned(
                      top: 50.h,
                      left: 16.w,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: AppColors.textWhite,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 20.sp,
                            color: AppColors.textBlack,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primaryBlue,
                        AppColors.darkBlue,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 28.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Enjoy an amazing ${widget.title.toLowerCase()} experience at lagos water craft.',
                          style: TextStyle(
                            color: AppColors.textWhite.withOpacity(0.9),
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        if (isJetSki) ...[
                          Text(
                            'Type?',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: AppColors.darkBlue,
                                borderRadius: BorderRadius.circular(30.r)
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedType = 'Instructor';
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 14.h),
                                      margin: EdgeInsets.all(4.r),
                                      decoration: BoxDecoration(
                                        color: selectedType == 'Instructor'
                                            ? AppColors.buttonBlue
                                            : AppColors.inputFieldBlue.withOpacity(0.3),                                        borderRadius: BorderRadius.circular(26.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Instructor',
                                          style: TextStyle(
                                            color: AppColors.textWhite,
                                            fontSize: 16.sp,
                                            fontWeight: selectedType == 'Instructor'
                                                ? FontWeight.w600
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Container(
                                  width: 40.w,
                                  child: CustomPaint(
                                    painter: DashedLinePainter(),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedType = 'Solo';
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 14.h),
                                      margin: EdgeInsets.all(4.r),
                                      decoration: BoxDecoration(
                                        color: selectedType == 'Solo'
                                            ? AppColors.buttonBlue
                                            : AppColors.inputFieldBlue.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(26.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Solo',
                                          style: TextStyle(
                                            color: AppColors.textWhite,
                                            fontSize: 16.sp,
                                            fontWeight: selectedType == 'Solo'
                                                ? FontWeight.w600
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ] else ...[
                          Text(
                            'How many people?',
                            style: TextStyle(
                              color: AppColors.textWhite,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.buttonBlue,
                              borderRadius: BorderRadius.circular(26.r),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildPeopleOption(10),
                                  _buildDashedLine(),
                                  _buildPeopleOption(15),
                                  _buildDashedLine(),
                                  _buildPeopleOption(20),
                                  _buildDashedLine(),
                                  _buildPeopleOption(25),
                                  _buildDashedLine(),
                                  _buildPeopleOption(30),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            controller: peopleController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: AppColors.textWhite),
                            decoration: InputDecoration(
                              hintText: 'Enter amount of people',
                              hintStyle: TextStyle(
                                color: AppColors.hintTextColor,
                                fontSize: 14.sp,
                              ),
                              filled: true,
                              fillColor: AppColors.inputFieldBlue.withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.r),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 16.h,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ],
                        SizedBox(height: 32.h),
                        Text(
                          'Duration?',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            _buildDurationOption('1hr'),
                            SizedBox(width: 12.w),
                            _buildDurationOption('2hrs'),
                            SizedBox(width: 12.w),
                            _buildDurationOption('3hrs'),
                            SizedBox(width: 12.w),
                            _buildDurationOption('4hrs'),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.inputFieldBlue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Select Duration',
                                style: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: AppColors.hintTextColor,
                                size: 24.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          'Time',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.inputFieldBlue.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                isJetSki ? 'Enter time' : '12 : 00 PM  |  28 / October',
                                style: TextStyle(
                                  color: isJetSki
                                      ? AppColors.hintTextColor
                                      : AppColors.textWhite,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Icon(
                                Icons.access_time,
                                color: AppColors.hintTextColor,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 32.h),
                        Text(
                          'Description',
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in',
                          style: TextStyle(
                            color: AppColors.textWhite.withOpacity(0.8),
                            fontSize: 14.sp,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Container(
                          padding: EdgeInsets.all(20.w),
                          decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Duration:',
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    selectedDuration == '1hr'
                                        ? '1 Hour'
                                        : '${selectedDuration.replaceAll('hrs', '')} Hours',
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total:',
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  Text(
                                    _calculateTotal(),
                                    style: TextStyle(
                                      color: AppColors.textWhite,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.inputFieldBlue.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.shopping_bag_outlined,
                                        color: AppColors.textWhite,
                                        size: 20.sp,
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        'Add to Bag',
                                        style: TextStyle(
                                          color: AppColors.textWhite,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 56.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.buttonBlue,
                                    borderRadius: BorderRadius.circular(32.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(
                                        color: AppColors.textWhite,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeopleOption(int number) {
    bool isSelected = selectedPeople == number;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPeople = number;
          peopleController.clear();
        });
      },
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.buttonBlue
              : AppColors.inputFieldBlue.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: AppColors.textWhite,
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashedLine() {
    return Container(
      width: 20.w,
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }

  Widget _buildDurationOption(String duration) {
    bool isSelected = selectedDuration == duration;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDuration = duration;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.buttonBlue
              : AppColors.inputFieldBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(
          duration,
          style: TextStyle(
            color: AppColors.textWhite,
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..strokeWidth = 2;

    double dashWidth = 4;
    double dashSpace = 3;
    double startY = size.height / 2;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX + dashWidth, startY),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}