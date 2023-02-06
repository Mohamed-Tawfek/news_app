 import 'package:flutter/material.dart';
import 'package:news_app/layout/home_screen.dart';
import 'package:news_app/shared/network/local/cash_helper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
    OnboardingScreen({Key? key}) : super(key: key);
 final List<OnBoardingItem> onBoardingItems = [
    OnBoardingItem(imagePath: 'assets/images/1.png', title: 'اخبار عاجلة'),
    OnBoardingItem(imagePath: 'assets/images/2.png', title: 'العالم بين يديك'),
    OnBoardingItem(
        imagePath: 'assets/images/3.png', title: 'حجب الاخبار الكاذبة'),
    OnBoardingItem(
        imagePath: 'assets/images/4.png', title: 'اختيار الاخبار بعناية'),
    OnBoardingItem(
        imagePath: 'assets/images/5.png', title: 'استمتع واترك الباقى لنا'),
  ];
    final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  CashHelper.setData(key: 'onBoarding', value: true)
                      .then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const HomeScreen()),
                            (route) => false);
                  });

                },
                child: const Text(
                  'تخطى',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: pageController,
                  children: [
                    buildPageViewItem(context, item: onBoardingItems[0]),
                    buildPageViewItem(context, item: onBoardingItems[1]),
                    buildPageViewItem(context, item: onBoardingItems[2]),
                    buildPageViewItem(context, item: onBoardingItems[3]),
                    buildPageViewItem(context, item: onBoardingItems[4]),
                  ],
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController, // PageController
                    count: onBoardingItems.length,
                    effect: const WormEffect(),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                    child: IconButton(
                      iconSize: 30,
                      onPressed: () {
                        if (pageController.page == onBoardingItems.length-1) {
                          CashHelper.setData(key: 'onBoarding', value: true)
                              .then((value) {

                                Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                    type: PageTransitionType.leftToRight,
                                    child: const HomeScreen()),
                                    (route) => false);
                          });

                        } else {

                          pageController.nextPage(
                              duration: const Duration(milliseconds: 900),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }

                      },
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageViewItem(context, {required OnBoardingItem item}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset(
            item.imagePath,
            height: 300,
            width: 400,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class OnBoardingItem {
  String imagePath;
  String title;
  OnBoardingItem({required this.imagePath, required this.title});
}
