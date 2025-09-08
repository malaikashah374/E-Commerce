import 'package:e_commerce/veiws/screens/detail_screen/detail_screen.dart';
import 'package:e_commerce/veiws/screens/notification_screen/notification_screen.dart';
import 'package:e_commerce/veiws/screens/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// -------------------------------
/// HOME SCREEN (your UI)
/// -------------------------------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP BAR: avatar + welcome + actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: const AssetImage(
                          "assets/images/user_avatar.png",
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Welcome,",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            "Besnik Doe",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationsScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.notification_add_outlined),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingsScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Icon(Icons.settings_outlined),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search furniture",
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // SPECIAL OFFERS
              Text(
                "Special Offers",
                style: GoogleFonts.aboreto(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _OfferCard(
                      image: "assets/images/home sceen_discount_1st_pic.png",
                      title: "25% Discount!",
                      buttonText: "Learn More",
                    ),
                    _OfferCard(
                      image: "assets/images/home_screen_discount_2nd_pic.png",
                      title: "35% Discount!",
                      buttonText: "Shop Now",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // CATEGORY CHIPS
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_categories.length, (i) {
                    final selected = _selectedCategory == i;
                    return Padding(
                      padding: EdgeInsets.only(
                        right: i == _categories.length - 1 ? 0 : 8,
                      ),
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedCategory = i),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                selected
                                    ? const Color(0xFF00897B)
                                    : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                _categories[i].icon,
                                height: 18,
                                color:
                                    selected
                                        ? Colors.white
                                        : Colors.grey.shade700,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _categories[i].label,
                                style: TextStyle(
                                  fontSize: 13,
                                  color:
                                      selected
                                          ? Colors.white
                                          : Colors.grey.shade800,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 18),

              // MOST INTERESTED
              _sectionHeader("Most interested"),
              const SizedBox(height: 12),
              SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // ✅ Fuji Arm Chair → opens DetailScreen with its data
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => DetailScreen(
                                  image:
                                      "assets/images/greenish_grey chair.png",
                                  title: "Fuji Arm Chair",
                                  brand: "Hans J. Wegner",
                                  price: "\$9.99",
                                ),
                          ),
                        );
                      },
                      child: const _ProductBig(
                        image: "assets/images/greenish_grey chair.png",
                        title: "Fuji Arm Chair",
                        brand: "Hans J. Wegner",
                        price: "\$9.99",
                      ),
                    ),
                    const _ProductBig(
                      image: "assets/images/yellow_chair.png",
                      title: "Ox Mathis Chair",
                      brand: "Hans J. Wegner",
                      price: "\$9.99",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // POPULAR
              _sectionHeader("Popular"),
              const SizedBox(height: 12),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _ProductSmall(
                      image: "assets/images/home_swoon_lounge.png",
                      title: "Swoon Lounge",
                      brand: "Fredericia",
                      price: "\$136.79",
                    ),
                    _ProductSmall(
                      image: "assets/images/prod_tokyo.jpg",
                      title: "Tokyo Chair",
                      brand: "Cassina",
                      price: "\$149.99",
                    ),
                    _ProductSmall(
                      image: "assets/images/prod_lambretta.jpg",
                      title: "Lambretta",
                      brand: "Vitra",
                      price: "\$129.99",
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

  // Center teal action icon used in BottomNav
  Widget _centerTealIcon(String path, {required bool selected}) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: const Color(0xFF00897B),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00897B).withOpacity(0.3),
            blurRadius: selected ? 10 : 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: Image.asset(path, height: 22, color: Colors.white)),
    );
  }
}

// ---- DATA ----
class _CategoryItem {
  final String icon;
  final String label;
  const _CategoryItem(this.icon, this.label);
}

const _categories = <_CategoryItem>[
  _CategoryItem("assets/images/arm chair.png", "Armchair"),
  _CategoryItem("assets/images/sofa.png", "Sofa"),
  _CategoryItem("assets/images/bed.png", "Bed"),
  _CategoryItem("assets/images/light.png", "Light"),
];

// ---- WIDGETS ----

class _OfferCard extends StatelessWidget {
  final String image, title, buttonText;
  const _OfferCard({
    required this.image,
    required this.title,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.05),
              Colors.black.withOpacity(0.45),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(14),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // title + button
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00897B),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            // small carousel dots (visual only)
            Row(
              children: [
                _dot(true),
                const SizedBox(width: 4),
                _dot(false),
                const SizedBox(width: 4),
                _dot(false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _dot(bool active) => Container(
    height: 8,
    width: active ? 16 : 8,
    decoration: BoxDecoration(
      color: active ? Colors.white : Colors.white54,
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

class _ProductBig extends StatelessWidget {
  final String image, title, brand, price;
  const _ProductBig({
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // product image with circular crop
          Stack(
            children: [
              Container(
                height: 130,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5F6F7),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                alignment: Alignment.center,
                child: ClipOval(
                  child: Image.asset(
                    image,
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  height: 34,
                  width: 34,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00897B),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: 20, color: Colors.white),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 2),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              brand,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
            child: Text(
              price,
              style: const TextStyle(
                color: Color(0xFF00897B),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductSmall extends StatelessWidget {
  final String image, title, brand, price;
  const _ProductSmall({
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 70, width: 70, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  brand,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF8F6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Color(0xFF00897B),
                      fontWeight: FontWeight.w700,
                    ),
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

Widget _sectionHeader(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      const Text(
        "View All",
        style: TextStyle(color: Color(0xFF00897B), fontWeight: FontWeight.w600),
      ),
    ],
  );
}

/// -------------------------------
/// DETAIL SCREEN (receives product)
/// -------------------------------
class DetailScreen extends StatelessWidget {
  final String image, title, brand, price;
  const DetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.brand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Detail', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, height: 210)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "$title\nModern Style",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00897B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.visibility, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                const Text("341 Seen"),
                const SizedBox(width: 16),
                const Icon(Icons.favorite, size: 18, color: Colors.red),
                const SizedBox(width: 6),
                const Text("294 Liked"),
                const Spacer(),
                CircleAvatar(
                  radius: 12,
                  backgroundImage: const AssetImage("assets/images/user1.png"),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(width: 4),
                CircleAvatar(
                  radius: 12,
                  backgroundImage: const AssetImage("assets/images/user2.png"),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(width: 4),
                CircleAvatar(
                  radius: 12,
                  backgroundImage: const AssetImage("assets/images/user3.png"),
                  backgroundColor: Colors.grey.shade200,
                ),
              ],
            ),
            const SizedBox(height: 12),
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
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "The Swedish Designer Monica Forstar’s style is characterized by her eternal "
              "love for new materials and beautiful pure shapes. Brand: $brand.",
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.remove, size: 18),
                      SizedBox(width: 8),
                      Text("04"),
                      SizedBox(width: 8),
                      Icon(Icons.add, size: 18),
                    ],
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00897B),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Add To Cart"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _simpleScaffold(String title) => Scaffold(
  appBar: AppBar(title: Text(title)),
  body: Center(child: Text(title)),
);
