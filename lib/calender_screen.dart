import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ringo_media_test_app/widget/schedule.dart';
import 'package:ringo_media_test_app/widget/task.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: const Icon(Icons.menu),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 8), // Adjust the width as needed
            Text('Calendar'),
          ],
        ),
        actions: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey[300]!, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
              ),
              Positioned(
                top: 4,
                right: 22,
                child: Container(
                  width: 10,
                  height: 10,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
          // child: Padding(
          //     padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Text(
                'January 2023',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Transform.rotate(
                  angle: 90 *
                      3.141592653589793 /
                      180, // Convert 90 degrees to radians
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                onPressed: () {
                  _showBottomSheet(context);
                },
              ),
              const Spacer(), // Spacer to push the icons to the right
              Container(
                width: 30,
                height: 30,
                padding: const EdgeInsets.all(4.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      // Implement your left arrow action here
                    },
                    child: Transform.scale(
                      scale: 0.7,
                      child: const Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 30,
                height: 30,
                padding: const EdgeInsets.all(4.0), // Adjust padding as needed
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      // Implement your right arrow action here
                    },
                    child: Transform.scale(
                      scale: 0.7,
                      child: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            height: 100, // Adjust the height as needed
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // First container that slightly shows
                Container(
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0), // Curved top-right corner
                      bottomLeft:
                          Radius.circular(8.0), // Curved bottom-left corner
                      // topLeft and bottomRight corners remain sharp
                    ),
                  ),
                ),

                // List of day containers
                _buildDayContainer('MON', '12'),
                _buildDaySubsequentContainer('TUE', '13'),
                _buildDaySubsequentContainer('WED', '14'),
                _buildDaySubsequentContainer('THU', '15'),
                _buildDaySubsequentContainer('FRI', '16'),
                _buildDaySubsequentContainer('SAT', '17'),
                _buildDaySubsequentContainer('SUN', '18'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                'Schedule',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Tab(
              child: Text(
                'Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
        Container(
          height: h, // Adjust the height of the TabBarView
          width: w,
          child: TabBarView(
            controller: _tabController,
            children: const [
              Schedule(),
              Task(),
            ],
          ),
        ),
      ])),
      // )
    );
  }

  Widget _buildDayContainer(String day, String date) {
    return Container(
      width: 60, // Adjust the width as needed
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            date,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySubsequentContainer(String day, String date) {
    return Container(
      width: 60, // Adjust the width as needed
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            date,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Make the background transparent
      builder: (context) {
        return Stack(
          children: [
            // Background blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Blur effect
                child: Container(
                  color: Colors.black.withOpacity(0.2), // Slight overlay color
                ),
              ),
            ),
            // Bottom sheet content
            Container(
              height: 650,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 24), // Placeholder for alignment
                      const Text(
                        'Choose Date',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: double.infinity, // Ensure full width
                      child: Divider(
                        thickness: 1, // Line thickness
                        color: Colors.grey[300], // Line color
                        height: 1, // Space around the divider
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var day in ['M', 'T', 'W', 'T', 'F', 'S', 'S'])
                        Text(
                          day,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text(
                        'May 2022',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: 42, // 6 rows of 7 days
                      itemBuilder: (context, index) {
                        DateTime firstDayOfMonth = DateTime(2022, 5, 1);
                        int firstWeekday = firstDayOfMonth.weekday - 1;
                        int daysInMonth = DateTime(2022, 6, 0).day;
                        int day = index - firstWeekday + 1;

                        bool isCurrentMonth = day > 0 && day <= daysInMonth;
                        bool isPrevMonth = day <= 0;
                        bool isNextMonth = day > daysInMonth;
                        int displayDay = day;

                        if (isPrevMonth) {
                          displayDay = DateTime(2022, 4, 30 + day).day;
                        } else if (isNextMonth) {
                          displayDay = day - daysInMonth;
                        }

                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(4),
                          child: displayDay == 30 && index < 7
                              ? Text(
                                  displayDay.toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              : displayDay == 30
                                  ? Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          displayDay.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Text(
                                      displayDay.toString(),
                                      style: TextStyle(
                                        color: isCurrentMonth
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: isCurrentMonth
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: double.infinity, // Ensure full width
                      child: Divider(
                        thickness: 1, // Line thickness
                        color: Colors.grey[300], // Line color
                        height: 1, // Space around the divider
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
