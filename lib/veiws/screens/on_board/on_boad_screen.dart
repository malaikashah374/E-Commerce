import 'package:e_commerce/veiws/screens/login_screen/Login_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Onboarding data
  final List<Map<String, String>> _onboardData = [
    {
      "image": "assets/images/onboard_1 (1).png", // Add your own assets
      "text": "View And Experience Furniture With The Help Of Augmented Reality"
    },
    {
      "image": "assets/images/onboard_1 (2).png",
      "text": "Design Your Space With Augmented Reality By Creating Room"
    },
    {
      "image": "assets/images/onboard_1 (3).png",
      "text": "Explore World Class Top Furnitures As Per Your Requirements & Choice"
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardData.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())); 
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: _onboardData[index]["image"]!,
                  text: _onboardData[index]["text"]!,
                ),
              ),
            ),

            // Bottom Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),

                    ),
                  ),

                  // Dots Indicator
                  Row(
                    children: List.generate(
                      _onboardData.length,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 6),
                        height: 8,
                        width: _currentPage == index ? 16 : 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Color(0xFF00897B)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Next or Get Started
                  _currentPage == _onboardData.length - 1
                      ? ElevatedButton(
                          onPressed: () {
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())); 
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00897B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text("Get Started",
                          style: TextStyle(color: Colors.white),
                          ),
                        )
                      : IconButton(
                          onPressed: _nextPage,
                          icon: Icon(Icons.arrow_forward),
                          color: Color(0xFF00897B),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Onboarding Content Widget
class OnboardContent extends StatelessWidget {
  final String image, text;

  OnboardContent({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular image
          ClipOval(
            child: Image.asset(
              image,
              width: 370,
              height: 370,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
