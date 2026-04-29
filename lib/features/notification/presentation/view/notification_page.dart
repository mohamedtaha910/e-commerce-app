import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 6,
                  top: 8,
                  bottom: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black12, width: 0.4),
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Colors.black54,
                ),
              ),
            ),
            const Spacer(),
            Text(
              'Notification',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12, width: 0.4),
              ),
              child: Icon(Icons.notifications, size: 22, color: Colors.black54),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('assets/icons/no_notification.png', width: 200),
          ),
          const SizedBox(height: 32),
          Text(
            'No Notification Found ! ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
