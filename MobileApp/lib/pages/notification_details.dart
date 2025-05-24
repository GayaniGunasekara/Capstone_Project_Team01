import 'package:capstoneproject_mobileapp/pages/events.dart';
import 'package:flutter/material.dart';

class NotificationDetailPage extends StatelessWidget {
  final String alertNumber;
  final String type;

  final String location;
  final String dateTime;

  const NotificationDetailPage({
    super.key,
    required this.alertNumber,
    required this.type,
    required this.location,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification info',
          style: TextStyle(
            color: const Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF1E426B),
        iconTheme: IconThemeData(color: const Color(0xFFFFFFFF)),
        elevation: 0,
      ),
      backgroundColor: Color(0xFF1E426B),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(35),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF4E8BD4).withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInfo('Alert No :', alertNumber),
              buildInfo('Notification Type :', type),
              buildInfoLink('Location :', 'View', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventPage(location: location),
                  ),
                );
              }),
              buildInfo('Detected Time/ Date :', dateTime),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 05),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(value, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget buildInfoLink(String label, String linkText, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 05),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  linkText,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
