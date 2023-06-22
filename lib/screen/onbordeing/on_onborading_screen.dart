import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_to_do_app/constant/color.dart';
import 'package:my_to_do_app/data/model/onbording_data/on_borading_data.dart';
import 'package:my_to_do_app/screen/home/home_screen.dart';

class OnBoradingScreen extends StatefulWidget {
  const OnBoradingScreen({super.key});

  @override
  State<OnBoradingScreen> createState() => _OnBoradingScreenState();
}

class _OnBoradingScreenState extends State<OnBoradingScreen>
    with SingleTickerProviderStateMixin {
  final List<OnBorading> _onBoradingInfo = onBoradingInfoList;
  late final PageController _pageController;
  late final AnimationController _animationController;
  int currentPage = 0;

  double percent = 0.25;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: onBoradingInfoList.length,
                  onPageChanged: (value) {
                    if (value >= currentPage) {
                      setState(() {
                        currentPage = value;
                        percent += 0.25;
                      });
                    } else {
                      setState(() {
                        currentPage = value;
                        percent -= 0.25;
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Lottie.asset(
                             _onBoradingInfo[index].image,
                              height: 350,
                              width: 350,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                _onBoradingInfo[index].title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  _onBoradingInfo[index].description,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        dotIndecetor(),
                        CupertinoButton(
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    CupertinoButton(
                      onPressed: () {
                        if (currentPage == _onBoradingInfo.length - 1) {
                          Get.to(const HomeScreen(),
                              transition: Transition.fadeIn);
                        }
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: CircularProgressIndicator(
                              value: percent,
                              backgroundColor: Colors.black12,
                              valueColor:
                                  const AlwaysStoppedAnimation(kPrimaryColor),
                            ),
                          ),
                          const CircleAvatar(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget dotIndecetor() {
    return Row(
      children: List.generate(_onBoradingInfo.length, (index) {
        return _buildAnimatedContainer(index);
      }),
    );
  }

  Widget _buildAnimatedContainer(int index) {
    return AnimatedContainer(
      padding: const EdgeInsets.only(right: 4),
      duration: const Duration(milliseconds: 400),
      curve: Curves.linear,
      child: Container(
        decoration: BoxDecoration(
          color: index == currentPage ? kPrimaryColor : Colors.black38,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 10,
        width: index == currentPage ? 24 : 10,
      ),
    );
  }
}
