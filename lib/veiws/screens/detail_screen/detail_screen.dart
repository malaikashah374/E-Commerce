import 'package:e_commerce/veiws/screens/fav_Screen/fav_screen.dart';
import 'package:flutter/material.dart';


// Product Detail Screen
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔙 Back + Favourite
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border, size: 28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavouriteScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 🪑 Product Image
              Center(
                child: Image.asset(
                  "assets/images/detail screen chair.png", // replace with your Figma export
                  height: 200,
                ),
              ),

              const SizedBox(height: 24),

              // 🪑 Product Title & Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text(
                      "Ox Mathis Furniture\nModern Style",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "\$90.99",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 👀 Views + Likes + Avatars
              Row(
                children: [
                  const Icon(Icons.visibility, size: 18, color: Colors.grey),
                  const SizedBox(width: 4),
                  const Text("341 Seen"),
                  const SizedBox(width: 16),
                  const Icon(Icons.favorite, size: 18, color: Colors.red),
                  const SizedBox(width: 4),
                  const Text("294 Liked"),
                  const Spacer(),
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage("assets/images/user1.png"),
                  ),
                  const SizedBox(width: 4),
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage("assets/images/user2.png"),
                  ),
                  const SizedBox(width: 4),
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage("assets/images/user3.png"),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // ⭐ Rating
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  Icon(Icons.star_half, color: Colors.amber, size: 20),
                  Icon(Icons.star_border, color: Colors.amber, size: 20),
                ],
              ),

              const SizedBox(height: 16),

              // 📖 Description
              const Text(
                "Description",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "The Swedish Designer Monica Forstar’s Style Is "
                "Characterized By Her Eternal Love For New Materials "
                "And Beautiful Pure Shapes.",
                style: TextStyle(color: Colors.grey),
              ),

              const Spacer(),

              // ➕ Quantity + Add To Cart
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.remove, size: 18),
                        SizedBox(width: 8),
                        Text("04", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 8),
                        Icon(Icons.add, size: 18),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
