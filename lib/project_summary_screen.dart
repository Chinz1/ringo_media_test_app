import 'package:flutter/material.dart';

class ProjectSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        leading: Icon(Icons.menu),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 8), // Adjust the width as needed
            Text('Project Summary'),
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Search',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search project here',
                      border: UnderlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 104,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue[600],
                                borderRadius:
                                    BorderRadius.circular(8), // Curved edges
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 2, // Spread radius
                                    blurRadius: 6, // Blur radius
                                    offset:
                                        Offset(0, 2), // Shadow position (x, y)
                                  ),
                                ],
                              ),
                              child: const Stack(
                                children: [
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Text(
                                      '10',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 12,
                                      right: 15,
                                      child: Icon(
                                        Icons.access_time_filled_outlined,
                                        color: Colors.white,
                                        size: 20.0, // Set the desired size here
                                      )),
                                  Positioned(
                                    top: 40,
                                    left: 8,
                                    child: Text(
                                      'Project ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 58,
                                    left: 8,
                                    child: Text(
                                      'in Progress ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                width: 10), // Spacing between containers
                            Container(
                              width: 103,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.teal[400],
                                borderRadius:
                                    BorderRadius.circular(8), // Curved edges
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 2, // Spread radius
                                    blurRadius: 6, // Blur radius
                                    offset:
                                        Offset(0, 2), // Shadow position (x, y)
                                  ),
                                ],
                              ),
                              child: const Stack(
                                children: [
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Text(
                                      '24',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 12,
                                    right: 15,
                                    child: Icon(
                                      Icons.verified,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 8,
                                    child: Text(
                                      'Project ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 58,
                                    left: 8,
                                    child: Text(
                                      'Completed ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                width: 10), // Spacing between containers
                            Container(
                              width: 104,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.red[300], // Light red color
                                borderRadius:
                                    BorderRadius.circular(8), // Curved edges
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 2, // Spread radius
                                    blurRadius: 6, // Blur radius
                                    offset:
                                        Offset(0, 2), // Shadow position (x, y)
                                  ),
                                ],
                              ),
                              child: const Stack(
                                children: [
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 12,
                                    right: 15,
                                    child: Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 8,
                                    child: Text(
                                      'Project ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 58,
                                    left: 8,
                                    child: Text(
                                      'Cancelled ',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                      const SizedBox(height: 20),
                      Container(
                        width: 327,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Neutral color
                          borderRadius:
                              BorderRadius.circular(12), // Curved edges
                          border:
                              Border.all(color: Colors.black), // Black border
                        ),
                        child: const Center(
                          child: Text(
                            'View All Projects',
                            style: TextStyle(
                              color: Colors.black, // Text color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      height: h / 2,
                      width: double.infinity,
                      color: Colors.grey[100],
                      padding:
                          EdgeInsets.all(16.0), // Add padding to the container
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.start, // Align to the top
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align to the start (left)
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Space between items
                            children: [
                              Text(
                                'Productivity',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(Icons.more_horiz), // Three dots icon
                            ],
                          ),
                          const SizedBox(
                              height:
                                  16.0), // Spacing between the row and the tab bar
                          _buildBarChart(),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBarChart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment:
          CrossAxisAlignment.end, // Ensure all bars align at the bottom
      children: [
        _buildBar('Jan', 56, Colors.grey[300]!),
        _buildBar('Feb', 65, Colors.grey[300]!),
        _buildBar('Mar', 40, Colors.grey[300]!),
        _buildBar('Apr', 56, Colors.black, true),
        _buildBar('May', 65, Colors.grey[300]!),
        _buildBar('Jun', 68, Colors.grey[300]!),
      ],
    );
  }

  Widget _buildBar(String month, double value, Color color,
      [bool isSelected = false]) {
    return Column(
      mainAxisAlignment:
          MainAxisAlignment.end, // Align all children to the bottom
      children: [
        if (isSelected)
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    painter: _PointerPainter(),
                    child: Container(
                      width: 60, // Increase width for better visibility
                      height: 45,
                      child: Center(
                        child: Text(
                          value.toString() + ' %',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.0),
            ],
          ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
          ),
          child: Container(
            width: 55, // Increase width for each bar
            height: value * 2, // Scaling factor for bar height
            color: color,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          month,
          style: TextStyle(
            color: month == 'Apr'
                ? Colors.black
                : Colors.grey[500], // Set text color to grey[500]
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}

class _PointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black // Changed color to black
      ..style = PaintingStyle.fill;

    Path path = Path();

    // Draw the rounded rectangle
    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height - 10),
      Radius.circular(8.0), // Curved edges with radius 8
    ));

    // Draw the triangle
    path.moveTo(size.width / 2 - 10, size.height - 10);
    path.lineTo(size.width / 2 + 10, size.height - 10);
    path.lineTo(size.width / 2, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
