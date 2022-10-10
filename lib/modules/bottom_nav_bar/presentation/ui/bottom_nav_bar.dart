import 'package:flutter/material.dart';
import 'package:my_home_doctor/configs/themes/app_colors.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static List<Widget> listPage = <Widget>[
    // const ContactsPage(),
    // const CompanyPage(),
    // const ScanPage(),
    // const DealsPage(),
    // const AccountPage(),
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: listPage.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(fontSize: 11.sp),
        selectedLabelStyle: TextStyle(fontSize: 11.sp, color: Colors.blue),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.quick_contacts_dialer,
              size: 28.sp,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.quick_contacts_dialer,
              size: 28.sp,
              color: Colors.black,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              size: 28.sp,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.business,
              size: 28.sp,
              color: Colors.black,
            ),
            label: 'Company',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 1.h),
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: AppColors.mainBlue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.camera_alt,
                size: 24.sp,
                color: Colors.white,
              ),
            ),
            activeIcon: Container(
              margin: EdgeInsets.only(top: 1.h),
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: AppColors.mainBlue,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.camera_alt,
                size: 24.sp,
                color: Colors.black,
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.data_exploration_outlined,
              size: 28.sp,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.data_exploration_outlined,
              size: 28.sp,
              color: Colors.black,
            ),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 28.sp,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              size: 28.sp,
              color: Colors.black,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
