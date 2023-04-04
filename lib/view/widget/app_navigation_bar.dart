import 'package:flutter/material.dart';
import 'package:sfac_project/util/app_color.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int selectedIndex = 0;
  void onItmeTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: SizedBox(
        height: 120,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30)
        ),
          child: BottomNavigationBar(
            backgroundColor: AppColor.white,
            elevation: 10,
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedIndex,
              selectedFontSize: 15,
              unselectedFontSize: 15,
              onTap: onItmeTap,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/star-sharp.png', height: 30), label: '내 팀',
                    activeIcon: Image.asset('assets/icons/star-sharp.png', height: 30, color: AppColor.mainBlue,)
                    ),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/trophy.png', height: 30), label: '순위',
                    activeIcon: Image.asset('assets/icons/trophy.png', height: 30, color: AppColor.mainBlue,)),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/calendar-check.png', height: 30),label: '일정',
                    activeIcon: Image.asset('assets/icons/calendar-check.png', height: 30, color: AppColor.mainBlue,),
                    ),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/cart-shopping.png', height: 30,),
                    label: '마켓',
                    activeIcon: Image.asset('assets/icons/cart-shopping.png', height: 30, color: AppColor.mainBlue,)),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/icons/user.png', height: 30,), label: 'my',
                    activeIcon: Image.asset('assets/icons/user.png', height: 30, color: AppColor.mainBlue,)),
              ],
              ),
        ),
      ),
          
    );
  }
}
