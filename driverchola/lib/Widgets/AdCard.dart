import 'package:flutter/material.dart';

class AdCardWidget extends StatefulWidget {
  final List<String> ads;

  AdCardWidget({required this.ads});

  @override
  _AdCardWidgetState createState() => _AdCardWidgetState();
}

class _AdCardWidgetState extends State<AdCardWidget> {
  int currentAdIndex = 0;

  @override
  void initState() {
    super.initState();
    startAdTimer();
  }

  void startAdTimer() {
    Future.delayed(Duration(seconds: 5), () {
      if (widget.ads.isNotEmpty) {
        currentAdIndex = (currentAdIndex + 1) % widget.ads.length;
        if (mounted) {
          setState(() {});
        }
        startAdTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Card(
            semanticContainer: true,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                child: _buildAdImage(),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.03),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.ads.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.005),
                  width: MediaQuery.of(context).size.width * 0.02,
                  height: MediaQuery.of(context).size.width * 0.02,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentAdIndex ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdImage() {
    try {
      return Image.network(
        isAntiAlias: true,
        widget.ads[currentAdIndex],
        key: ValueKey<int>(currentAdIndex),
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          // Handle error loading image
          print('Error loading ad image: $error');
          return Image.asset(
            height: MediaQuery.of(context).size.height * 0.2,
            'assets/Internet_error.png',
            fit: BoxFit.fill,
          ); // Fallback image
        },
      );
    } catch (error) {
      // Handle general error
      print('Error: $error');
      return Image.asset(
        height: MediaQuery.of(context).size.height * 0.2,
        'assets/Recent.png',
        fit: BoxFit.fill,
      ); // Fallback image
    }
  }
}
