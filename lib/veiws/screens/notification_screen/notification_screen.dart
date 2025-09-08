import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Clear all notifications functionality
            },
            child: Text(
              'Clear All',
              style: TextStyle(
                color: Colors.teal[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: [
            _buildNotificationItem(
              image: 'assets/images/chair1.jpg',
              title: 'Order shipped, confirm address',
              time: '16 minutes ago',
            ),
            _buildNotificationItem(
              image: 'assets/images/chair2.jpg',
              title: 'Special offer on bean products',
              time: '26 minutes ago',
            ),
            _buildNotificationItem(
              image: 'assets/images/chair3.jpg',
              title: 'New furniture collection available',
              time: '40 minutes ago',
            ),
            _buildNotificationItem(
              image: 'assets/images/chair4.jpg',
              title: 'Green armchair has been shipped',
              time: '16 days ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String image,
    required String title,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.chair,
                    color: Colors.grey[400],
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}