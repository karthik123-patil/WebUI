/*
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:uiuxdesign/widget/alltestWidget.dart';
import 'package:uiuxdesign/widget/bottomRiderWidget.dart';
import 'package:uiuxdesign/widget/cabWidget.dart';
import 'package:uiuxdesign/widget/exploreWidget.dart';
import 'package:uiuxdesign/widget/mapWidget.dart';
import 'package:uiuxdesign/widget/recentplacesWidget.dart';
import 'package:uiuxdesign/widget/ridesWidget.dart';

void main() => runApp(const RideHomeApp());

class RideColors {
  static const navy = Color(0xFF253041);
  static const muted = Color(0xFF9299A4);
  static const mapBase = Color(0xFFF5E8D4);
  static const water = Color(0xFFB7D8DF);
  static const paleBlue = Color(0xFFEEF5FF);
  static const red = Color(0xFFE65345);
  static const yellow = Color(0xFFFFC15A);
  static const line = Color(0xFFE7E8EB);
}

class RideHomeApp extends StatelessWidget {
  const RideHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ride App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: RideColors.navy,
          primary: RideColors.navy,
        ),
      ),
      home: const RideHomeScreen(),
    );
  }
}

class RideHomeScreen extends StatelessWidget {
  const RideHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // Keep the map useful on short phones and avoid an oversized map on tablets.
    final mapHeight = (size.height * 0.43).clamp(300.0, 460.0).toDouble();

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.sizeOf(context).height * 0.6,
            child: const MapHeader(),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.6,
            left: 0,
            right: 0,
            bottom: 0,
            child: const HomeContent(),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 13),
          Container(
            width: 62,
            height: 5,
            decoration: BoxDecoration(
              color: const Color(0xFFE1E4E8),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.sizeOf(context).width;
                final horizontalPadding = screenWidth < 360
                    ? 16.0
                    : screenWidth < 600
                    ? 24.0
                    : 32.0;
                return ListView(
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    0,
                    horizontalPadding,
                    18,
                  ),
                  children: [
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1000),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const RecentPlaces(),
                            const SizedBox(height: 24),
                            const SectionTitle('Rides'),
                            const SizedBox(height: 18),
                            const RideGrid(),
                            const SizedBox(height: 42),
                            const SectionTitle('Explore Places with Ride app'),
                            const SizedBox(height: 20),
                            const ExplorePlaces(),
                            const SizedBox(height: 42),
                            const SectionTitle(
                              'Your Neighborhood, Now on Ride App.',
                            ),
                            const SizedBox(height: 20),
                            const NeighborhoodCards(),
                            const SizedBox(height: 22),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const BottomRideBar(),
        ],
      ),
    );
  }
}


*/

///web

import 'package:flutter/material.dart';
import 'package:uiuxdesign/web/headingScreen/AnalyticsSectionScreen1.dart';
import 'package:uiuxdesign/web/headingScreen/CloudScreen.dart';
import 'package:uiuxdesign/web/headingScreen/ComprehensiveSolutionsSection.dart';
import 'package:uiuxdesign/web/headingScreen/DesignAndBrandingSection.dart';
import 'package:uiuxdesign/web/headingScreen/DigitalMarketing.dart';
import 'package:uiuxdesign/web/headingScreen/DiscoverMoreSection.dart';
import 'package:uiuxdesign/web/headingScreen/FooterWidget.dart';
import 'package:uiuxdesign/web/headingScreen/HeroScreen.dart';
import 'package:uiuxdesign/web/headingScreen/RocketScreen.dart';
import 'package:uiuxdesign/web/headingScreen/SecondScreen.dart';
import 'package:uiuxdesign/web/headingScreen/SolutionsGridSection.dart';

void main() {
  runApp(const TeachCompanyApp());
}

class TeachCompanyApp extends StatelessWidget {
  const TeachCompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Teach Company',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF03050A),
        fontFamily: 'sans-serif',
      ),
      home: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight > 700 ? screenHeight : 700,
              // Ensure minimum height
              child: const HeroScreen(),
            ),
            SizedBox(
              height: 852, // Ensure minimum height
              child: const SecondScreen(),
            ),
            SizedBox(
              height: 852, // Ensure minimum height
              child: const AnalyticsSectionScreen(),
            ),
            SizedBox(
              height: 852, // Ensure minimum height
              child: const SolutionsGridSection(),
            ),
            SizedBox(
              height: 1400, // Ensure minimum height
              child: const DesignAndBrandingSection(),
            ),

            SizedBox(
              height: 890, // Ensure minimum height
              child: const CloudScreen(),
            ),
            SizedBox(
              height: 1500, // Ensure minimum height
              child: const ComprehensiveSolutionsSection(),
            ),
            SizedBox(
              height: 890, // Ensure minimum height
              child: const DigitalmarketingScreen(),
            ),
            SizedBox(
              height: 890, // Ensure minimum height
              child: const RocketScreen(),
            ),
            SizedBox(
              height: 852, // Ensure minimum height
              child: const DiscoverMoreExploreSection(),
            ),
            SizedBox(
              height: 852, // Ensure minimum height
              child: const FooterWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
