import 'package:flutter/material.dart';
import 'package:ringo_media_test_app/widget/custom_container.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .start, // Center align the Row content horizontally
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding here
                  child: SizedBox(
                    height: 100,
                  ),
                ),
        
                SizedBox(
                  height: 100,
                ), // Space from the top
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text('09:00'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      width: 13,
                      height: 1,
                      color: Colors.grey[300], // Grey color for the divider
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    CustomContainer(
                      curvedColor: Colors.purple[300]!,
                      // rectColor: Color.fromARGB(255, 218, 190, 231)!,
                      rectColor: Color.fromARGB(255, 247, 235, 250),

                      // rectColor: Colors.purple[100]!,
                      topText: 'Sprint Review Period 02 in May 2022',
                      bottomText: '09:00 AM - 10:00 AM',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 1,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding here
                  // child: SizedBox(
                  //   height: 100,
                  // ),
                ),
                Text('10:00'),
                SizedBox(width: 10),
                Container(
                  // width: 310,
                  width: 288,
                  height: 1,
                  color: Colors.grey[300], // Grey color for the divider
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding here
                  // child: SizedBox(
                  //   height: 100,
                  // ),
                ),
                Text('10:40'),
                SizedBox(width: 10),
                Container(
                  width: 5, // Diameter of the circle
                  height: 5, // Diameter of the circle
                  decoration: BoxDecoration(
                    color: Colors.white, // Fill color
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                ),
                Container(
                  // width: 310,
                  width: 288,
                  height: 1,
                  color: Colors.black, // Grey color for the divider
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .start, // Center align the Row content horizontally
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding here
                  child: SizedBox(
                    height: 1,
                  ),
                ),
        
                SizedBox(
                  height: 1,
                ), // Space from the top
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text('11:00'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      width: 13,
                      height: 1,
                      color: Colors.grey[300], // Grey color for the divider
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    CustomContainer(
                      curvedColor: Colors.orange[800]!,
                      // rectColor: Color.fromARGB(255, 255, 220, 178)!,
                      rectColor: Color.fromARGB(255, 235, 200, 150),
                      topText: 'Meeting with Client',
                      bottomText: '11:00 AM - 12:00 AM',
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .start, // Center align the Row content horizontally
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding here
                  child: SizedBox(
                    height: 1,
                  ),
                ),
        
                SizedBox(
                  height: 1,
                ), // Space from the top
                Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text('12:00'),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Container(
                      width: 13,
                      height: 1,
                      color: Colors.grey[300], // Grey color for the divider
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    CustomContainer(
                      curvedColor: Colors.green[300]!,
                      rectColor: const Color.fromARGB(255, 210, 240, 216),
                      topText: 'Daily Standup',
                      bottomText: '12:00 AM - 12:30 AM',
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding here
                  // child: SizedBox(
                  //   height: 100,
                  // ),
                ),
                Text('13:00'),
                SizedBox(width: 10),
                Container(
                  // width: 310,
                  width: 288,
                  height: 1,
                  color: Colors.grey[300], // Grey color for the divider
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
