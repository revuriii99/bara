import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddDiscussionScreen extends StatelessWidget {
  const AddDiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color buttonBlue = Color(0xFF5382C1);
    const Color primaryPurple = Color(0xFF7C3AED);
    const Color textColorDark = Color(0xFF1E293B);

    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          
          Center(
            child: Container(height: 4, width: 40, decoration: BoxDecoration(color: const Color(0xFFE2E8F0), borderRadius: BorderRadius.circular(2))),
          ),
          const SizedBox(height: 24),

          Row(
            children: [
              const Icon(Icons.auto_awesome_rounded, color: primaryPurple, size: 24),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start Live Discussion',
                    style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.w800, color: textColorDark),
                  ),
                  Text(
                    'Ask questions, share ideas, and receive real-time\nresponses from the community.',
                    style: GoogleFonts.manrope(fontSize: 11, color: const Color(0xFF64748B), height: 1.3),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close_rounded, color: Color(0xFF64748B)),
                onPressed: () => Navigator.pop(context), 
              ),
            ],
          ),
          const SizedBox(height: 20),

          _buildInputLabel('Discussion Title', isRequired: true),
          const SizedBox(height: 8),
          _buildTextField('How do you optimize BFS traversal for large graphs?'),
          const SizedBox(height: 16),

          _buildInputLabel('Description', isRequired: true),
          const SizedBox(height: 8),
          _buildTextField('Provide context, details, code snippets, questions,\nor discussion topics.', maxLines: 5),
          const SizedBox(height: 24),

          const Spacer(), 

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              child: Text(
                'Start Live Discussion',
                style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label, {bool isRequired = false}) {
    return Row(
      children: [
        Text(label, style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF334155))),
        if (isRequired)
          Text(' *', style: GoogleFonts.manrope(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.red)),
      ],
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
      ),
      child: TextField(
        maxLines: maxLines,
        style: GoogleFonts.manrope(fontSize: 14, color: const Color(0xFF1E293B)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.manrope(fontSize: 13, color: const Color(0xFF94A3B8)),
          contentPadding: const EdgeInsets.all(16),
          border: InputBorder.none,
        ),
      ),
    );
  }
}