import 'package:flutter/material.dart';

class UploadProductScreen extends StatefulWidget {
  const UploadProductScreen({super.key});

  @override
  State<UploadProductScreen> createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  bool agree = false;

  final Color primaryGreen = const Color(0xFF004D25); // Dark Green color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Upload Product",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Product Name", "Product Name"),
            const SizedBox(height: 12),
            _buildTextField("Product Price", "Product Price", keyboard: TextInputType.number),
            const SizedBox(height: 12),

            // Category Dropdown
            _buildDropdown("Category", "Select Category", Icons.grid_view),

            const SizedBox(height: 12),

            // Condition Dropdown
            _buildDropdown("Condition", "Select Condition", Icons.check_circle_outline),

            const SizedBox(height: 12),

            _buildTextField("Contact", "Contact Number", keyboard: TextInputType.phone),
            const SizedBox(height: 12),

            _buildDropdown("Location", "Select Location from Map", Icons.location_on),
            const SizedBox(height: 16),

            const Text("Description", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Container(
              height: 120,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Describe your product in less than 15 lines...",
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Upload Pictures", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(Icons.image, size: 40, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 16),

            // Terms & Conditions
            Row(
              children: [
                Checkbox(
                  value: agree,
                  activeColor: primaryGreen,
                  onChanged: (value) {
                    setState(() {
                      agree = value ?? false;
                    });
                  },
                ),
                const Text("I agree to the "),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "terms & conditions",
                    style: TextStyle(
                      color: primaryGreen,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (!agree) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please agree to the terms & conditions")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  "Submit Ad",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Text field builder
  Widget _buildTextField(String label, String hint, {TextInputType keyboard = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          keyboardType: keyboard,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  // Dropdown builder
  Widget _buildDropdown(String label, String hint, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(border: InputBorder.none),
            hint: Text(hint, style: TextStyle(color: Colors.grey.shade600)),
            icon: Icon(icon, color: Colors.green),
            items: const [
              DropdownMenuItem(value: "1", child: Text("Option 1")),
              DropdownMenuItem(value: "2", child: Text("Option 2")),
            ],
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
