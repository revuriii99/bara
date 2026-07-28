import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF5382C1);
    const Color textColorDark = Color(0xFF1E293B);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF), 
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F8FF),
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/CloudArt_margin.png'), 
            ),
            const Spacer(),
            Text(
              'BARA',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: textColorDark,
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline_rounded, color: Color(0xFF64748B)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded, color: Color(0xFF64748B)),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(0xFFE2E8F0),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'What would you like to share today?',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: const Color(0xFF94A3B8),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: Text(
                      'Create',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTabChip('For You', isActive: true),
                  _buildTabChip('Live Chat'),
                  _buildTabChip('Following'),
                  _buildTabChip('Trending'),
                ],
              ),
            ),
            const SizedBox(height: 16),

            _buildPostCard(
              name: 'Alex Chen',
              time: '2h ago',
              role: 'Computer Science • Year 3',
              tag: 'ALGORITHM DESIGN',
              title: 'How do you optimize BFS traversal for large graphs?',
              description:
                  'I am working on a social network analysis project and my current BFS implementation is timing out on graphs with 10M+ nodes. Are there...',
              likes: '124',
              comments: '32',
            ),
            const SizedBox(height: 100), 
          ],
        ),
      ),
    );
  }

  Widget _buildTabChip(String label, {bool isActive = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF5382C1) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.manrope(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.white : const Color(0xFF64748B),
        ),
      ),
    );
  }

  Widget _buildPostCard({
    required String name,
    required String time,
    required String role,
    required String tag,
    required String title,
    required String description,
    required String likes,
    required String comments,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xFFCBD5E1),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '• $time',
                        style: GoogleFonts.manrope(
                          fontSize: 11,
                          color: const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    role,
                    style: GoogleFonts.manrope(
                      fontSize: 10,
                      color: const Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              tag,
              style: GoogleFonts.manrope(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF2563EB),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.manrope(
              fontSize: 12,
              color: const Color(0xFF64748B),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.favorite_border, size: 16, color: Color(0xFF94A3B8)),
              const SizedBox(width: 4),
              Text(likes, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, size: 16, color: Color(0xFF94A3B8)),
              const SizedBox(width: 4),
              Text(comments, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
              const Spacer(),
              const Icon(Icons.bookmark_border, size: 16, color: Color(0xFF94A3B8)),
              const SizedBox(width: 12),
              const Icon(Icons.share_outlined, size: 16, color: Color(0xFF94A3B8)),
            ],
          ),
        ],
      ),
    );
  }
}