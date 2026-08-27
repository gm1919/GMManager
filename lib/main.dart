import 'package:flutter/material.dart';

void main() {
  runApp(const GMManagerApp());
}

class GMManagerApp extends StatelessWidget {
  const GMManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GM Manager',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16A34A),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6FBF7),
      ),
      home: const GMHome(),
    );
  }
}

class GMHome extends StatefulWidget {
  const GMHome({super.key});

  @override
  State<GMHome> createState() => _GMHomeState();
}

class _GMHomeState extends State<GMHome> {
  int selected = 0;

  final pages = const [
    DashboardPage(),
    ContentPage(),
    AssistantPage(),
    ToolsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selected]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (index) {
          setState(() => selected = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view),
            label: 'Content',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome_outlined),
            selectedIcon: Icon(Icons.auto_awesome),
            label: 'GM AI',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard_customize_outlined),
            selectedIcon: Icon(Icons.dashboard_customize),
            label: 'Tools',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF16A34A),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GM Manager',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your personal social media assistant',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF15803D),
                Color(0xFF22C55E),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.auto_awesome, color: Colors.white, size: 32),
              SizedBox(height: 12),
              Text(
                'Good to see you.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'GM is ready to help create, organize and manage your content.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const SectionTitle(title: 'Quick Actions'),
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: QuickCard(
                icon: Icons.camera_alt_outlined,
                title: 'Create Post',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickCard(
                icon: Icons.add_to_photos_outlined,
                title: 'Story',
              ),
          ),
        ],
        const SizedBox(height: 12),
        Row(
          children: const [
            Expanded(
              child: QuickCard(
                icon: Icons.photo_library_outlined,
                title: 'Collage',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: QuickCard(
                icon: Icons.collections_bookmark_outlined,
                title: 'Highlights',
              ),
            ),
          ],
        ),
        const SizedBox(height: 26),
        const SectionTitle(title: 'GM Status'),
        const SizedBox(height: 12),
        StatusCard(
          icon: Icons.check_circle,
          title: 'Content workspace ready',
          subtitle: 'Your GM workspace is ready for the next stage.',
        ),
        StatusCard(
          icon: Icons.lightbulb_outline,
          title: 'Creative assistant',
          subtitle: 'Generate captions, ideas and content plans.',
        ),
        StatusCard(
          icon: Icons.photo_camera_outlined,
          title: 'Visual tools',
          subtitle: 'Stories, collages and highlights are included.',
        ),
      ],
    );
  }
}

class ContentPage extends StatelessWidget {
  const ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const PageHeader(
          title: 'Content',
          subtitle: 'Create and organize your social content',
        ),
        const SizedBox(height: 20),
        FeatureTile(
          icon: Icons.add_box_outlined,
          title: 'Create Post',
          subtitle: 'Prepare a new social media post',
          onTap: () => showMessage(context, 'Post creator coming next.'),
        ),
        FeatureTile(
          icon: Icons.video_library_outlined,
          title: 'Reels',
          subtitle: 'Plan and organize short-form videos',
          onTap: () => showMessage(context, 'Reels workspace coming next.'),
        ),
        FeatureTile(
          icon: Icons.schedule_outlined,
          title: 'Content Planner',
          subtitle: 'Organize your future content',
          onTap: () => showMessage(context, 'Content planner coming next.'),
        ),
        FeatureTile(
          icon: Icons.edit_note_outlined,
          title: 'Caption Studio',
          subtitle: 'Create captions and hashtags with GM',
          onTap: () => showMessage(context, 'Caption Studio coming next.'),
        ),
      ],
    );
  }
}

class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  final controller = TextEditingController();
  final messages = <String>[
    'Hello! I am GM. How can I help with your content today?',
  ];

  void send() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add('You: $text');
      messages.add(
        'GM: I understand. The AI connection will be added in the next build stage.',
      );
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
          child: PageHeader(
            title: 'GM AI Assistant',
            subtitle: 'Your personal content assistant',
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final mine = messages[index].startsWith('You:');
              return Align(
                alignment:
                    mine ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(15),
                  constraints: const BoxConstraints(maxWidth: 330),
                  decoration: BoxDecoration(
                    color: mine
                        ? const Color(0xFFDCFCE7)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(messages[index]),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Ask GM anything...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onSubmitted: (_) => send(),
                ),
              ),
              const SizedBox(width: 8),
              FloatingActionButton(
                mini: true,
                onPressed: send,
                backgroundColor: const Color(0xFF16A34A),
                foregroundColor: Colors.white,
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const PageHeader(
          title: 'GM Tools',
          subtitle: 'Creative tools for your social media',
        ),
        const SizedBox(height: 20),
        ToolCard(
          icon: Icons.add_to_photos,
          title: 'Instagram Stories',
          description: 'Create and organize story content.',
          onTap: () => showMessage(context, 'Stories workspace selected.'),
        ),
        ToolCard(
          icon: Icons.grid_view,
          title: 'Collage Creator',
          description: 'Combine your photos into attractive layouts.',
          onTap: () => showMessage(context, 'Collage creator selected.'),
        ),
        ToolCard(
          icon: Icons.collections_bookmark,
          title: 'Highlights Manager',
          description: 'Organize and manage your profile highlights.',
          onTap: () => showMessage(context, 'Highlights manager selected.'),
        ),
        ToolCard(
          icon: Icons.auto_fix_high,
          title: 'Photo Assistant',
          description: 'Prepare natural-looking photo improvements.',
          onTap: () => showMessage(
            context,
            'Photo assistant selected. Natural appearance is preserved.',
          ),
        ),
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const PageHeader(
          title: 'Settings',
          subtitle: 'Customize GM Manager',
        ),
        const SizedBox(height: 20),
        const ListTile(
          leading: Icon(Icons.person_outline),
          title: Text('GM Profile'),
          subtitle: Text('Personal assistant settings'),
        ),
        const ListTile(
          leading: Icon(Icons.notifications_none),
          title: Text('Notifications'),
          subtitle: Text('Content and reminder notifications'),
        ),
        const ListTile(
          leading: Icon(Icons.security_outlined),
          title: Text('Privacy'),
          subtitle: Text('Control your content and data'),
        ),
        const ListTile(
          leading: Icon(Icons.palette_outlined),
          title: Text('Theme'),
          subtitle: Text('GM green theme'),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xFFE8F5E9),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            children: [
              Icon(Icons.eco, color: Color(0xFF16A34A)),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'GM Manager\nGreen Edition',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PageHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class QuickCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const QuickCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF16A34A),
            size: 30,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const StatusCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFF16A34A),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE8F5E9),
          child: Icon(
            icon,
            color: const Color(0xFF16A34A),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const ToolCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF16A34A),
                  size: 27,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
