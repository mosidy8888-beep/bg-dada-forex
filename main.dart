import 'package:flutter/material.dart';

void main() => runApp(const BgDadaApp());

const gold = Color(0xFFFFC857);
const bg = Color(0xFF0B1018);
const panel = Color(0xFF151D29);
const muted = Color(0xFF9EABBD);

class BgDadaApp extends StatelessWidget {
  const BgDadaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BG # Dada',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: const ColorScheme.dark(
          primary: gold,
          surface: panel,
        ),
        useMaterial3: true,
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int tab = 0;

  final pages = const [
    AnalysisPage(),
    VoicePage(),
    SavedPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bg,
        title: const Row(
          children: [
            Icon(Icons.auto_graph, color: gold),
            SizedBox(width: 9),
            Text('BG # Dada', style: TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => _message(context, 'নোটিফিকেশন ফিচার পরের ধাপে যোগ হবে।'),
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SafeArea(child: pages[tab]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        backgroundColor: panel,
        indicatorColor: gold.withValues(alpha: 0.18),
        onDestinationSelected: (value) => setState(() => tab = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.show_chart), label: 'Analysis'),
          NavigationDestination(icon: Icon(Icons.mic_none), label: 'AI Chat'),
          NavigationDestination(icon: Icon(Icons.bookmark_border), label: 'Saved'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFF263449), panel],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: gold.withValues(alpha: .25)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AI FOREX ASSISTANT', style: TextStyle(color: gold, letterSpacing: 1.4, fontSize: 11, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('XAUUSD Analysis', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
              SizedBox(height: 7),
              Text('তোমার চার্ট, তোমার নিয়ম, তোমার বিশ্লেষণ।', style: TextStyle(color: muted)),
              SizedBox(height: 16),
              Row(children: [
                Icon(Icons.circle, size: 9, color: Colors.orange),
                SizedBox(width: 7),
                Expanded(child: Text('ডেমো স্ক্রিন — এখনো লাইভ মার্কেট ডেটা সংযুক্ত নয়', style: TextStyle(color: Colors.orangeAccent, fontSize: 12))),
              ]),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text('Analysis tools', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        _ToolTile(icon: Icons.screen_share_outlined, title: 'Share screen for analysis', subtitle: 'Android-এর অনুমতি নিয়ে চার্ট শেয়ার', onTap: () => _message(context, 'স্ক্রিন ক্যাপচার ও লাইভ ভিশন পরের ধাপে যোগ হবে।')),
        _ToolTile(icon: Icons.candlestick_chart, title: 'Mark market structure', subtitle: 'BOS • CHoCH • Liquidity • FVG', onTap: () => _message(context, 'চার্ট ডেটা সংযোগের পর এই বিশ্লেষণ চালু হবে।')),
        _ToolTile(icon: Icons.layers_outlined, title: 'Supply / Demand & Order Blocks', subtitle: 'সম্ভাব্য জোন শনাক্তকরণ', onTap: () => _message(context, 'এখন এটি UI placeholder; বাস্তব শনাক্তকরণ এখনো চালু নয়।')),
        _ToolTile(icon: Icons.save_outlined, title: 'Save current analysis', subtitle: 'পরের সংস্করণে ক্লাউডে সংরক্ষণ', onTap: () => _message(context, 'ক্লাউড সেভ যোগ হলে বিশ্লেষণ স্থায়ীভাবে রাখা যাবে।')),
        const SizedBox(height: 14),
        const Text('Note: AI analysis is informational, not a guarantee of profit. Verify every setup and manage risk.', style: TextStyle(color: muted, fontSize: 12)),
      ],
    );
  }
}

class VoicePage extends StatelessWidget {
  const VoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const SizedBox(height: 24),
        const Icon(Icons.graphic_eq, size: 64, color: gold),
        const SizedBox(height: 16),
        const Text('Talk to BG # Dada AI', textAlign: TextAlign.center, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('চার্ট বা স্ট্র্যাটেজি নিয়ে প্রশ্ন করো। ভয়েস ইনপুট ও AI কণ্ঠে উত্তর পরের ধাপে সংযুক্ত হবে।', textAlign: TextAlign.center, style: TextStyle(color: muted)),
        const SizedBox(height: 26),
        FilledButton.icon(
          onPressed: () => _message(context, 'ভয়েস চ্যাট চালু করতে speech-to-text ও AI voice API সংযোগ করতে হবে।'),
          icon: const Icon(Icons.mic),
          label: const Text('Tap to speak'),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () => _message(context, 'টেক্সট চ্যাট ইন্টারফেস পরের ধাপে যোগ হবে।'),
          icon: const Icon(Icons.chat_bubble_outline),
          label: const Text('Type a question'),
        ),
      ],
    );
  }
}

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Saved analyses', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('তোমার সংরক্ষিত চার্ট ও বিশ্লেষণ এখানে থাকবে। ক্লাউড ডেটাবেস এখনো সংযুক্ত হয়নি।', style: TextStyle(color: muted)),
          SizedBox(height: 20),
          Center(child: Icon(Icons.bookmarks_outlined, size: 58, color: muted)),
        ],
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const CircleAvatar(radius: 36, backgroundColor: panel, child: Icon(Icons.person, size: 38, color: gold)),
        const SizedBox(height: 12),
        const Text('Welcome to BG # Dada', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        const Text('Sign in to sync your saved analyses across devices.', textAlign: TextAlign.center, style: TextStyle(color: muted)),
        const SizedBox(height: 22),
        _ToolTile(icon: Icons.login, title: 'Continue with Google', subtitle: 'Google Sign-In / Firebase পরের ধাপে সংযুক্ত হবে', onTap: () => _message(context, 'Google Sign-In চালু করতে Firebase project configuration প্রয়োজন।')),
        _ToolTile(icon: Icons.workspace_premium_outlined, title: 'Plans & subscription', subtitle: 'Free এবং Pro প্ল্যানের কাঠামো', onTap: () => _message(context, 'পেমেন্ট ও সাবস্ক্রিপশন পরে নিরাপদভাবে যুক্ত হবে।')),
        _ToolTile(icon: Icons.admin_panel_settings_outlined, title: 'Admin dashboard', subtitle: 'শুধু অনুমোদিত অ্যাডমিনের জন্য', onTap: () => _message(context, 'Admin access সার্ভার-সাইড অনুমতি দিয়ে তৈরি করতে হবে।')),
      ],
    );
  }
}

class _ToolTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ToolTile({required this.icon, required this.title, required this.subtitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: panel,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: gold.withValues(alpha: .12), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: gold),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Padding(padding: const EdgeInsets.only(top: 4), child: Text(subtitle, style: const TextStyle(color: muted, fontSize: 12))),
        trailing: const Icon(Icons.chevron_right, color: muted),
      ),
    );
  }
}

void _message(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
