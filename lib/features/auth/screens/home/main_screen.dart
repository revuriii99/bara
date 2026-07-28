import 'package:flutter/material.dart';
import 'home_screen.dart'; 
import '../profile/profile_screen.dart'; 
import '../discussion/add_discussion_screen.dart'; 

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; 

  final List<Widget> _screens = [
    const HomeScreen(), 
    const Center(child: Text('Explore / Search Screen')), 
    const Center(child: Text('Bookmark Screen')), 
    const ProfileScreen(), 
  ];

  void _openAddDiscussionModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddDiscussionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color activeBlue = Color(0xFF5382C1);
    const Color inactiveGrey = Color(0xFF94A3B8);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FF),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens, 
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Color(0xFF7C3AED), Color(0xFF6366F1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF7C3AED).withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: _openAddDiscussionModal,
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 26),
        ),
      ),
   
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), 
        notchMargin: 8,
        elevation: 10,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home_rounded,
                    color: _currentIndex == 0 ? activeBlue : inactiveGrey, size: 26),
                onPressed: () => setState(() => _currentIndex = 0), 
              ),
              IconButton(
                icon: Icon(Icons.explore_outlined,
                    color: _currentIndex == 1 ? activeBlue : inactiveGrey, size: 26),
                onPressed: () => setState(() => _currentIndex = 1), 
              ),
              const SizedBox(width: 40), 
              IconButton(
                icon: Icon(Icons.bookmark_border_rounded,
                    color: _currentIndex == 2 ? activeBlue : inactiveGrey, size: 26),
                onPressed: () => setState(() => _currentIndex = 2), 
              ),
              IconButton(
                icon: Icon(Icons.person_rounded,
                    color: _currentIndex == 3 ? activeBlue : inactiveGrey, size: 26),
                onPressed: () => setState(() => _currentIndex = 3), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}