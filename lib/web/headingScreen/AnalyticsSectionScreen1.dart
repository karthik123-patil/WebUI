import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsSectionScreen extends StatefulWidget {
  const AnalyticsSectionScreen({super.key});

  @override
  State<AnalyticsSectionScreen> createState() => _AnalyticsSectionScreenState();
}

class _AnalyticsSectionScreenState extends State<AnalyticsSectionScreen> {
  // Currently hovered node (defaults to 'Clean')
  String selectedNode = 'Clean';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1000;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: Center(
        child: Flex(
          direction: isDesktop ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. LEFT SIDE: Heading & Description
            SizedBox(
              width: isDesktop ? 450 : double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 150,top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Heading',
                      style: GoogleFonts.manrope(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                          'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                          'nulla deserunt vel. Iusto corrupti dicta.',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: const Color(0xFF4B5563),
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E6BFF),
                        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        'LEARN MORE',
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 50, width: 50),

            // 2. RIGHT SIDE: Circular Radar UI with On-Hover Quadrant Highlighting (No Popup)
            SizedBox(
              width: 620,
              height: 620,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer background dark radar rings
                  // _buildRing(420, const Color(0xFFD6E0F0)),
                  // _buildRing(620, const Color(0xFF000000)),
                  _buildRing(540, const Color(0xFFC1C9F8)),
                  _buildRing(390, const Color(0xFFADC6EE)),

                  // Dynamic Quadrant Sector Highlighting based on hovered node
                  if (selectedNode.isNotEmpty)
                    _buildSelectedQuadrant(selectedNode),

                  // Central Core Model Circle
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF165BE5),
                          Color(0xFF1D3566)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.4),
                          blurRadius: 25,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'CORE\nMODEL',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 32.0,            // Size/3XL (~32px)
                          fontWeight: FontWeight.w800, // ExtraBold
                          fontStyle: FontStyle.normal,
                          height: 1.32,       // line-height: 32px (1.0 multiplier)
                          letterSpacing: 0.0,        // letter-spacing: None
                        ),
                      ),
                    ),
                  ),

                  // Node 1: Enabled (Top-Left)
                  Positioned(
                    top: 140,
                    left: 140,
                    child: _buildNodeItem('Enabled', "assets/images/thirdscreen/img_4.png"),
                  ),

                  // Node 2: Clean (Top-Right)
                  Positioned(
                    top: 140,
                    right: 140,
                    child: _buildNodeItem('Clean', "assets/images/thirdscreen/img_1.png"),
                  ),

                  // Node 3: Reliable (Bottom-Left)
                  Positioned(
                    bottom: 130,
                    left: 130,
                    child: _buildNodeItem('Reliable', "assets/images/thirdscreen/img_3.png"),
                  ),

                  // Node 4: Organized (Bottom-Right)
                  Positioned(
                    bottom: 130,
                    right: 130,
                    child: _buildNodeItem('Organized',  "assets/images/thirdscreen/img_2.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRing(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000), // #00000014 (14 hex is ~8% opacity)
            offset: const Offset(0, 4),    // 4px horizontal, 4px vertical
            blurRadius: 4,                 // 4px blur
            spreadRadius: 0,
            // In Flutter, inner shadows are simulated using BoxShadow combined with custom painter or inner shadow packages,
            // but here is the standard shadow mapping. For true inner shadow, use a package like flutter_inset_box_shadow or clip/custom painter.
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedQuadrant(String node) {
    double? top, bottom, left, right;
    BorderRadius borderRadius;

    switch (node) {
      case 'Clean':
        top = 20;
        right = 20;
        borderRadius = const BorderRadius.only(topRight: Radius.circular(300));
        break;
      case 'Enabled':
        top = 20;
        left = 20;
        borderRadius = const BorderRadius.only(topLeft: Radius.circular(200));
        break;
      case 'Reliable':
        bottom = 20;
        left = 20;
        borderRadius = const BorderRadius.only(bottomLeft: Radius.circular(200));
        break;
      case 'Organized':
      default:
        bottom = 20;
        right = 20;
        borderRadius = const BorderRadius.only(bottomRight: Radius.circular(200));
        break;
    }

    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF4CDCDF).withOpacity(0.85),
              const Color(0xFF4D90EC).withOpacity(0.6),
              const Color(0xFFC1C9F7).withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: const Color(0x1F000000), // #0000001F (1F hex = ~12% opacity)
              offset: const Offset(-8, 16),  // -8px horizontal, 16px vertical
              blurRadius: 24,                // 24px blur
              spreadRadius: 8,               // 8px spread
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNodeItem(String title, String icon) {
    final isHovered = selectedNode == title;

    return MouseRegion(
      onEnter: (_) => setState(() => selectedNode = title),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: isHovered ? const Color(0xFF1E6BFF) : Colors.transparent,
                width: 2,
              ),
            ),
            child: Image.asset(icon,),
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: isHovered ? const Color(0xFF2563EB) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isHovered ? Colors.white : const Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }
}