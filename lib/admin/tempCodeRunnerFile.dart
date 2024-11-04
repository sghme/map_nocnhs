import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final List<String> imageUrls = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
  ];

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    if (_currentIndex < imageUrls.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Help',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isFullScreen = constraints.maxWidth > 800; // Adjust threshold as needed

          return Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: imageUrls.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle click if needed
                    },
                    child: Image.asset(
                      imageUrls[index],
                      fit: isFullScreen ? BoxFit.cover : BoxFit.contain,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                    ),
                  );
                },
              ),
              // Previous Button
              Positioned(
                left: 10,
                top: constraints.maxHeight / 2 - 30,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 30),
                  onPressed: _currentIndex > 0 ? _previousPage : null, // Disable if on first page
                  color: _currentIndex > 0 ? Colors.black : Colors.grey, // Change color if disabled
                ),
              ),
              // Next Button
              Positioned(
                right: 10,
                top: constraints.maxHeight / 2 - 30,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 30),
                  onPressed: _currentIndex < imageUrls.length - 1 ? _nextPage : null, // Disable if on last page
                  color: _currentIndex < imageUrls.length - 1 ? Colors.black : Colors.grey, // Change color if disabled
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
