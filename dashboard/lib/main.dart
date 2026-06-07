import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'screens/dashboard_screen.dart';
import 'screens/details_screen.dart';

void main() {
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF3F5F2), // Exact sage-white from screenshot
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5A8A6A),
          surface: const Color(0xFFF3F5F2),
        ),
        useMaterial3: true,
        // Global flat theme
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
        ),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      DashboardScreen(onNavigate: () => setState(() => _currentIndex = 1)),
      const DetailsScreen(),
      const Scaffold(
        backgroundColor: Color(0xFFF3F5F2),
        body: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content
          _screens[_currentIndex],

          // Floating Navigation Pill
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 32),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F5F2),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: Colors.grey.withOpacity(0.3), width: 0.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   _buildNavItem(Iconsax.home_15, Iconsax.home_1, 0),
                  const SizedBox(width: 40),
                  _buildNavItem(Iconsax.activity5, Iconsax.activity, 1),
                  const SizedBox(width: 40),
                  _buildNavItem(Iconsax.profile_circle5, Iconsax.profile_circle, 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData activeIcon, IconData inactiveIcon, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      // Increase tap area
      behavior: HitTestBehavior.opaque,
      child: Icon(
        isSelected ? activeIcon : inactiveIcon,
        color: isSelected ? const Color(0xFF1A1A2E) : Colors.grey,
        size: 26,
      ),
    );
  }
}
