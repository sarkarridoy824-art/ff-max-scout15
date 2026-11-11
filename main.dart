import 'package:flutter/material.dart';

void main() => runApp(const FFMaxScoutApp());

class FFMaxScoutApp extends StatelessWidget {
  const FFMaxScoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FF MAX SCOUT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C4DFF)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FF MAX SCOUT', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Icon(Icons.groups_rounded, size: 76, color: Color(0xFF6C4DFF)),
            const SizedBox(height: 12),
            const Text('Find your squad. Play together.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 28),
            _HomeButton(icon: Icons.search, label: 'Find Squad',
                onTap: () => _showInfo(context, 'Find Squad', 'Squad listings will appear here once online database is connected.')),
            _HomeButton(icon: Icons.add_circle_outline, label: 'Create Squad',
                onTap: () => _showInfo(context, 'Create Squad', 'Squad creation will be added next.')),
            _HomeButton(icon: Icons.person_search, label: 'Find Players',
                onTap: () => _showInfo(context, 'Find Players', 'Player search will be added next.')),
            _HomeButton(icon: Icons.account_circle_outlined, label: 'My Profile',
                onTap: () => _showInfo(context, 'My Profile', 'Player profile and login will be added next.')),
            const Spacer(),
            const Text('Starter version • Online features not connected yet',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  static void _showInfo(BuildContext context, String title, String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  const _HomeButton({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: FilledButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    ),
  );
}
