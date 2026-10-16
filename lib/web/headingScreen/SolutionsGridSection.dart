import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SolutionsGridSection extends StatefulWidget {
  const SolutionsGridSection({super.key});

  @override
  State<SolutionsGridSection> createState() => _SolutionsGridSectionState();
}

class _SolutionsGridSectionState extends State<SolutionsGridSection> {
  // Track which card is currently hovered ('Analyze', 'Extinguish', 'Scale', 'Peace', or null)
  String? hoveredCard;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final isDesktop = screenWidth > 1100;

    return Scaffold(
      backgroundColor: Colors.white, // Light background matching Figma design
      body: Center(
        child: Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // 1. LEFT FEATURED HERO CARD (Secure Cube Image + Text Overlay)
            Container(
              width: 340,
              height: 520,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image (Replace with your asset image e.g., 'assets/images/cube.png')
                  Image.asset(
                    'assets/images/sol.jpg',
                    fit: BoxFit.cover,
                  ),

                  // Dark gradient overlay for bottom text legibility
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.95),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [0.3, 0.7, 1.0],
                      ),
                    ),
                  ),

                  // Bottom Text Overlay matching Figma
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Illo sint\nvoluptas. Error\nvoluptates',
                          style: GoogleFonts.manrope(
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.48,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // 2. RIGHT 2x2 GRID CARDS WITH ON-HOVER INTERACTION
            SizedBox(
              width: 720,
              child: Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  _buildHoverCard(
                    title: 'Analyze',
                    icon: Icons.science_outlined,
                    subheading: 'Subheading : Illo sint voluptas. Error voluptates culpa eligendi.',
                    description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                        'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                        'nulla deserunt vel. Iusto corrupti dicta.',
                    cardKey: 'Analyze',
                  ),
                  _buildHoverCard(
                    title: 'Extinguish',
                    icon: Icons.security_outlined,
                    subheading: 'Subheading : Illo sint voluptas. Error voluptates culpa eligendi.',
                    description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                        'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                        'nulla deserunt vel. Iusto corrupti dicta.',
                    cardKey: 'Extinguish',
                  ),
                  _buildHoverCard(
                    title: 'Scale',
                    icon: Icons.trending_up,
                    subheading: 'Subheading : Illo sint voluptas. Error voluptates culpa eligendi.',
                    description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                        'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                        'nulla deserunt vel. Iusto corrupti dicta.',
                    cardKey: 'Scale',
                  ),
                  _buildHoverCard(
                    title: 'Peace',
                    icon: Icons.self_improvement,
                    subheading: 'Subheading : Illo sint voluptas. Error voluptates culpa eligendi.',
                    description: 'Illo sint voluptas. Error voluptates culpa eligendi. Hic vel totam vitae illo. '
                        'Non aliquid explicabo necessitatibus unde. Sed exercitationem placeat consectetur '
                        'nulla deserunt vel. Iusto corrupti dicta.',
                    cardKey: 'Peace',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable card widget with smooth MouseRegion hover reaction
  Widget _buildHoverCard({
    required String title,
    required IconData icon,
    required String subheading,
    required String description,
    required String cardKey,
  }) {
    final bool isHovered = hoveredCard == cardKey;

    return MouseRegion(
      onEnter: (_) => setState(() => hoveredCard = cardKey),
      onExit: (_) => setState(() => hoveredCard = null),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 345,
        height: 248,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          // Background shifts to slightly richer tone or subtle gradient when hovered
          color: isHovered ? const Color(0xFFf6f5f1) : const Color(0xFFD6E8FF),
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(
          //   color: isHovered ? const Color(0xFF3B82F6).withOpacity(0.4) : Colors.transparent,
          //   width: 1.5,
          // ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? Colors.blue.withOpacity(0.08) : Colors
                  .transparent,
              blurRadius: 15,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon + Title Row
            Row(
              children: [
                Icon(icon, color: const Color(0xFF111827), size: 28),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.28,
                    color: const Color(0xFF191B1E),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Subheading
            Text(
              subheading,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF0F1A2A),
                height: 1.26,
              ),
            ),
            const SizedBox(height: 10),

            // Description body paragraph
            Text(
              description,
              style: GoogleFonts.inter(
                fontSize: 11,
                color: const Color(0xFF4B5563),
                height: 1.4,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}