import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../config/textStyles.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/videos/v1.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
        _videoController.setLooping(true);
        _videoController.setVolume(1.0);
      }).catchError((error) {
        print("Error loading video: $error");
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Background Video Player
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: _videoController.value.isInitialized
                  ? SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _videoController.value.size.width,
                    height: _videoController.value.size.height,
                    child: VideoPlayer(_videoController),
                  ),
                ),
              )
                  : Container(color: Colors.white),
            ),
          ),

          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF03050A),
                    Colors.transparent,
                    Color(0xFF03050A),
                  ],
                  stops: [0.35, 0.7, 1.0],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
          ),

          // Top Gradient overlay for Header separation
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
            ),
          ),

          // 2. Top-Right Decorative Dot Grid Pattern (Hidden on small screens)
          if (isDesktop)
            Positioned(
              top: 100,
              right: 40,
              child: _buildDotGrid(rows: 8, cols: 14),
            ),

          // 3. Main Screen Layout (Header + Responsive Body)
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40.0 : 20.0,
                  vertical: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAVBAR / HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'TC Teach Company',
                          style: AppTextStyles.tcTeachComp,
                        ),
                        if (isDesktop)
                          Row(
                            children: [
                              _navLink('Products'),
                              _navLink('Solutions'),
                              _navLink('Partnerships'),
                              _navLink('Company'),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1E6BFF),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () {},
                          ),
                      ],
                    ),

                    SizedBox(height: isDesktop ? 120 : 80),

                    // HERO CONTENT (Responsive spacing and dimensions)
                    Padding(
                      padding: EdgeInsets.only(left: isDesktop ? 110.0 : 0.0),
                      child: SizedBox(
                        width: isDesktop ? 540 : screenWidth - 40,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Heading :',
                              style: TextStyle(
                                fontSize: isDesktop ? 64 : 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: -1.0,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                                  'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                                  'nulla deserunt vel. Iusto corrupti dicta.',
                              style: GoogleFonts.inter(
                                fontSize: isDesktop ? 18.0 : 15.0,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                height: 26.0 / 18.0,
                                letterSpacing: 0.0,
                                color: const Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 4. Bottom-Right Icons (Responsive sizing & safe alignment)
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/roboticon.png", scale: isDesktop ? 4 : 6),
                  const SizedBox(width: 8),
                  Image.asset("assets/images/arrowupicon.png", scale: isDesktop ? 4 : 6),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _navLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.transparent,
        child: Text(title, style: AppTextStyles.webIconHeaderText),
      ),
    );
  }

  Widget _buildDotGrid({required int rows, required int cols}) {
    return Column(
      children: List.generate(
        rows,
            (r) => Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            children: List.generate(
              cols,
                  (c) => Container(
                margin: const EdgeInsets.only(right: 5.0),
                width: 2.0,
                height: 2.0,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}