import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Zero bars/drawers as requested. 
    // Navigation is handled via internal state triggered by UI elements (like "See all").
    return Scaffold(
      body: _screens[_currentIndex],
      // Adding a VERY subtle hidden navigation or just providing a way to switch
      // to satisfy the PDF while respecting the screenshot.
      // I'll add a simple function to switch screens that I'll pass down.
      floatingActionButton: _currentIndex == 1 
        ? FloatingActionButton.small(
            onPressed: () => setState(() => _currentIndex = 0),
            backgroundColor: const Color(0xFF1A1A2E),
            elevation: 0,
            child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 16),
          )
        : null,
    );
  }
}
