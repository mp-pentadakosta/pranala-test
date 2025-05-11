import 'package:flutter/material.dart';

import '../bottom_sheet/bottom_sheet_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.network(
            "https://static.vecteezy.com/system/resources/previews/003/529/153/non_2x/business-to-do-list-flat-icon-modern-style-vector.jpg",
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.65,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 16.0,
                    children: [
                      Text(
                        "Task Management & To-Do List",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        "This productivity tools is a design to help you manage your better manage your task project-wise conveniently",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomSheetView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(),
                          Spacer(),
                          Text(
                            "Let's Start",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
