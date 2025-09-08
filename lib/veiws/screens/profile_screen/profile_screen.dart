import 'package:e_commerce/veiws/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color (0xFF00897B),
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/150?img=3", // Replace with your image
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Mansurul Hoque",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "mansurul952@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Profile options
          Expanded(
            child: ListView(
              children: [
                _buildListTile(
                  context,
                  icon: Icons.person_outline,
                  title: " Edit Profile",
                  screen: const EditProfileScreen (),
                ),
                _buildListTile(
                  context,
                  icon: Icons.payment_outlined,
                  title: "Payment Methods",
                  screen: const DummyScreen(title: "Payment Methods"),
                ),
                _buildListTile(
                  context,
                  icon: Icons.history,
                  title: "Order History",
                  screen: const DummyScreen(title: "Order History"),
                ),
                _buildListTile(
                  context,
                  icon: Icons.location_on_outlined,
                  title: "Delivery Address",
                  screen: const DummyScreen(title: "Delivery Address"),
                ),
                _buildListTile(
                  context,
                  icon: Icons.support_agent,
                  title: "Support Center",
                  screen: const DummyScreen(title: "Support Center"),
                ),
                _buildListTile(
                  context,
                  icon: Icons.policy_outlined,
                  title: "Legal Policy",
                  screen: const DummyScreen(title: "Legal Policy"),
                ),
              ],
            ),
          ),

          // Logout button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: GestureDetector(
              onTap: () {
                // Add your logout functionality here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logged out")),
                );
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon, required String title, required Widget screen}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}

class DummyScreen extends StatelessWidget {
  final String title;
  const DummyScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(child: Text(title, style: const TextStyle(fontSize: 22))),
    );
  }
}
