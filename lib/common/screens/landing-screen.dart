// ============================================================================
//  CareerMate — Pre-Product Explainer App
//  SIH26044 · Team Tech Vectors
//  Single-file Flutter MVP · ZERO external packages
//  Path: careermate/lib/common/screens/landing_screen.dart
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
//  DESIGN TOKENS — White · Blue · Black · Sandal · Green
// ---------------------------------------------------------------------------
class CMColors {
  CMColors._();

  static const Color white       = Color(0xFFFFFFFF);
  static const Color offWhite    = Color(0xFFF7F9FC);

  static const Color blue        = Color(0xFF1A4FD6);
  static const Color blueDeep    = Color(0xFF0B2B7A);
  static const Color blueSoft    = Color(0xFFE6EDFF);

  static const Color black       = Color(0xFF0B0F1A);
  static const Color ink         = Color(0xFF1B2233);
  static const Color slate       = Color(0xFF5A6478);

  static const Color sandal      = Color(0xFFF2E2C4);
  static const Color sandalDeep  = Color(0xFFD9BE8A);
  static const Color sandalSoft  = Color(0xFFFBF3E4);

  static const Color green       = Color(0xFF12A46A);
  static const Color greenSoft   = Color(0xFFE3F6EE);
}

// ---------------------------------------------------------------------------
//  RESPONSIVE HELPERS
// ---------------------------------------------------------------------------
enum CMDevice { phone, tablet, desktop }

class CMResponsive {
  CMResponsive._();

  static CMDevice deviceOf(BuildContext ctx) {
    final w = MediaQuery.of(ctx).size.width;
    if (w < 720) return CMDevice.phone;
    if (w < 1100) return CMDevice.tablet;
    return CMDevice.desktop;
  }

  static bool isPhone(BuildContext c)   => deviceOf(c) == CMDevice.phone;
  static bool isTablet(BuildContext c)  => deviceOf(c) == CMDevice.tablet;
  static bool isDesktop(BuildContext c) => deviceOf(c) == CMDevice.desktop;

  static double pad(BuildContext c) {
    switch (deviceOf(c)) {
      case CMDevice.phone:   return 20;
      case CMDevice.tablet:  return 32;
      case CMDevice.desktop: return 56;
    }
  }

  static double maxWidth(BuildContext c) {
    switch (deviceOf(c)) {
      case CMDevice.phone:   return 520;
      case CMDevice.tablet:  return 820;
      case CMDevice.desktop: return 1180;
    }
  }

  static int gridCols(BuildContext c, {int phone = 2, int tablet = 3, int desktop = 4}) {
    switch (deviceOf(c)) {
      case CMDevice.phone:   return phone;
      case CMDevice.tablet:  return tablet;
      case CMDevice.desktop: return desktop;
    }
  }
}

// ---------------------------------------------------------------------------
//  MOTION — entrance animation controller wrapper
// ---------------------------------------------------------------------------
class CMFadeUp extends StatefulWidget {
  const CMFadeUp({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 520),
    this.offsetY = 24,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final double offsetY;

  @override
  State<CMFadeUp> createState() => _CMFadeUpState();
}

class _CMFadeUpState extends State<CMFadeUp> with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration);
    _fade = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.offsetY),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

    Future<void>.delayed(widget.delay, () {
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}

// ---------------------------------------------------------------------------
//  SHARED WIDGETS — chips, tags, cards, stat tiles, flow arrows
// ---------------------------------------------------------------------------
class CMPill extends StatelessWidget {
  const CMPill({
    super.key,
    required this.label,
    this.icon,
    this.bg = CMColors.blueSoft,
    this.fg = CMColors.blueDeep,
    this.dense = false,
  });

  final String label;
  final IconData? icon;
  final Color bg;
  final Color fg;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dense ? 10 : 14,
        vertical: dense ? 6 : 9,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: fg.withOpacity(0.16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: dense ? 13 : 15, color: fg),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: TextStyle(
              color: fg,
              fontSize: dense ? 11.5 : 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15,
            ),
          ),
        ],
      ),
    );
  }
}

class CMSectionHeader extends StatelessWidget {
  const CMSectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
    this.align = TextAlign.left,
  });

  final String eyebrow;
  final String title;
  final String? subtitle;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    final phone = CMResponsive.isPhone(context);
    return Column(
      crossAxisAlignment: align == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        CMPill(
          label: eyebrow.toUpperCase(),
          bg: CMColors.sandalSoft,
          fg: CMColors.blueDeep,
          dense: true,
        ),
        const SizedBox(height: 14),
        Text(
          title,
          textAlign: align,
          style: TextStyle(
            color: CMColors.black,
            fontSize: phone ? 24 : 34,
            height: 1.15,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.6,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          Text(
            subtitle!,
            textAlign: align,
            style: const TextStyle(
              color: CMColors.slate,
              fontSize: 14.5,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

class CMStatTile extends StatelessWidget {
  const CMStatTile({
    super.key,
    required this.value,
    required this.label,
    this.accent = CMColors.blue,
    this.icon,
  });

  final String value;
  final String label;
  final Color accent;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CMColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: CMColors.black.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            color: CMColors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8, height: 8,
                decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
              ),
              const Spacer(),
              if (icon != null)
                Icon(icon, size: 16, color: accent.withOpacity(0.85)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: CMColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: CMColors.slate,
              fontSize: 12.5,
              height: 1.35,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class CMInfoCard extends StatelessWidget {
  const CMInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    this.accent = CMColors.blue,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String body;
  final Color accent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: CMColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: CMColors.black.withOpacity(0.06)),
            boxShadow: [
              BoxShadow(
                color: CMColors.black.withOpacity(0.04),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42, height: 42,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: accent, size: 22),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: const TextStyle(
                  color: CMColors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                body,
                style: const TextStyle(
                  color: CMColors.slate,
                  fontSize: 12.8,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (onTap != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Tap to explore',
                      style: TextStyle(
                        color: accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_forward_rounded, size: 14, color: accent),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class CMFlowStep extends StatelessWidget {
  const CMFlowStep({
    super.key,
    required this.index,
    required this.title,
    required this.body,
    this.accent = CMColors.blue,
    this.isLast = false,
  });

  final int index;
  final String title;
  final String body;
  final Color accent;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: accent.withOpacity(0.28),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                index.toString().padLeft(2, '0'),
                style: const TextStyle(
                  color: CMColors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 46,
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.22),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: CMColors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  body,
                  style: const TextStyle(
                    color: CMColors.slate,
                    fontSize: 12.8,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
//  POPUP / BOTTOM SHEET — the "lead" detail system
// ---------------------------------------------------------------------------
Future<void> showCMDetail(
  BuildContext context, {
  required String eyebrow,
  required String title,
  required IconData icon,
  required Color accent,
  required List<CMDetailBlock> blocks,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: CMColors.black.withOpacity(0.45),
    builder: (ctx) {
      final isPhone = CMResponsive.isPhone(ctx);
      return DraggableScrollableSheet(
        initialChildSize: isPhone ? 0.78 : 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) {
          return Container(
            decoration: const BoxDecoration(
              color: CMColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 46, height: 5,
                  decoration: BoxDecoration(
                    color: CMColors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: ListView(
                    controller: controller,
                    padding: const EdgeInsets.fromLTRB(22, 6, 22, 32),
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 46, height: 46,
                            decoration: BoxDecoration(
                              color: accent.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(icon, color: accent, size: 24),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  eyebrow.toUpperCase(),
                                  style: TextStyle(
                                    color: accent,
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  title,
                                  style: const TextStyle(
                                    color: CMColors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w800,
                                    height: 1.2,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ...blocks.map((b) => _buildBlock(b, accent)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

class CMDetailBlock {
  const CMDetailBlock.heading(this.text) : kind = _CMBlockKind.heading, chips = const [];
  const CMDetailBlock.body(this.text)    : kind = _CMBlockKind.body,    chips = const [];
  const CMDetailBlock.bullets(this.chips): kind = _CMBlockKind.bullets, text = '';
  const CMDetailBlock.chips(this.chips)  : kind = _CMBlockKind.chips,   text = '';

  final _CMBlockKind kind;
  final String text;
  final List<String> chips;
}

enum _CMBlockKind { heading, body, bullets, chips }

Widget _buildBlock(CMDetailBlock b, Color accent) {
  switch (b.kind) {
    case _CMBlockKind.heading:
      return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          b.text,
          style: const TextStyle(
            color: CMColors.black,
            fontSize: 14.5,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.2,
          ),
        ),
      );
    case _CMBlockKind.body:
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(
          b.text,
          style: const TextStyle(
            color: CMColors.slate,
            fontSize: 13.5,
            height: 1.6,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    case _CMBlockKind.bullets:
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: b.chips
              .map(
                (t) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 6, height: 6,
                        decoration: BoxDecoration(color: accent, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          t,
                          style: const TextStyle(
                            color: CMColors.ink,
                            fontSize: 13,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      );
    case _CMBlockKind.chips:
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Wrap(
          spacing: 8, runSpacing: 8,
          children: b.chips
              .map((t) => CMPill(label: t, bg: accent.withOpacity(0.10), fg: accent, dense: true))
              .toList(),
        ),
      );
  }
}

// ---------------------------------------------------------------------------
//  MAIN LANDING SCREEN
// ---------------------------------------------------------------------------
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _scroll = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(9, (_) => GlobalKey());

  static const List<_NavItem> _navItems = [
    _NavItem('Overview', 0),
    _NavItem('Academicians', 1),
    _NavItem('Students', 2),
    _NavItem('Institutions', 3),
    _NavItem('Industries', 4),
    _NavItem('Offering', 5),
    _NavItem('How It Works', 6),
    _NavItem('Dashboard', 7),
    _NavItem('Launch', 8),
  ];

  void _scrollTo(int index) {
    final key = _sectionKeys[index];
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 620),
        curve: Curves.easeInOutCubic,
        alignment: 0.02,
      );
    }
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CMColors.offWhite,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            CustomScrollView(
              controller: _scroll,
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              slivers: [
                // Sticky top bar
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _CMTopBarDelegate(
                    onNav: _scrollTo,
                    navItems: _navItems,
                  ),
                ),

                // Sections
                SliverToBoxAdapter(child: _Hero(key: _sectionKeys[0])),
                SliverToBoxAdapter(child: _AcademicianSection(key: _sectionKeys[1])),
                SliverToBoxAdapter(child: _StudentsSection(key: _sectionKeys[2])),
                SliverToBoxAdapter(child: _InstitutionsSection(key: _sectionKeys[3])),
                SliverToBoxAdapter(child: _IndustriesSection(key: _sectionKeys[4])),
                SliverToBoxAdapter(child: _OfferingSection(key: _sectionKeys[5])),
                SliverToBoxAdapter(child: _HowItWorksSection(key: _sectionKeys[6])),
                SliverToBoxAdapter(child: _DashboardSection(key: _sectionKeys[7])),
                SliverToBoxAdapter(child: _LaunchSection(key: _sectionKeys[8])),
                const SliverToBoxAdapter(child: _Footer()),
              ],
            ),
            // Floating help / quick-tour button
            Positioned(
              right: 16, bottom: 16,
              child: _QuickTourFab(onJump: _scrollTo),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem(this.label, this.index);
  final String label;
  final int index;
}

// ---------------------------------------------------------------------------
//  TOP BAR (sticky) — responsive
// ---------------------------------------------------------------------------
class _CMTopBarDelegate extends SliverPersistentHeaderDelegate {
  _CMTopBarDelegate({required this.onNav, required this.navItems});

  final void Function(int) onNav;
  final List<_NavItem> navItems;

  @override
  double get minExtent => 66;
  @override
  double get maxExtent => 66;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final isPhone = CMResponsive.isPhone(context);
    final w = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: CMColors.white.withOpacity(0.94),
        border: Border(
          bottom: BorderSide(color: CMColors.black.withOpacity(0.06)),
        ),
        boxShadow: [
          BoxShadow(
            color: CMColors.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CMResponsive.pad(context)),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: CMResponsive.maxWidth(context)),
            child: Row(
              children: [
                const CMLogo(size: 34),
                const SizedBox(width: 10),
                const Text(
                  'CareerMate',
                  style: TextStyle(
                    color: CMColors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
                const Spacer(),
                if (!isPhone && w >= 900)
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: navItems
                            .map(
                              (n) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: TextButton(
                                  onPressed: () => onNav(n.index),
                                  style: TextButton.styleFrom(
                                    foregroundColor: CMColors.ink,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    n.label,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                const SizedBox(width: 8),
                if (!isPhone)
                  _PrimaryButton(
                    label: 'Launch Concept',
                    icon: Icons.rocket_launch_rounded,
                    onTap: () => onNav(8),
                  )
                else
                  IconButton(
                    onPressed: () => _showMobileMenu(context),
                    icon: const Icon(Icons.menu_rounded, color: CMColors.black),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
          decoration: const BoxDecoration(
            color: CMColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    width: 42, height: 5,
                    decoration: BoxDecoration(
                      color: CMColors.black.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                ...navItems.map(
                  (n) => ListTile(
                    title: Text(
                      n.label,
                      style: const TextStyle(
                        color: CMColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () {
                      Navigator.of(context).pop();
                      onNav(n.index);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  bool shouldRebuild(covariant _CMTopBarDelegate oldDelegate) => false;
}

// ---------------------------------------------------------------------------
//  LOGO — asset-driven (with graceful fallback)
// ---------------------------------------------------------------------------
class CMLogo extends StatelessWidget {
  const CMLogo({super.key, this.size = 40});

  final double size;

  static const String _asset = 'assets/images/icons/careermate-icon.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size * 0.28),
        gradient: const LinearGradient(
          colors: [CMColors.blue, CMColors.blueDeep],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: CMColors.blue.withOpacity(0.28),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        _asset,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Center(
          child: Text(
            'C',
            style: TextStyle(
              color: CMColors.white,
              fontWeight: FontWeight.w900,
              fontSize: size * 0.5,
              letterSpacing: -1,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  BUTTONS
// ---------------------------------------------------------------------------
class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    required this.label,
    required this.onTap,
    this.icon,
    this.bg = CMColors.blue,
    this.fg = CMColors.white,
  });

  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: bg.withOpacity(0.28),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 17, color: fg),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: TextStyle(
                  color: fg,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GhostButton extends StatelessWidget {
  const _GhostButton({required this.label, required this.onTap, this.icon});

  final String label;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: CMColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: CMColors.black.withOpacity(0.10)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 17, color: CMColors.black),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(
                  color: CMColors.black,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  SECTION WRAPPER — consistent outer spacing / max width
// ---------------------------------------------------------------------------
class _SectionWrap extends StatelessWidget {
  const _SectionWrap({super.key, required this.child, this.bg, this.dense = false});

  final Widget child;
  final Color? bg;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: CMResponsive.pad(context),
        vertical: dense ? 40 : 64,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: CMResponsive.maxWidth(context)),
          child: child,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  HERO
// ---------------------------------------------------------------------------
class _Hero extends StatelessWidget {
  const _Hero({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhone = CMResponsive.isPhone(context);
    final isDesktop = CMResponsive.isDesktop(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [CMColors.sandalSoft, CMColors.white, CMColors.blueSoft],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: _SectionWrap(
        child: Flex(
          direction: isDesktop ? Axis.horizontal : Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: isDesktop ? 6 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CMFadeUp(
                    child: Wrap(
                      spacing: 8, runSpacing: 8,
                      children: const [
                        CMPill(label: 'SIH26044', bg: CMColors.blue, fg: CMColors.white, dense: true),
                        CMPill(label: 'Smart Automation', bg: CMColors.sandal, fg: CMColors.black, dense: true),
                        CMPill(label: 'Software', bg: CMColors.green, fg: CMColors.white, dense: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CMFadeUp(
                    delay: const Duration(milliseconds: 80),
                    child: Text(
                      'One platform for\nAcademia · Industry\nSkill · Opportunity.',
                      style: TextStyle(
                        color: CMColors.black,
                        fontSize: isPhone ? 32 : (isDesktop ? 54 : 42),
                        height: 1.05,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  CMFadeUp(
                    delay: const Duration(milliseconds: 160),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 560),
                      child: Text(
                        'CareerMate connects Academicians, Students, Institutions and Industries '
                        'through one skill-mapped, keyword-driven engine — for events, internships, '
                        'placements, FDPs, research collaborations, and more.',
                        style: const TextStyle(
                          color: CMColors.ink,
                          fontSize: 15,
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  CMFadeUp(
                    delay: const Duration(milliseconds: 240),
                    child: Wrap(
                      spacing: 12, runSpacing: 12,
                      children: [
                        _PrimaryButton(
                          label: 'Explore the Concept',
                          icon: Icons.explore_rounded,
                          onTap: () => showCMDetail(
                            context,
                            eyebrow: 'Quick Concept',
                            title: 'CareerMate in 20 seconds',
                            icon: Icons.bolt_rounded,
                            accent: CMColors.blue,
                            blocks: const [
                              CMDetailBlock.body(
                                'CareerMate is a role-based engine that maps skills, '
                                'recommends opportunities, and hosts academia–industry collaboration — '
                                'all from one profile.',
                              ),
                              CMDetailBlock.heading('Who it serves'),
                              CMDetailBlock.chips([
                                'Academicians', 'Students', 'Faculties',
                                'Institutions', 'Industries', 'Event Organizers',
                              ]),
                              CMDetailBlock.heading('Core flow'),
                              CMDetailBlock.bullets([
                                'Sign in (REST · JWT · Bcrypt)',
                                'Profile & interest extraction',
                                'Keyword-driven recommendation engine',
                                'Three-sided home: Profile · Niche · Community',
                                'Posting engine for all roles',
                                'Live demand dashboard',
                              ]),
                            ],
                          ),
                        ),
                        _GhostButton(
                          label: 'Why it matters',
                          icon: Icons.insights_rounded,
                          onTap: () => showCMDetail(
                            context,
                            eyebrow: 'Why it matters',
                            title: 'The gap we bridge',
                            icon: Icons.public_rounded,
                            accent: CMColors.green,
                            blocks: const [
                              CMDetailBlock.heading('By the numbers'),
                              CMDetailBlock.bullets([
                                '55.6% of Tier-II students say colleges lack internship exposure.',
                                '63% of employers report skill gaps as a top barrier.',
                                'Only 42.6% of Indian graduates are overall job-ready.',
                                '51.67% of university researchers show low UR–I participation.',
                                '39% of core skills are expected to change by 2030.',
                                '72% of India\'s unemployed are youth.',
                              ]),
                              CMDetailBlock.heading('CareerMate\'s answer'),
                              CMDetailBlock.body(
                                'A single skill-journey: Assess → Identify gaps → Recommend → '
                                'Apply → Track → Build portfolio.',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  CMFadeUp(
                    delay: const Duration(milliseconds: 320),
                    child: Wrap(
                      spacing: 22, runSpacing: 14,
                      children: const [
                        _MiniMetric(value: '6', label: 'User roles'),
                        _MiniMetric(value: '22', label: 'Opportunity types'),
                        _MiniMetric(value: '3', label: 'Home sections'),
                        _MiniMetric(value: '1', label: 'Unified profile'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (isDesktop) const SizedBox(width: 40) else const SizedBox(height: 36),
            Expanded(
              flex: isDesktop ? 5 : 0,
              child: CMFadeUp(
                delay: const Duration(milliseconds: 200),
                child: const _HeroVisual(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniMetric extends StatelessWidget {
  const _MiniMetric({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: CMColors.blue,
            fontSize: 24,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.6,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: CMColors.slate,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
//  HERO VISUAL — stacked infographic card
// ---------------------------------------------------------------------------
class _HeroVisual extends StatelessWidget {
  const _HeroVisual();

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Base card
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: CMColors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(color: CMColors.black.withOpacity(0.06)),
                boxShadow: [
                  BoxShadow(
                    color: CMColors.black.withOpacity(0.08),
                    blurRadius: 30,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CMLogo(size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CareerMate Engine',
                              style: TextStyle(
                                color: CMColors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Skill → Opportunity → Growth',
                              style: TextStyle(
                                color: CMColors.slate,
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const _EngineBar(label: 'Profile match', pct: 0.92, color: CMColors.blue),
                  const SizedBox(height: 10),
                  const _EngineBar(label: 'Interest overlap', pct: 0.78, color: CMColors.green),
                  const SizedBox(height: 10),
                  const _EngineBar(label: 'Keyword signal', pct: 0.86, color: CMColors.sandalDeep),
                  const Spacer(),
                  Wrap(
                    spacing: 8, runSpacing: 8,
                    children: const [
                      CMPill(label: 'FDP', dense: true, bg: CMColors.blueSoft, fg: CMColors.blueDeep),
                      CMPill(label: 'Internship', dense: true, bg: CMColors.greenSoft, fg: CMColors.green),
                      CMPill(label: 'Research', dense: true, bg: CMColors.sandalSoft, fg: CMColors.black),
                      CMPill(label: 'Placement', dense: true, bg: CMColors.blueSoft, fg: CMColors.blueDeep),
                      CMPill(label: 'Collaboration', dense: true, bg: CMColors.greenSoft, fg: CMColors.green),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Floating badge 1
          Positioned(
            top: -14, right: -10,
            child: _FloatingBadge(
              icon: Icons.auto_awesome_rounded,
              label: 'AI Match',
              color: CMColors.blue,
            ),
          ),
          // Floating badge 2
          Positioned(
            bottom: -12, left: -12,
            child: _FloatingBadge(
              icon: Icons.verified_rounded,
              label: 'Verified',
              color: CMColors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class _EngineBar extends StatelessWidget {
  const _EngineBar({required this.label, required this.pct, required this.color});

  final String label;
  final double pct;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: CMColors.ink,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              '${(pct * 100).round()}%',
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(99),
          child: LinearProgressIndicator(
            value: pct,
            minHeight: 7,
            backgroundColor: CMColors.black.withOpacity(0.06),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  const _FloatingBadge({required this.icon, required this.label, required this.color});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: CMColors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: CMColors.black.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 15),
          const SizedBox(width: 7),
          Text(
            label,
            style: const TextStyle(
              color: CMColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  ACADEMICIAN SECTION (priority #1)
// ---------------------------------------------------------------------------
class _AcademicianSection extends StatelessWidget {
  const _AcademicianSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionWrap(
      bg: CMColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CMFadeUp(
            child: CMSectionHeader(
              eyebrow: 'Priority · 01',
              title: 'Built first for Academicians.',
              subtitle:
                  'Every screen, every recommendation, every posting flow in CareerMate is '
                  'designed so that faculty and researchers get industry exposure, funding, '
                  'collaboration, and upskilling — without leaving the platform.',
            ),
          ),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (context, c) {
              final cols = CMResponsive.gridCols(context, phone: 1, tablet: 2, desktop: 3);
              const cards = <Widget>[
                CMInfoCard(
                  icon: Icons.school_rounded,
                  title: 'Faculty Development',
                  body: 'FDP · FEP · FIP · Refresher Courses · Short-Term Programmes, all matched to your subject & keywords.',
                  accent: CMColors.blue,
                ),
                CMInfoCard(
                  icon: Icons.science_rounded,
                  title: 'Research Collaboration',
                  body: 'Project partnerships, co-authorships, consultancy, and cross-institution research with industries.',
                  accent: CMColors.green,
                ),
                CMInfoCard(
                  icon: Icons.cast_for_education_rounded,
                  title: 'Teach & Mentor',
                  body: 'Offer lectures, mentor students, guide hackathons, and lead webinars — reach the right audience.',
                  accent: CMColors.sandalDeep,
                ),
                CMInfoCard(
                  icon: Icons.article_rounded,
                  title: 'Publish & Present',
                  body: 'Discover conferences, symposia & journals aligned to your niche; track submissions from one place.',
                  accent: CMColors.blue,
                ),
                CMInfoCard(
                  icon: Icons.handshake_rounded,
                  title: 'Industry Connect',
                  body: 'Internships for your students, live industry projects, guest sessions, MoUs — surfaced by keyword match.',
                  accent: CMColors.green,
                ),
                CMInfoCard(
                  icon: Icons.workspace_premium_rounded,
                  title: 'Career Growth',
                  body: 'API-score friendly programmes, verified certificates, and a portfolio built automatically.',
                  accent: CMColors.sandalDeep,
                ),
              ];
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: cols == 1 ? 2.6 : (cols == 2 ? 1.55 : 1.15),
                ),
                itemCount: cards.length,
                itemBuilder: (context, i) => CMFadeUp(
                  delay: Duration(milliseconds: 60 * i),
                  child: cards[i],
                ),
              );
            },
          ),
          const SizedBox(height: 22),
          CMFadeUp(
            child: Align(
              alignment: Alignment.centerLeft,
              child: _GhostButton(
                label: 'See the academician home (3 sections)',
                icon: Icons.dashboard_customize_rounded,
                onTap: () => showCMDetail(
                  context,
                  eyebrow: 'Academician Home',
                  title: 'Three sections, one profile',
                  icon: Icons.dashboard_customize_rounded,
                  accent: CMColors.blue,
                  blocks: const [
                    CMDetailBlock.heading('1 · Profile-based recommendations'),
                    CMDetailBlock.body(
                      'Auto-matched opportunities driven by your designation, department, '
                      'publications, and past engagements.',
                    ),
                    CMDetailBlock.heading('2 · Niche / interest-based recommendations'),
                    CMDetailBlock.body(
                      'You hand-pick keywords ("AI in Education", "Polymer Science", '
                      '"Gender Studies"...). The engine surfaces only what fits.',
                    ),
                    CMDetailBlock.heading('3 · Community'),
                    CMDetailBlock.body(
                      'A LinkedIn-style feed where institutions, industries, and fellow '
                      'academicians post — visible to you because your keywords overlap.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  STUDENTS / FACULTIES SECTION
// ---------------------------------------------------------------------------
class _StudentsSection extends StatelessWidget {
  const _StudentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = CMResponsive.isDesktop(context);
    return _SectionWrap(
      bg: CMColors.offWhite,
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isDesktop ? 5 : 0,
            child: CMFadeUp(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CMSectionHeader(
                    eyebrow: 'Priority · 02',
                    title: 'Students & Faculties — the skill journey.',
                    subtitle:
                        'Assess → Identify gaps → Recommend → Apply → Track → Portfolio. '
                        'One flow that carries a learner from their first year to their first offer.',
                  ),
                  SizedBox(height: 24),
                  _StudentJourney(),
                ],
              ),
            ),
          ),
          if (isDesktop) const SizedBox(width: 40) else const SizedBox(height: 30),
          Expanded(
            flex: isDesktop ? 4 : 0,
            child: CMFadeUp(
              delay: const Duration(milliseconds: 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _StepPopupTile(
                    icon: Icons.assignment_turned_in_rounded,
                    title: 'Skill assessment',
                    subtitle: 'Short, role-aware assessment at sign-up.',
                    accent: CMColors.blue,
                    onTap: () => _popup(context, 'Skill assessment', Icons.assignment_turned_in_rounded, CMColors.blue, const [
                      CMDetailBlock.body('Domain quizzes, self-rating, and prior-engagement signals combine into a skill map.'),
                      CMDetailBlock.chips(['Domain', 'Soft skills', 'Tools', 'Languages']),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  _StepPopupTile(
                    icon: Icons.insights_rounded,
                    title: 'Gap analysis',
                    subtitle: 'See exactly what the market wants vs what you have.',
                    accent: CMColors.green,
                    onTap: () => _popup(context, 'Gap analysis', Icons.insights_rounded, CMColors.green, const [
                      CMDetailBlock.body('The engine compares your profile to live demand signals scraped from jobs, FDPs, research posts and workshops.'),
                      CMDetailBlock.bullets([
                        'Missing skills highlighted',
                        'Suggested courses / FDPs to fill them',
                        'Direct link to matching opportunities',
                      ]),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  _StepPopupTile(
                    icon: Icons.recommend_rounded,
                    title: 'Smart matching',
                    subtitle: 'Internships, jobs, hackathons, workshops — matched.',
                    accent: CMColors.sandalDeep,
                    onTap: () => _popup(context, 'Smart matching', Icons.recommend_rounded, CMColors.sandalDeep, const [
                      CMDetailBlock.body('Same recommendation engine used across all roles. Fully keyword-driven.'),
                      CMDetailBlock.chips(['Internships', 'Jobs', 'Hackathons', 'Workshops', 'Contests', 'Expos']),
                    ]),
                  ),
                  const SizedBox(height: 12),
                  _StepPopupTile(
                    icon: Icons.work_history_rounded,
                    title: 'Track & portfolio',
                    subtitle: 'Every application, certificate, and project — auto-saved.',
                    accent: CMColors.blueDeep,
                    onTap: () => _popup(context, 'Track & portfolio', Icons.work_history_rounded, CMColors.blueDeep, const [
                      CMDetailBlock.body('A verifiable digital portfolio grows with every event you complete.'),
                      CMDetailBlock.bullets([
                        'Application status timeline',
                        'Verified certificates',
                        'Industry mentor feedback',
                        'Exportable resume view',
                      ]),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _popup(BuildContext context, String title, IconData icon, Color accent, List<CMDetailBlock> blocks) {
  showCMDetail(
    context,
    eyebrow: 'Detail',
    title: title,
    icon: icon,
    accent: accent,
    blocks: blocks,
  );
}

class _StudentJourney extends StatelessWidget {
  const _StudentJourney();

  @override
  Widget build(BuildContext context) {
    const steps = [
      ('Assess', 'Short assessment on sign-up'),
      ('Identify', 'Gap analysis vs. live market demand'),
      ('Recommend', 'Keyword + interest matched suggestions'),
      ('Apply', 'One-tap apply to internships, jobs, FDPs'),
      ('Track', 'Status timeline for every application'),
      ('Portfolio', 'Verified, exportable career record'),
    ];
    return Column(
      children: List.generate(
        steps.length,
        (i) => CMFlowStep(
          index: i + 1,
          title: steps[i].$1,
          body: steps[i].$2,
          accent: i.isEven ? CMColors.blue : CMColors.green,
          isLast: i == steps.length - 1,
        ),
      ),
    );
  }
}

class _StepPopupTile extends StatelessWidget {
  const _StepPopupTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: CMColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: CMColors.black.withOpacity(0.06)),
          ),
          child: Row(
            children: [
              Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: accent.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(icon, color: accent, size: 21),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: CMColors.black,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: CMColors.slate,
                        fontSize: 12,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 13, color: CMColors.slate),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  INSTITUTIONS
// ---------------------------------------------------------------------------
class _InstitutionsSection extends StatelessWidget {
  const _InstitutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionWrap(
      bg: CMColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CMFadeUp(
            child: CMSectionHeader(
              eyebrow: 'Priority · 03',
              title: 'Institutions & Universities — publish. reach. measure.',
              subtitle:
                  'One console to publish FDPs, seminars, workshops, and events; reach a keyword-matched '
                  'audience of academicians, students and industries — and see live demand analytics.',
            ),
          ),
          const SizedBox(height: 26),
          LayoutBuilder(
            builder: (context, c) {
              final cols = CMResponsive.gridCols(context, phone: 1, tablet: 2, desktop: 4);
              // FIXED: taller tiles on phone & safe ratios on larger screens.
              final double ratio = cols == 1
                  ? 2.15            // phone: was 3.1 (overflow) → now 2.15 (safe)
                  : (cols == 2
                      ? 1.05        // tablet: was 1.15 → 1.05
                      : 1.08);      // desktop: was 1.15 → 1.08
              final items = <Widget>[
                CMInfoCard(
                  icon: Icons.campaign_rounded,
                  title: 'Publish events',
                  body: 'Post FDPs, FIPs, seminars, workshops, symposia — tagged by field and mode.',
                  accent: CMColors.blue,
                  onTap: () => _popup(context, 'Publishing console', Icons.campaign_rounded, CMColors.blue, const [
                    CMDetailBlock.body('A single form publishes to every relevant user surface.'),
                    CMDetailBlock.chips(['FDP', 'FIP', 'FEP', 'Seminar', 'Workshop', 'Symposium']),
                  ]),
                ),
                CMInfoCard(
                  icon: Icons.insights_rounded,
                  title: 'Live analytics',
                  body: 'See interest, conversion and keyword demand signals in real time.',
                  accent: CMColors.green,
                  onTap: () => _popup(context, 'Analytics', Icons.insights_rounded, CMColors.green, const [
                    CMDetailBlock.bullets([
                      'Registrations by department',
                      'Keyword interest heatmaps',
                      'Funnel: view → apply → attend',
                      'Post-event feedback dashboard',
                    ]),
                  ]),
                ),
                CMInfoCard(
                  icon: Icons.account_tree_rounded,
                  title: 'Alumni & network',
                  body: 'Maintain an always-on network of alumni, faculty and industry partners.',
                  accent: CMColors.sandalDeep,
                  onTap: () => _popup(context, 'Alumni network', Icons.account_tree_rounded, CMColors.sandalDeep, const [
                    CMDetailBlock.body('A living graph of your institution\'s reach across academia and industry.'),
                  ]),
                ),
                CMInfoCard(
                  icon: Icons.verified_user_rounded,
                  title: 'NAAC / NIRF ready',
                  body: 'Auto-generated reports for accreditation, AQAR, and ranking submissions.',
                  accent: CMColors.blueDeep,
                  onTap: () => _popup(context, 'Compliance', Icons.verified_user_rounded, CMColors.blueDeep, const [
                    CMDetailBlock.body('Every event, feedback form, and outcome is stored and exportable.'),
                  ]),
                ),
              ];
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: ratio,
                ),
                itemCount: items.length,
                itemBuilder: (context, i) => CMFadeUp(
                  delay: Duration(milliseconds: 60 * i),
                  child: items[i],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  INDUSTRIES
// ---------------------------------------------------------------------------
class _IndustriesSection extends StatelessWidget {
  const _IndustriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionWrap(
      bg: CMColors.offWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CMFadeUp(
            child: CMSectionHeader(
              eyebrow: 'Priority · 04',
              title: 'Industries — hire skill-matched, not resume-matched.',
              subtitle:
                  'Post internships, jobs, hackathons, projects, and CSR-driven collaborations. '
                  'CareerMate matches you to verified, keyword-tagged talent across academia.',
            ),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, c) {
              final cols = CMResponsive.gridCols(context, phone: 1, tablet: 3, desktop: 3);
              final items = <Widget>[
                _IndustryCard(
                  icon: Icons.work_rounded,
                  title: 'Post opportunities',
                  body: 'Internships · Jobs · Apprenticeships · Traineeships · Projects · Hackathons.',
                  onTap: () => _popup(context, 'Post opportunity', Icons.work_rounded, CMColors.blue, const [
                    CMDetailBlock.chips(['Internship', 'Job', 'Apprenticeship', 'Traineeship', 'Project', 'Hackathon']),
                    CMDetailBlock.body('Every posting is auto-tagged with in-demand skills and instantly routed to matching talent.'),
                  ]),
                ),
                _IndustryCard(
                  icon: Icons.psychology_rounded,
                  title: 'Skill-matched talent',
                  body: 'Filter by verified skills, not just degrees. See readiness scores.',
                  onTap: () => _popup(context, 'Skill matching', Icons.psychology_rounded, CMColors.green, const [
                    CMDetailBlock.bullets([
                      'Skill maps from profile + assessments',
                      'Portfolio & certificate verified',
                      'Prior engagement with your industry type',
                    ]),
                  ]),
                ),
                _IndustryCard(
                  icon: Icons.hub_rounded,
                  title: 'Collaborate',
                  body: 'Partner with academicians on research, consultancy, MoUs, and CSR.',
                  onTap: () => _popup(context, 'Collaboration', Icons.hub_rounded, CMColors.sandalDeep, const [
                    CMDetailBlock.chips(['Research', 'Consultancy', 'CSR', 'MoU', 'Guest lecture', 'Industry visit']),
                  ]),
                ),
              ];
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 14,
                  crossAxisSpacing: 14,
                  childAspectRatio: cols == 1 ? 2.6 : 1.25,
                ),
                itemCount: items.length,
                itemBuilder: (context, i) => CMFadeUp(
                  delay: Duration(milliseconds: 60 * i),
                  child: items[i],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _IndustryCard extends StatelessWidget {
  const _IndustryCard({required this.icon, required this.title, required this.body, required this.onTap});

  final IconData icon;
  final String title;
  final String body;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [CMColors.black, CMColors.ink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: CMColors.black.withOpacity(0.22),
                blurRadius: 22,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42, height: 42,
                decoration: BoxDecoration(
                  color: CMColors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: CMColors.sandal, size: 22),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  color: CMColors.white,
                  fontSize: 15.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                body,
                style: const TextStyle(
                  color: Color(0xFFC8CDDA),
                  fontSize: 12.8,
                  height: 1.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  OFFERING — 22 opportunity types (academician-first)
// ---------------------------------------------------------------------------
class _OfferingSection extends StatelessWidget {
  const _OfferingSection({super.key});

  static const List<_Offering> offerings = [
    _Offering('FDP', Icons.school_rounded, 'Faculty Development Programme', CMColors.blue),
    _Offering('FEP', Icons.swap_horiz_rounded, 'Faculty Exchange Programme', CMColors.blue),
    _Offering('FIP', Icons.emoji_people_rounded, 'Faculty Induction Programme', CMColors.blue),
    _Offering('Workshops', Icons.build_circle_rounded, 'Field-based, hands-on', CMColors.green),
    _Offering('Seminars', Icons.record_voice_over_rounded, 'National · International', CMColors.green),
    _Offering('Webinars', Icons.videocam_rounded, 'Online, live sessions', CMColors.green),
    _Offering('Lectures', Icons.co_present_rounded, 'Guest · Endowment', CMColors.green),
    _Offering('Symposia', Icons.forum_rounded, 'Focused discussions', CMColors.green),
    _Offering('Conferences', Icons.groups_rounded, 'Academic & industry', CMColors.sandalDeep),
    _Offering('Research Collab', Icons.science_rounded, 'Cross-institution research', CMColors.sandalDeep),
    _Offering('Project Partner', Icons.handshake_rounded, 'Industry–academia projects', CMColors.sandalDeep),
    _Offering('Consultancies', Icons.support_agent_rounded, 'Paid expert engagements', CMColors.sandalDeep),
    _Offering('Publications', Icons.article_rounded, 'Journals · Proceedings', CMColors.blueDeep),
    _Offering('Presentations', Icons.slideshow_rounded, 'Paper & poster', CMColors.blueDeep),
    _Offering('Traineeships', Icons.model_training_rounded, 'Structured training', CMColors.blueDeep),
    _Offering('Apprenticeships', Icons.engineering_rounded, 'Learn-while-earn', CMColors.blueDeep),
    _Offering('Internships', Icons.work_outline_rounded, 'For your students', CMColors.green),
    _Offering('Jobs', Icons.badge_rounded, 'Placements & hiring', CMColors.green),
    _Offering('Hackathons', Icons.code_rounded, 'Competitive builds', CMColors.sandalDeep),
    _Offering('Contests', Icons.emoji_events_rounded, 'Prizes & recognition', CMColors.sandalDeep),
    _Offering('Expos & Fests', Icons.celebration_rounded, 'Showcase & network', CMColors.blue),
    _Offering('Industrial Visits', Icons.factory_rounded, 'Tours & exposure', CMColors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return _SectionWrap(
      bg: CMColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CMFadeUp(
            child: CMSectionHeader(
              eyebrow: 'What you can post & discover',
              title: '22 opportunity types. One platform.',
              subtitle:
                  'Curated for academicians and their ecosystem — no noise, only what actually moves a career, '
                  'a classroom, a lab, or an institution forward.',
            ),
          ),
          const SizedBox(height: 26),
          LayoutBuilder(
            builder: (context, c) {
              final cols = CMResponsive.gridCols(context, phone: 2, tablet: 3, desktop: 4);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: cols == 2 ? 1.05 : 1.15,
                ),
                itemCount: offerings.length,
                itemBuilder: (context, i) => CMFadeUp(
                  delay: Duration(milliseconds: 25 * i),
                  child: _OfferingTile(
                    offering: offerings[i],
                    onTap: () => _popup(
                      context,
                      offerings[i].name,
                      offerings[i].icon,
                      offerings[i].accent,
                      [
                        CMDetailBlock.heading(offerings[i].full),
                        CMDetailBlock.body(
                          'Posted by institutions, universities, industries, or fellow academicians. '
                          'Matched to you via the CareerMate recommendation engine.',
                        ),
                        CMDetailBlock.chips(['Profile match', 'Interest match', 'Keyword match']),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Offering {
  const _Offering(this.name, this.icon, this.full, this.accent);
  final String name;
  final IconData icon;
  final String full;
  final Color accent;
}

class _OfferingTile extends StatelessWidget {
  const _OfferingTile({required this.offering, required this.onTap});

  final _Offering offering;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: CMColors.offWhite,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: CMColors.black.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38, height: 38,
                decoration: BoxDecoration(
                  color: offering.accent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(offering.icon, color: offering.accent, size: 20),
              ),
              const Spacer(),
              Text(
                offering.name,
                style: const TextStyle(
                  color: CMColors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.1,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                offering.full,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: CMColors.slate,
                  fontSize: 11,
                  height: 1.35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  HOW IT WORKS — the full architecture flow
// ---------------------------------------------------------------------------
class _HowItWorksSection extends StatelessWidget {
  const _HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionWrap(
      bg: CMColors.offWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CMFadeUp(
            child: CMSectionHeader(
              eyebrow: 'How it works',
              title: 'The CareerMate engine, end to end.',
              subtitle:
                  'Tap each step to see what happens under the hood — from sign-in to dashboard.',
            ),
          ),
          const SizedBox(height: 26),
          LayoutBuilder(
            builder: (context, c) {
              final isDesktop = CMResponsive.isDesktop(context);
              return Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isDesktop ? 3 : 0,
                    child: CMFadeUp(
                      child: Column(
                        children: const [
                          CMFlowStep(
                            index: 1,
                            title: 'Secure sign-in',
                            body: 'REST APIs · JWT sessions · Bcrypt-hashed passwords. Role-aware from the first tap.',
                            accent: CMColors.blue,
                          ),
                          CMFlowStep(
                            index: 2,
                            title: 'Profile & interest extraction',
                            body: 'Skills, subjects, niche keywords, goals — captured once and refined forever.',
                            accent: CMColors.blue,
                          ),
                          CMFlowStep(
                            index: 3,
                            title: 'Recommendation engine',
                            body: 'Filters users and opportunities by keyword + interest + role overlap.',
                            accent: CMColors.green,
                          ),
                          CMFlowStep(
                            index: 4,
                            title: 'Three-sided home',
                            body: 'Profile Recs · Niche Recs · Community feed — for academicians and students.',
                            accent: CMColors.green,
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (isDesktop) const SizedBox(width: 30) else const SizedBox(height: 20),
                  Expanded(
                    flex: isDesktop ? 3 : 0,
                    child: CMFadeUp(
                      delay: const Duration(milliseconds: 120),
                      child: Column(
                        children: const [
                          CMFlowStep(
                            index: 5,
                            title: 'Posting engine',
                            body: 'All roles can post — events & programmes AND LinkedIn-style feed posts.',
                            accent: CMColors.sandalDeep,
                          ),
                          CMFlowStep(
                            index: 6,
                            title: 'Keyword distribution',
                            body: 'Posts are auto-tagged by field and pushed to users with overlapping keywords.',
                            accent: CMColors.sandalDeep,
                          ),
                          CMFlowStep(
                            index: 7,
                            title: 'Upload by institutions & industries',
                            body: 'Universities & companies publish FDPs, jobs, internships, research calls.',
                            accent: CMColors.blueDeep,
                          ),
                          CMFlowStep(
                            index: 8,
                            title: 'Live demand dashboard',
                            body: 'In-demand skills, hire signals, trending keywords — for every user.',
                            accent: CMColors.blueDeep,
                            isLast: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  DASHBOARD
// ---------------------------------------------------------------------------
class _DashboardSection extends StatelessWidget {
  const _DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _SectionWrap(
      bg: CMColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CMFadeUp(
            child: CMSectionHeader(
              eyebrow: 'Cherry on top',
              title: 'A demand dashboard for every user.',
              subtitle:
                  'CareerMate listens to every job, workshop, event, and research post — '
                  'and distils the live signals of what the market actually wants.',
            ),
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, c) {
              final cols = CMResponsive.gridCols(context, phone: 2, tablet: 3, desktop: 4);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: cols == 2 ? 1.35 : 1.2,
                ),
                itemCount: 8,
                itemBuilder: (context, i) {
                  const data = [
                    ('AI / ML', '+38%', CMColors.blue, Icons.psychology_rounded),
                    ('Data Science', '+31%', CMColors.green, Icons.analytics_rounded),
                    ('Cybersecurity', '+27%', CMColors.sandalDeep, Icons.security_rounded),
                    ('IKS & Ethics', '+22%', CMColors.blueDeep, Icons.balance_rounded),
                    ('Sustainability', '+19%', CMColors.green, Icons.eco_rounded),
                    ('Research Writing', '+17%', CMColors.blue, Icons.edit_note_rounded),
                    ('EdTech', '+14%', CMColors.sandalDeep, Icons.cast_for_education_rounded),
                    ('Industry 4.0', '+11%', CMColors.blueDeep, Icons.precision_manufacturing_rounded),
                  ];
                  final d = data[i];
                  return CMFadeUp(
                    delay: Duration(milliseconds: 40 * i),
                    child: CMStatTile(
                      value: d.$2,
                      label: d.$1,
                      accent: d.$3,
                      icon: d.$4,
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 18),
          CMFadeUp(
            child: Align(
              alignment: Alignment.centerLeft,
              child: _GhostButton(
                label: 'What powers the dashboard',
                icon: Icons.insights_rounded,
                onTap: () => _popup(context, 'Dashboard signals', Icons.insights_rounded, CMColors.blue, const [
                  CMDetailBlock.heading('Sources'),
                  CMDetailBlock.chips(['Jobs', 'Internships', 'FDPs', 'Workshops', 'Events', 'Research posts']),
                  CMDetailBlock.heading('What you see'),
                  CMDetailBlock.bullets([
                    'Trending skill keywords',
                    'Sector-wise demand shifts',
                    'Emerging tools and tech',
                    'Hiring momentum by role',
                  ]),
                  CMDetailBlock.heading('Why it matters'),
                  CMDetailBlock.body(
                    'Every stakeholder — academician, student, institution, industry — '
                    'sees the same truth: what the ecosystem actually needs right now.',
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  LAUNCH / CTA
// ---------------------------------------------------------------------------
class _LaunchSection extends StatelessWidget {
  const _LaunchSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhone = CMResponsive.isPhone(context);
    return _SectionWrap(
      bg: CMColors.offWhite,
      dense: true,
      child: CMFadeUp(
        child: Container(
          padding: EdgeInsets.all(isPhone ? 24 : 40),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [CMColors.blue, CMColors.blueDeep, CMColors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: CMColors.blue.withOpacity(0.30),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CMPill(
                label: 'SIH 2026 · Tech Vectors',
                bg: CMColors.white.withOpacity(0.12),
                fg: CMColors.white,
                dense: true,
              ),
              const SizedBox(height: 18),
              Text(
                'This is the concept.\nThe platform comes next.',
                style: TextStyle(
                  color: CMColors.white,
                  fontSize: isPhone ? 26 : 40,
                  height: 1.1,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 14),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Text(
                  'CareerMate is being built as a role-based, keyword-driven engine that unifies '
                  'skill mapping, opportunity matching, academia–industry collaboration, and '
                  'end-to-end career tracking — for the people who shape India\'s classrooms, '
                  'labs, and workforce.',
                  style: const TextStyle(
                    color: Color(0xFFD6DDEE),
                    fontSize: 14,
                    height: 1.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12, runSpacing: 12,
                children: [
                  _PrimaryButton(
                    label: 'Re-run the concept',
                    icon: Icons.replay_rounded,
                    bg: CMColors.white,
                    fg: CMColors.blueDeep,
                    onTap: () => showCMDetail(
                      context,
                      eyebrow: 'Recap',
                      title: 'CareerMate in one minute',
                      icon: Icons.auto_awesome_rounded,
                      accent: CMColors.blue,
                      blocks: const [
                        CMDetailBlock.heading('Who it serves'),
                        CMDetailBlock.chips(['Academicians', 'Students', 'Institutions', 'Industries']),
                        CMDetailBlock.heading('What you can do'),
                        CMDetailBlock.chips(['Post', 'Discover', 'Match', 'Apply', 'Track', 'Collaborate']),
                        CMDetailBlock.heading('Under the hood'),
                        CMDetailBlock.chips(['REST', 'JWT', 'Bcrypt', 'Recommendation engine', 'Dashboard']),
                      ],
                    ),
                  ),
                  _PrimaryButton(
                    label: 'Built by Tech Vectors',
                    icon: Icons.groups_rounded,
                    bg: CMColors.green,
                    onTap: () => showCMDetail(
                      context,
                      eyebrow: 'Team',
                      title: 'Tech Vectors · SIH 2026',
                      icon: Icons.groups_rounded,
                      accent: CMColors.green,
                      blocks: const [
                        CMDetailBlock.body('Problem Statement SIH26044 — Portal for Academia–Industry Collaboration for Skill Mapping, Internships and Placement.'),
                        CMDetailBlock.chips(['Theme: Smart Automation', 'Category: Software']),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  FOOTER — hardened against overflow at narrow widths
// ---------------------------------------------------------------------------
class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhone = CMResponsive.isPhone(context);
    return Container(
      color: CMColors.black,
      padding: EdgeInsets.symmetric(
        horizontal: CMResponsive.pad(context),
        vertical: 32,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: CMResponsive.maxWidth(context)),
          child: isPhone
              ? const _FooterStacked()
              : const _FooterRow(),
        ),
      ),
    );
  }
}

class _FooterRow extends StatelessWidget {
  const _FooterRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CMLogo(size: 40),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CareerMate · Tech Vectors',
                style: TextStyle(
                  color: CMColors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Pre-product concept · SIH26044 · 2026',
                style: TextStyle(
                  color: Color(0xFF9AA2B4),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        const Text(
          '© 2026 · All rights reserved',
          style: TextStyle(
            color: Color(0xFF9AA2B4),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _FooterStacked extends StatelessWidget {
  const _FooterStacked();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CMLogo(size: 40),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CareerMate · Tech Vectors',
                    style: TextStyle(
                      color: CMColors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Pre-product concept · SIH26044 · 2026',
                    style: TextStyle(
                      color: Color(0xFF9AA2B4),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 18),
        Divider(color: Color(0xFF2A3040), height: 1),
        SizedBox(height: 14),
        Text(
          '© 2026 · Tech Vectors · All rights reserved',
          style: TextStyle(
            color: Color(0xFF9AA2B4),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
//  QUICK TOUR FAB
// ---------------------------------------------------------------------------
class _QuickTourFab extends StatefulWidget {
  const _QuickTourFab({required this.onJump});
  final void Function(int) onJump;

  @override
  State<_QuickTourFab> createState() => _QuickTourFabState();
}

class _QuickTourFabState extends State<_QuickTourFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (_, __) {
        final s = 1 + _pulse.value * 0.06;
        return Transform.scale(
          scale: s,
          child: FloatingActionButton.extended(
            heroTag: 'cm-tour',
            onPressed: () => _showTour(context),
            backgroundColor: CMColors.blue,
            foregroundColor: CMColors.white,
            elevation: 6,
            icon: const Icon(Icons.play_circle_fill_rounded),
            label: const Text(
              'Guided tour',
              style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.2),
            ),
          ),
        );
      },
    );
  }

  void _showTour(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        final isPhone = CMResponsive.isPhone(ctx);
        return Container(
          padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
          decoration: const BoxDecoration(
            color: CMColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42, height: 5,
                    decoration: BoxDecoration(
                      color: CMColors.black.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Guided tour',
                  style: TextStyle(
                    color: CMColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Jump to any chapter of the CareerMate concept.',
                  style: TextStyle(
                    color: CMColors.slate,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _tourTile(ctx, 'Overview', Icons.rocket_launch_rounded, CMColors.blue, 0, isPhone),
                        _tourTile(ctx, 'Academicians', Icons.school_rounded, CMColors.blue, 1, isPhone),
                        _tourTile(ctx, 'Students & Faculties', Icons.menu_book_rounded, CMColors.green, 2, isPhone),
                        _tourTile(ctx, 'Institutions', Icons.account_balance_rounded, CMColors.sandalDeep, 3, isPhone),
                        _tourTile(ctx, 'Industries', Icons.factory_rounded, CMColors.blueDeep, 4, isPhone),
                        _tourTile(ctx, 'Opportunity Types', Icons.grid_view_rounded, CMColors.blue, 5, isPhone),
                        _tourTile(ctx, 'How It Works', Icons.account_tree_rounded, CMColors.green, 6, isPhone),
                        _tourTile(ctx, 'Live Dashboard', Icons.insights_rounded, CMColors.sandalDeep, 7, isPhone),
                        _tourTile(ctx, 'Launch / Recap', Icons.rocket_rounded, CMColors.blueDeep, 8, isPhone),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _tourTile(BuildContext ctx, String title, IconData icon, Color accent, int index, bool isPhone) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(ctx).pop();
            widget.onJump(index);
          },
          borderRadius: BorderRadius.circular(14),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: CMColors.offWhite,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: CMColors.black.withOpacity(0.05)),
            ),
            child: Row(
              children: [
                Container(
                  width: 34, height: 34,
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: accent, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: CMColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.5,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, size: 12, color: CMColors.slate),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
//  Unused-import guard (dart:math kept for potential future use)
// ---------------------------------------------------------------------------
// ignore: unused_element
double _cmNoopMath(double x) => math.max(x, 0);