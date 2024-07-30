import 'package:flutter/material.dart';
import 'package:ringo_media_test_app/widget/custom_card.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            CustomCard(
          topText: 'Meeting Concept',
          bottomText: 'Due Date: Mon, 12 Jan 2023',
        ),
        SizedBox(height: 10,),
        CustomCard(
          topText: 'Information Architecture',
          bottomText: 'Due Date: Mon, 12 Jan 2023',
        ),
        SizedBox(height: 10,),
        CustomCard(
          topText: 'Monitoring Project',
          bottomText: 'Due Date: Mon, 12 Jan 2023',
        ),
        SizedBox(height: 10,),
        CustomCard(
          topText: 'Daily Standup',
          bottomText: 'Due Date: Mon, 12 Jan 2023',
        ),
          ],
        ),
      ),
    );
  }
}
