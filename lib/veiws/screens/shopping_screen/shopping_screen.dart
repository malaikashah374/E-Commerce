import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  // Example cart items
  List<Map<String, dynamic>> cartItems = [
    {
      "title": "Minimalist Chair",
      "subtitle": "Regal Do Lobo",
      "price": 279.95,
      "qty": 4,
      "image": "assets/images/shop_chair_1.png"
    },
    {
      "title": "Hallindgal Chair",
      "subtitle": "Hatil-Loren",
      "price": 258.91,
      "qty": 1,
      "image": "assets/images/shop_chair_2.png"
    },
    {
      "title": "Hiro Armchair",
      "subtitle": "Hatil-Loren",
      "price": 369.86,
      "qty": 3,
      "image": "assets/images/shop_chair_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + (item["price"] * item["qty"]));
    double shipping = 26.00;
    double total = subtotal + shipping;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.black),
            onPressed: () {
              setState(() {
                cartItems.clear();
              });
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Cart Items
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          item["image"],
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Product Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item["title"],
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text(item["subtitle"], style: TextStyle(color: Colors.grey.shade600)),
                            const SizedBox(height: 8),
                            Text("\$${item["price"].toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      // Quantity Controls
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                if (item["qty"] > 1) item["qty"]--;
                              });
                            },
                          ),
                          Text(item["qty"].toString(),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add_circle, color: Colors.teal),
                            onPressed: () {
                              setState(() {
                                item["qty"]++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Order Summary
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 8, spreadRadius: 1),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal", style: TextStyle(fontSize: 16)),
                    Text("\$${subtotal.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.deepOrange, fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Shipping Cost", style: TextStyle(fontSize: 16)),
                    Text("\$${shipping.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.deepOrange, fontSize: 16)),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total Payment",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18, color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Check Out", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
