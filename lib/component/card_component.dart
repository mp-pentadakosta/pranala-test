import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final bool status;

  const CardComponent({super.key, required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Row(
                children: [
                  Text(
                    'Today Task',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.gif_box_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.red.shade300),
                      const SizedBox(width: 8),
                      Text(
                        '10:00 AM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          status ? Colors.green.shade400 : Colors.red.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status ? 'Done' : 'Todo',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
