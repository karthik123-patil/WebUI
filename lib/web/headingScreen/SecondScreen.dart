import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1100;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Particle / Fiber-Optic Image Effect
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Image.asset('assets/images/secbg.png', fit: BoxFit.cover),
            ),
          ),
          Positioned.fill(
            bottom: 0,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/images/secondScreen/img.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Heading text positioned responsively
          Positioned(
            top: isDesktop ? 40 : 30,
            left: isDesktop ? 150 : 20,
            right: isDesktop ? 150 : 20,
            child: SizedBox(
              width: isDesktop ? 540 : double.infinity,
              child: Text(
                'Heading : Illo sint voluptas. \nError voluptates culpa',
                style: GoogleFonts.manrope(
                  fontSize: isDesktop ? 32.0 : 22.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  height: 40.0 / 32.0,
                  letterSpacing: 0.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Cards Section - Fully Responsive with Horizontal Scroll option for smaller screens
          Positioned(
            bottom: 0,
            left: isDesktop ? 150 : 20,
            right: isDesktop ? 150 : 20,
            child: isDesktop
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _HoverCard(
                          topPadding: 10.0,
                          imagePath: "assets/images/viron.png",
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _HoverCard(
                          topPadding: 150.0,
                          imagePath: "assets/images/abcapp.png",
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _HoverCard(
                          topPadding: 0.0,
                          imagePath: "assets/images/xyz.png",
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HoverCard(
                        topPadding: 10.0,
                        imagePath: "assets/images/viron.png",
                      ),
                      const SizedBox(width: 20),
                      _HoverCard(
                        topPadding: 40.0,
                        imagePath: "assets/images/abcapp.png",
                      ),
                      const SizedBox(width: 20),
                      _HoverCard(
                        topPadding: 0.0,
                        imagePath: "assets/images/xyz.png",
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

// Helper Stateful Widget for individual card hover scale-up animation
class _HoverCard extends StatefulWidget {
  final double topPadding;
  final String imagePath;

  const _HoverCard({required this.topPadding, required this.imagePath});

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedScale(
          scale: _isHovered ? 1.08 : 1.0,
          // Mouse aane par 8% bada ho jayega (pop-up effect)
          duration: const Duration(milliseconds: 250),
          // Smooth animation speed
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ]
                  : [],
            ),
            child: Image.asset(
              widget.imagePath,
              height: 350,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
