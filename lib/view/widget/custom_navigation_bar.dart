import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;
  void onItmeTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (BottomNavigationBar == selectedIndex) {
      ColorFiltered(colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.color),
      child: Image.asset('assets/icons/star-sharp.png'),
      );
    }
    return Scaffold(
      
      bottomNavigationBar: SizedBox(
        height: 120,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            elevation: 0,
            selectedFontSize: 15,
            unselectedFontSize: 15,
            onTap: onItmeTap,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/star-sharp.png', height: 30,), label: '내 팀'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/trophy.png', height: 30), label: '순위'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/calendar-check.png', height: 30),
                  label: '일정'),
              BottomNavigationBarItem(
                  icon: Badge(
                    alignment: AlignmentDirectional.lerp(
                        AlignmentDirectional.topEnd,
                        AlignmentDirectional.centerStart,
                        -10),
                    label: const Text('a'),
                    backgroundColor: Colors.blue,
                    child: Image.asset('assets/icons/cart-shopping.png', height: 30,),
                  ),
                  label: '마켓'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/user.png', height: 30,), label: 'my'),
            ],
            
            ),
      ),
          
    );
  }
}
