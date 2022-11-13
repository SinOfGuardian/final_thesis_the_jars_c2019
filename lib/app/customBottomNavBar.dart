//State class
  import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_thesis_the_jars_c2019/pages/CartPage.dart';
import 'package:final_thesis_the_jars_c2019/pages/FavoritePage.dart';
import 'package:final_thesis_the_jars_c2019/pages/Homepage.dart';
import 'package:final_thesis_the_jars_c2019/pages/Homepage_Page.dart';
import 'package:final_thesis_the_jars_c2019/pages/ProfileInfoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customBottomNavBar extends StatefulWidget {
  const customBottomNavBar({super.key});


  @override
  State<customBottomNavBar> createState() => _customBottomNavBarState();
}

class _customBottomNavBarState extends State<customBottomNavBar> {
int _page = 0;
 final PageController _pageController = PageController();
  List<Widget> _screens = [HomePagePage(),favoritPage(), CartPage(), ProfileinFo()];
  void _onPageChanged(int index){}

  void _onItemTapped(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
  }
  @override
  Widget build(BuildContext context) {
     double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
           
      
        bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: _onItemTapped,
        
        // backgroundColor: Color.fromARGB(0, 49, 129, 84),
        // selectedIndex: _pageController,
        // onTap: (index){
        //    setState(() {
        //       _pageController = index;
        //     });
        // },
        height: 50,
        color: const Color.fromARGB(255, 190, 143, 77),
        items:  const[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
       
          
           Icon(
            CupertinoIcons.heart_fill,
            size: 30,
            color: Colors.white,
            ),
          
            Icon(
            Icons.shopping_cart_checkout,
            size: 30,
            color: Colors.white,
            ),
    
           Icon(
            CupertinoIcons.person_alt,
            size: 30,
            color: Colors.white,
           
          ),

          //  Icon(
          //   Icons.list,
          //   size: 30,
          //   color: Colors.white,
          // ),
          
        ],
        
      ),
    );
  }
}
