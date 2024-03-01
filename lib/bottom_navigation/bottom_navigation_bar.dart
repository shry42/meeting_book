import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_booking_app/controllers/bottom_nav_controller.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/add_user_screen.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/reservations_details_screen.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/rooms_list.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/users_list.dart';
import 'package:room_booking_app/defined_pages/superadmin_pages/users_settings.dart';

class BottomNaviagtionBarScreen extends StatefulWidget {
  final int initialIndex;

  const BottomNaviagtionBarScreen({Key? key, this.initialIndex = 0})
      : super(key: key);

  @override
  State<BottomNaviagtionBarScreen> createState() =>
      _BottomNaviagtionBarScreenState();
}

class _BottomNaviagtionBarScreenState extends State<BottomNaviagtionBarScreen> {
  BottomNavigationController bnc = BottomNavigationController();

  List pages = [
    ReservationScreen(title: 'Reservations'),
    const UserLists(title: 'Users list'),
    // AddUserScreen(title: 'Add User'),
    const RoomsListScreen(title: 'Rooms list'),
    const UserSettingsScreen(
      title: 'Profile settings',
    ),
  ];

  @override
  void initState() {
    bnc.selectedIndex.value = widget.initialIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color.fromARGB(255, 213, 231, 214),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          height: 60,
          buttonBackgroundColor: const Color.fromARGB(255, 101, 194, 104),
          color: const Color.fromARGB(255, 100, 219, 104),
          animationDuration: const Duration(milliseconds: 200),
          items: const <Widget>[
            Icon(Icons.description, size: 26, color: Colors.white),
            Icon(Icons.person_pin_rounded, size: 26, color: Colors.white),
            // Icon(Icons.person_add_alt_1_rounded, size: 26, color: Colors.white),
            Icon(Icons.house, size: 26, color: Colors.white),
            Icon(Icons.person, size: 26, color: Colors.white),
          ],
          onTap: (index) {
            if (bnc.selectedIndex.value != index) {
              bnc.selectedIndex.value = index;
            }
          },
        ),
        body: pages[bnc.selectedIndex.value],
      ),
    );
  }
}
