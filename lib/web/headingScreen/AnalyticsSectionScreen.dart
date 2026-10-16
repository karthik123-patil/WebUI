import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnalyticsSectionScreen extends StatefulWidget {
  const AnalyticsSectionScreen({super.key});

  @override
  State<AnalyticsSectionScreen> createState() => _AnalyticsSectionScreenState();
}

class _AnalyticsSectionScreenState extends State<AnalyticsSectionScreen> {
  // Track the currently selected node to show its active state / popup details
  String selectedNode = 'Clean';

  final Map<String, Map<String, String>> nodeDetails = {
    'Enabled': {
      'title': 'Enabled System',
      'desc':
          'Seamless integration with real-time operational states and instant toggles.',
    },
    'Clean': {
      'title': 'Clean Architecture',
      'desc':
          'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo.',
    },
    'Reliable': {
      'title': 'Reliable Pipeline',
      'desc':
          'Enterprise-grade stability ensuring high availability and fault tolerance.',
    },
    'Organized': {
      'title': 'Organized Data',
      'desc':
          'Structured metrics and pipelines optimized for maximum throughput.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1000;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F9),
      // Light futuristic background matching image
      body: Center(
        child: Flex(
          direction: isDesktop ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. LEFT SIDE: Heading & Description
            SizedBox(
              width: isDesktop ? 450 : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Heading',
                    style: GoogleFonts.manrope(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                      height: 1.48,
                      color: const Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                    'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                    'nulla deserunt vel. Iusto corrupti dicta.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1E2A3B),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E6BFF),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Action when Learn More is clicked
                    },
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

            const SizedBox(height: 50, width: 50),

            // 2. RIGHT SIDE: Interactive Circular Diagram with Popups
            SizedBox(
              width: 400,
              height: 400,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer Concentric Decorative Rings
                  _buildRing(380, 0.03),
                  _buildRing(280, 0.05),
                  _buildRing(180, 0.08),

                  // Highlight Sector Slice for selected item (e.g., Clean quadrant overlay)
                  if (selectedNode == 'Clean')
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF3B82F6).withOpacity(0.4),
                              const Color(0xFF06B6D4).withOpacity(0.1),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(170),
                          ),
                        ),
                      ),
                    ),

                  // Central Core Model Button
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1E6BFF), Color(0xFF0A1931)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'CORE\nMODEL',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),

                  // Node 1: Enabled (Top-Left)
                  Positioned(
                    top: 75,
                    left: 65,
                    child: _buildInteractiveNode(
                      'Enabled',
                      Icons.radio_button_checked,
                    ),
                  ),

                  // Node 2: Clean (Top-Right) - Selected/Highlighted in reference
                  Positioned(
                    top: 75,
                    right: 65,
                    child: _buildInteractiveNode(
                      'Clean',
                      Icons.diamond_outlined,
                    ),
                  ),

                  // Node 3: Reliable (Bottom-Left)
                  Positioned(
                    bottom: 75,
                    left: 65,
                    child: _buildInteractiveNode(
                      'Reliable',
                      Icons.verified_outlined,
                    ),
                  ),

                  // Node 4: Organized (Bottom-Right)
                  Positioned(
                    bottom: 75,
                    right: 65,
                    child: _buildInteractiveNode(
                      'Organized',
                      Icons.alt_route,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build concentric background rings
  Widget _buildRing(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF1E6BFF).withOpacity(opacity),
          width: 1.5,
        ),
      ),
    );
  }

  // Helper to build clickable nodes with active popup triggers
  Widget _buildInteractiveNode(String title, IconData icon) {
    final isSelected = selectedNode == title;

    return InkWell(
      onTap: () {
        setState(() {
          selectedNode = title;
        });
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1E6BFF) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : const Color(0xFF1E6BFF),
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF374151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
