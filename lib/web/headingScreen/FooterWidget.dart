import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Scaffold(
      body: Container(
        color: const Color(0xFF0F1A2A),
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 150),
        child: Column(
          children: [
            Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Links & Socials
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 20,
                      runSpacing: 10,
                      children: [
                        const Text(
                          'Company',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          'Explore',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          'Terms of use',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          'Privacy',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          'Cookie Policy',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        _socialIcon(Icons.g_mobiledata),
                        _socialIcon(Icons.facebook),
                        _socialIcon(Icons.code),
                        _socialIcon(Icons.business),
                        _socialIcon(Icons.share),
                      ],
                    ),
                  ],
                ),
                if (!isDesktop) const SizedBox(height: 24),
                // Newsletter subscription
                Container(
                  width: isDesktop ? 300 : double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF101626),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Subscribe',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                hintStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                isDense: true,
                                contentPadding: const EdgeInsets.all(8),
                                filled: true,
                                fillColor: const Color(0xFF1A2238),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: const Text(
                              'Join',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Spacer(),
            Text(
              'TC Teach Company',
              style: GoogleFonts.orbitron(
                color: Color(0xFFFFFFFF).withValues(alpha: 0.5),
                fontSize: 80.0,
                fontWeight: FontWeight.w400,
                // Regular
                fontStyle: FontStyle.normal,
                height: 1.0,
                // 100% line-height (100% / 100 = 1.0)
                letterSpacing: 96.0 * 0.10, // 10% letter-spacing (9.6 px)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: CircleAvatar(
        radius: 14,
        backgroundColor: const Color(0xFF1A2238),
        child: Icon(icon, size: 16, color: Colors.white70),
      ),
    );
  }
}

// ==========================================
// SCREEN 1: HOME / DASHBOARD SCREEN
// ==========================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF060913),
        elevation: 0,
        title: const Text(
          'For Flutter Candidates',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: const Text('Home', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/explore'),
            child: const Text(
              'Explore Screen',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF0D1322),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF141D32)),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('Home Screen'),
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
            ),
            ListTile(
              leading: const Icon(Icons.explore, color: Colors.blue),
              title: const Text('Explore Screen (Screen 2)'),
              onTap: () => Navigator.pushReplacementNamed(context, '/explore'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO BANNER SECTION WITH ROCKET LAUNCH
            Container(
              width: double.infinity,
              height: 380,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1E3C72),
                    Color(0xFF2A5298),
                    Color(0xFF0A0E1A),
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background mountains & rocket graphic simulation
                  Positioned(
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.85,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 220,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=1200&auto=format&fit=crop',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Hero Text overlay
                  Positioned(
                    top: 50,
                    child: Column(
                      children: const [
                        Text(
                          'Ready to transformilo sint voluptas. Error\nvoluptates culpa eligendi. ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Discover next-gen modules built for elite Flutter developers & UI experts.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // CONTENT CARDS SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Discover more: Explore',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    crossAxisCount: isDesktop ? 2 : 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: isDesktop ? 2.2 : 1.4,
                    children: [
                      _buildInfoCard(
                        context,
                        title: 'Join our team',
                        description:
                            'Hic aut voluptatem et. Est dolores ut dolorem. Dolor voluptates culpa eligendi. Hic aut voluptatem et est.',
                        imageUrl:
                            'https://images.unsplash.com/photo-1519681393784-d120267933ba?q=80&w=600&auto=format&fit=crop',
                        actionText: 'EXPLORE CAREERS →',
                        onTap: () => Navigator.pushNamed(context, '/explore'),
                      ),
                      _buildInfoCard(
                        context,
                        title: 'Collaborate for growth',
                        description:
                            'Hic aut voluptatem et. Est dolores ut dolorem. Voluptates culpa eligendi. Hic aut voluptatem.',
                        imageUrl:
                            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=600&auto=format&fit=crop',
                        actionText: 'BECOME A PARTNER →',
                        onTap: () => Navigator.pushNamed(context, '/explore'),
                      ),
                      _buildInfoCard(
                        context,
                        title: 'Beyond the firewall: Resources from Obscen',
                        description:
                            'Aut aut voluptatem et. Est dolores ut dolorem. Dolor voluptates culpa eligendi. Hic aut voluptatem.',
                        imageUrl:
                            'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?q=80&w=600&auto=format&fit=crop',
                        actionText: 'ACCESS RESOURCES →',
                        onTap: () => Navigator.pushNamed(context, '/explore'),
                      ),
                      _buildInfoCard(
                        context,
                        title: 'Advanced Architecture',
                        description:
                            'Scalable patterns, clean code structures, and state management techniques for enterprise applications.',
                        imageUrl:
                            'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?q=80&w=600&auto=format&fit=crop',
                        actionText: 'LEARN MORE →',
                        onTap: () => Navigator.pushNamed(context, '/explore'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // FOOTER
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imageUrl,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white60,
                        height: 1.3,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: onTap,
                  child: Text(
                    actionText,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
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

// ==========================================
// SCREEN 2: EXPLORE & DETAILS SCREEN
// ==========================================
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF060913),
      //   elevation: 0,
      //   title: const Text('Explore & Detailed View (Screen 2)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      //   actions: [
      //     TextButton(
      //       onPressed: () => Navigator.pushNamed(context, '/'),
      //       child: const Text('Home', style: TextStyle(color: Colors.blueAccent)),
      //     ),
      //     TextButton(
      //       onPressed: () => Navigator.pushNamed(context, '/explore'),
      //       child: const Text('Explore', style: TextStyle(color: Colors.white)),
      //     ),
      //     const SizedBox(width: 16),
      //   ],
      // ),
      body: Column(
        children: [
          // Screen 2 Header banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Screen 2: Detailed Candidate Hub',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore advanced topics, career paths, and technical assessments tailored for top Flutter candidates.',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          // Detailed List / Grid items specific to Screen 2
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Modules & Programs',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final titles = [
                      'Flutter Web Performance Optimization',
                      'State Management Masterclass (Bloc & Riverpod)',
                      'Custom Painter & Advanced UI Animations',
                      'CI/CD Pipelines for Flutter Applications',
                    ];
                    final subtitles = [
                      'Learn canvas kit rendering, asset preloading, and startup time reduction.',
                      'Compare state management architectures for large-scale enterprise solutions.',
                      'Build stunning interactive widgets and particle effects from scratch.',
                      'Automate deployment across Play Store, App Store, and Web hosting platforms.',
                    ];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF131B2E),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.code,
                              color: Colors.blueAccent,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titles[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  subtitles[index],
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Enrolled in: ${titles[index]}',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text('View'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // FOOTER
          const FooterWidget(),
        ],
      ),
    );
  }
}
