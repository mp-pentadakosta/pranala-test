import 'package:flutter/material.dart';

import '../today_task/today_task_view.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Today's Task",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: TodayTaskView(),
    );
  }
}
