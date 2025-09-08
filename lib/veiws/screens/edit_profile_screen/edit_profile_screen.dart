import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color( 0xFF00897B), // purple background
      appBar: AppBar(
        backgroundColor: Color( 0xFF00897B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white54,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 10),

              // Name & Email
              const Text(
                "Malaika Hikmat",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Text(
                "malaika.hikmat123@gmail.com",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 20),

              // Form Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // First Name
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "First Name",
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Last Name
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Last Name",
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Phone Number
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Phone no",
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 10),

                    // Address
                    TextField(
                      decoration: const InputDecoration(
                        labelText: "Address",
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Save Changes Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add save logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color( 0xFF00897B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
