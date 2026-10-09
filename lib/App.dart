
import 'dart:ui';
import 'package:flutter/material.dart';

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetCare',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B1020),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B7CFF),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Roboto',
      ),
      home: const PetCareHome(),
    );
  }
}

class PetCareHome extends StatefulWidget {
  const PetCareHome({super.key});

  @override
  State<PetCareHome> createState() => _PetCareHomeState();
}

class _PetCareHomeState extends State<PetCareHome> {
  int selectedIndex = 0;

  final List<String> titles = [
    'Home',
    'My Pets',
    'Care',
    'Veterinary',
    'Profile',
  ];

  final List<IconData> icons = [
    Icons.home_rounded,
    Icons.pets_rounded,
    Icons.favorite_rounded,
    Icons.local_hospital_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const _AmbientBackground(),
          SafeArea(
            child: IndexedStack(
              index: selectedIndex,
              children: const [
                _HomePage(),
                _SimplePage(
                  icon: Icons.pets_rounded,
                  title: 'My Pets',
                  subtitle: 'Your pets, all in one place.',
                ),
                _SimplePage(
                  icon: Icons.favorite_rounded,
                  title: 'Care Routine',
                  subtitle: 'Build healthy habits for your pets.',
                ),
                _SimplePage(
                  icon: Icons.local_hospital_rounded,
                  title: 'Veterinary',
                  subtitle: 'Your veterinary tools will appear here.',
                ),
                _SimplePage(
                  icon: Icons.person_rounded,
                  title: 'Your Profile',
                  subtitle: 'Personalise your PetCare experience.',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _GlassNavigationBar(
        selectedIndex: selectedIndex,
        icons: icons,
        titles: titles,
        onSelected: (index) {
          setState(() => selectedIndex = index);
        },
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 30),
      children: [
        Row(
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF9B8AFF),
                    Color(0xFF6655DD),
                  ],
                ),
              ),
              child: const Icon(
                Icons.pets_rounded,
                color: Colors.white,
                size: 27,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PETCARE',
                    style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFB9B0FF),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Your pet, your family.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            _CircleIcon(icon: Icons.notifications_none_rounded),
          ],
        ),
        const SizedBox(height: 32),
        const Text(
          'A better day,',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w300,
            letterSpacing: -1,
          ),
        ),
        const Text(
          'for your best friend.',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Everything your pet needs, thoughtfully organised.',
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: Colors.white60,
          ),
        ),
        const SizedBox(height: 26),
        _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.wb_sunny_outlined,
                    color: Color(0xFFFFD58A),
                  ),
                  SizedBox(width: 9),
                  Text(
                    'TODAY AT A GLANCE',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Every little thing matters.',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Add your pet to start tracking meals, '
                'health, reminders and daily routines.',
                style: TextStyle(
                  color: Colors.white60,
                  height: 1.6,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF8B7CFF).withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF9B8AFF).withValues(alpha: 0.3),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color: Color(0xFFB9B0FF),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your pet journey starts here',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        const Text(
          'Explore PetCare',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 15),
        const Row(
          children: [
            Expanded(
              child: _FeatureCard(
                icon: Icons.pets_rounded,
                title: 'My Pets',
                subtitle: 'Pet profiles',
                tint: Color(0xFF9B8AFF),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _FeatureCard(
                icon: Icons.alarm_rounded,
                title: 'Care Plans',
                subtitle: 'Daily routines',
                tint: Color(0xFFFFC47C),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Expanded(
              child: _FeatureCard(
                icon: Icons.health_and_safety_outlined,
                title: 'Health',
                subtitle: 'Wellness notes',
                tint: Color(0xFF79E2C0),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _FeatureCard(
                icon: Icons.location_on_outlined,
                title: 'Vet Finder',
                subtitle: 'Clinic discovery',
                tint: Color(0xFF84C7FF),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Made for the love they give.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white38,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _SimplePage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _SimplePage({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: _GlassCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 46, color: const Color(0xFFB9B0FF)),
              const SizedBox(height: 18),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white60,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color tint;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.tint,
  });

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 27, color: tint),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  final IconData icon;

  const _CircleIcon({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: 44,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white12),
      ),
      child: Icon(icon, color: Colors.white70),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const _GlassCard({
    required this.child,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: const Color(0xFF171D31).withValues(alpha: 0.72),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.10),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

class _GlassNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final List<IconData> icons;
  final List<String> titles;
  final ValueChanged<int> onSelected;

  const _GlassNavigationBar({
    required this.selectedIndex,
    required this.icons,
    required this.titles,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 12, 5, 20),
          decoration: BoxDecoration(
            color: const Color(0xFF101527).withValues(alpha: 0.94),
            border: const Border(
              top: BorderSide(color: Colors.white12),
            ),
          ),
          child: Row(
            children: List.generate(icons.length, (index) {
              final isSelected = selectedIndex == index;

              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onSelected(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFF8B7CFF)
                                  .withValues(alpha: 0.20)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          icons[index],
                          size: 22,
                          color: isSelected
                              ? const Color(0xFFB9B0FF)
                              : Colors.white54,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        titles[index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: isSelected
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: isSelected
                              ? const Color(0xFFB9B0FF)
                              : Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _AmbientBackground extends StatelessWidget {
  const _AmbientBackground();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF171A36),
              Color(0xFF0B1020),
              Color(0xFF101B2A),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -100,
              right: -90,
              child: _GlowOrb(
                color: const Color(0xFF765BFF).withValues(alpha: 0.17),
                size: 270,
              ),
            ),
            Positioned(
              top: 350,
              left: -140,
              child: _GlowOrb(
                color: const Color(0xFF40BDE0).withValues(alpha: 0.10),
                size: 280,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  final Color color;
  final double size;

  const _GlowOrb({
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
