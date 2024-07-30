import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String topText;
  final String bottomText;

  const CustomCard({
    required this.topText,
    required this.bottomText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Curve all edges
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding to the entire row
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4), // Space between the texts
                Text(
                  bottomText,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: BorderRadius.circular(4), // Slightly curved edges
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
