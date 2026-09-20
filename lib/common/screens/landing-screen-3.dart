// ============================================================================
//  CareerMate — Pre-Product Explainer App
//  SIH26044 · Team Tech Vectors
//  Single-file Flutter MVP · 2026
// Authors: Astronautintheocean x GPT_Astra
// ============================================================================

import 'dart:math' as math;
import 'package:flutter/material.dart';


const _blue = Color(0xFF214CDF);
const _green = Color(0xFF16745B);
const _sand = Color(0xFFF3EEE3);
const _ink = Color(0xFF191C1A);
const _white = Color(0xFFFFFFFF);
const _logo = 'assets/images/icons/careermate-icon.png';
const _art = 'assets/images/careermates-philosophy-art-1.jpeg';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _scroll = ScrollController();
  final _anchors = List.generate(7, (_) => GlobalKey());
  final _search = TextEditingController();
  final _interests = <String>{'Artificial intelligence', 'Sustainability'};
  int _role = 0;
  int _feed = 0;
  int _step = 0;
  String _category = 'All';
  String _query = '';
  String _signalSource = 'All posts';
  bool _allTypes = false;

  static const _sections = [
    'Introduction', 'Your world', 'Opportunities', 'How it connects',
    'Demand signals', 'Our philosophy', 'The project',
  ];

  @override
  void dispose() {
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  void _go(int index) {
    final target = _anchors[index].currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      alignment: .02,
      duration: MediaQuery.disableAnimationsOf(context)
          ? Duration.zero : const Duration(milliseconds: 480),
      curve: Curves.easeOutCubic,
    );
  }

  void _explain(String label, String title, List<Widget> children) {
    showDialog<void>(
      context: context,
      builder: (_) => _Explanation(label: label, title: title, children: children),
    );
  }

  void _tour() => showDialog<void>(
        context: context,
        builder: (_) => const _GuidedTour(),
      );

  void _typeDetails(_OpportunityType type) {
    _explain(type.group.toUpperCase(), type.name, [
      Text(type.description),
      const SizedBox(height: 22),
      const _Eyebrow('WHAT A LISTING WOULD SHOW'),
      const SizedBox(height: 12),
      const _Tags(['Host', 'Eligibility', 'Keywords', 'Deadline', 'Mode', 'Cost / funding']),
      const SizedBox(height: 22),
      _Note(
        icon: Icons.route_outlined,
        text: 'Discover → inspect the brief → check eligibility → follow the host’s '
            'application or registration route. This preview does not submit applications.',
      ),
    ]);
  }

  void _opportunityDetails(_Listing item, Set<String> keys) {
    final matches = item.tags.where(keys.contains).toList();
    _explain('ILLUSTRATIVE OPPORTUNITY', item.title, [
      Text('${item.type} · ${item.host}'),
      const SizedBox(height: 18),
      Text(item.summary),
      const SizedBox(height: 22),
      const _Eyebrow('WHY IT APPEARS'),
      const SizedBox(height: 10),
      _Tags(matches.isEmpty ? ['Explore a related field'] : matches),
      const SizedBox(height: 14),
      const Text('This demo compares shared keywords. In the proposed product, '
          'audience, eligibility, deadlines and user preferences also shape discovery. '
          'A recommendation is not an eligibility decision.'),
      const SizedBox(height: 22),
      const _Note(icon: Icons.info_outline,
          text: 'Fictional example. No live vacancy, registration, payment or application.'),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _header(),
          Expanded(
            child: Scrollbar(
              controller: _scroll,
              child: SingleChildScrollView(
                controller: _scroll,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1240),
                    child: LayoutBuilder(builder: (context, constraints) {
                      final padding = constraints.maxWidth < 600 ? 18.0 : 40.0;
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                          const SizedBox(height: 28),
                          _hero(),
                          _chapter(1, 'A WORLD THAT UNDERSTANDS YOURS', _experience()),
                          _chapter(2, 'OPPORTUNITY, WITHOUT THE SCATTER', _catalogue()),
                          _chapter(3, 'THE CONNECTION ENGINE', _engine()),
                          _chapter(4, 'LISTEN TO WHAT IS NEEDED', _demand()),
                          _chapter(5, 'THE THOUGHT BEHIND THE HANDS', _philosophy()),
                          _chapter(6, 'FROM CONCEPT TO POSSIBILITY', _project()),
                          const SizedBox(height: 40),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 22),
                            child: Wrap(alignment: WrapAlignment.spaceBetween,
                              spacing: 20, runSpacing: 12, children: [
                                const Text('CareerMate / Tech Vectors',
                                    style: TextStyle(fontWeight: FontWeight.w700)),
                                const Text('SIH26044 · Smart Automation · Concept preview'),
                                TextButton(onPressed: () => _go(0),
                                    child: const Text('Back to the beginning ↑')),
                              ]),
                          ),
                        ]),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _header() => Container(
        decoration: BoxDecoration(color: _sand,
            border: Border(bottom: BorderSide(color: _ink.withValues(alpha: .1)))),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1240),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: LayoutBuilder(builder: (context, box) {
                final wide = box.maxWidth / MediaQuery.textScalerOf(context).scale(1) > 850;
                return Row(children: [
                  Image.asset(_logo, width: 38, height: 38, fit: BoxFit.contain,
                      semanticLabel: 'CareerMate connected hands logo',
                      errorBuilder: (_, _, _) => const Icon(Icons.hub_outlined, color: _blue, size: 32)),
                  const SizedBox(width: 9),
                  const Expanded(child: Text('CareerMate', softWrap: true,
                      style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800, letterSpacing: -.7))),
                  if (wide) ...[
                    TextButton(onPressed: () => _go(1), child: const Text('The experience')),
                    TextButton(onPressed: () => _go(3), child: const Text('The engine')),
                    TextButton(onPressed: () => _go(5), child: const Text('The philosophy')),
                    const SizedBox(width: 10),
                    FilledButton(onPressed: _tour, child: const Text('Take a look ↗')),
                  ] else
                    PopupMenuButton<int>(
                      tooltip: 'Explore CareerMate',
                      icon: const Icon(Icons.menu_rounded),
                      onSelected: (value) => value == 7 ? _tour() : _go(value),
                      itemBuilder: (_) => [
                        for (var i = 0; i < _sections.length; i++)
                          PopupMenuItem(value: i, child: Text(_sections[i])),
                        const PopupMenuItem(value: 7, child: Text('Guided introduction')),
                      ],
                    ),
                ]);
              }),
            ),
          ),
        ),
      );

  Widget _chapter(int index, String label, Widget child) => Padding(
        key: _anchors[index],
        padding: const EdgeInsets.only(top: 68),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Divider(),
          Padding(padding: const EdgeInsets.symmetric(vertical: 22),
              child: _Eyebrow('0$index / $label')),
          child,
        ]),
      );

  Widget _hero() => Column(
        key: _anchors[0],
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(padding: EdgeInsets.only(bottom: 20),
              child: _Eyebrow('A BETTER POSSIBILITY FOR EVERYONE.')),
          _Split(
            breakpoint: 860,
            firstFlex: 6,
            secondFlex: 4,
            first: _Panel(
              color: _blue,
              padding: 30,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const _Pill('AN INTERACTIVE PRODUCT INTRODUCTION', dark: true),
                const SizedBox(height: 30),
                const _Headline('Good minds.\nBetter connections.', color: _white, large: true),
                const SizedBox(height: 22),
                const Text('Your next research partner, learning experience or industry '
                    'opportunity should not depend on where you happened to look.',
                    style: TextStyle(color: _white, fontSize: 18, height: 1.6)),
                const SizedBox(height: 30),
                Wrap(spacing: 12, runSpacing: 12, children: [
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: _white, foregroundColor: _blue),
                    onPressed: _tour, child: const Text('Explore the idea ↗')),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(foregroundColor: _white,
                        side: const BorderSide(color: _white)),
                    onPressed: () => _go(1), child: const Text('Find your perspective')),
                ]),
                const SizedBox(height: 36),
                const Divider(color: _white),
                const SizedBox(height: 14),
                const Text('One profile. A connected academic life.',
                    style: TextStyle(color: _white, fontSize: 15)),
              ]),
            ),
            second: _Panel(
              color: _white,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const _Eyebrow('THE DISTANCE WE WANT TO CLOSE'),
                const SizedBox(height: 24),
                const _Headline('Expertise exists.\nAccess is uneven.'),
                const SizedBox(height: 24),
                for (final entry in const [
                  ('01', 'Scattered opportunities', 'Bring discovery into one place.'),
                  ('02', 'Invisible expertise', 'Connect people through what they know.'),
                  ('03', 'Unclear next steps', 'Turn skill gaps into learning directions.'),
                ]) ...[
                  _Numbered(number: entry.$1, title: entry.$2, body: entry.$3),
                  const SizedBox(height: 22),
                ],
                const _Note(icon: Icons.touch_app_outlined,
                    text: 'Tap, switch and explore. This is an explanation of the future product—not a live service.'),
              ]),
            ),
          ),
        ],
      );

  Widget _experience() {
    final persona = _personas[_role];
    final keys = _feed == 1 ? _interests : persona.tags.toSet();
    final ranked = _listings.where((item) => item.tags.any(keys.contains)).toList()
      ..sort((a, b) {
        final difference = b.tags.where(keys.contains).length - a.tags.where(keys.contains).length;
        return difference != 0 ? difference : a.title.compareTo(b.title);
      });
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const _Headline('Not another feed.\nYour field, in focus.'),
      const SizedBox(height: 14),
      const Text('Start with a perspective. Then explore how the three discovery spaces differ.'),
      const SizedBox(height: 24),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (var i = 0; i < _personas.length; i++)
          ChoiceChip(label: Text(_personas[i].role), selected: _role == i,
              selectedColor: _blue, showCheckmark: false,
              labelStyle: TextStyle(color: _role == i ? _white : _ink),
              onSelected: (_) => setState(() => _role = i)),
      ]),
      const SizedBox(height: 22),
      _Split(
        firstFlex: 4, secondFlex: 7,
        first: _Panel(color: _ink,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Eyebrow('THE ${persona.role.toUpperCase()} PERSPECTIVE', color: _white),
            const SizedBox(height: 24),
            Icon(persona.icon, color: _sand, size: 40),
            const SizedBox(height: 20),
            Text(persona.title, style: const TextStyle(fontSize: 29, height: 1.2,
                letterSpacing: -.7, color: _white, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            Text(persona.description, style: const TextStyle(color: _white, height: 1.6)),
            const SizedBox(height: 24),
            _Tags(persona.tags, dark: true),
            const SizedBox(height: 22),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: _white, padding: EdgeInsets.zero),
              onPressed: () => _explain('PROFILE SETUP', 'A profile with purpose.', [
                const Text('After sign-in, the proposed platform asks for information '
                    'you choose to provide. It does not silently extract private profiles.'),
                const SizedBox(height: 18),
                const _Tags(['Role', 'Field', 'Skills', 'Interests', 'Goals',
                    'Experience', 'Eligibility details', 'Location / mode']),
                const SizedBox(height: 18),
                const Text('Edit your interests as your direction changes. Skill assessment '
                    'helps distinguish what you already know from what you want to learn.'),
              ]),
              child: const Text('What goes into a profile? ↗')),
          ])),
        second: _Panel(child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const _Eyebrow('EXPERIENCE SAMPLER / FICTIONAL CONTENT'),
          const SizedBox(height: 18),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (var i = 0; i < 3; i++)
              ChoiceChip(
                label: Text(const ['Profile matches', 'Interest matches', 'Community'][i]),
                selected: _feed == i, selectedColor: _sand,
                onSelected: (_) => setState(() => _feed = i)),
          ]),
          const SizedBox(height: 20),
          Text(const [
            'Based on your background, skills and goals.',
            'Choose keywords. Watch the examples change.',
            'Ideas from people and organizations in your field.',
          ][_feed], style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          if (_feed == 1) ...[
            Wrap(spacing: 6, runSpacing: 6, children: [
              for (final tag in _keywords)
                FilterChip(label: Text(tag), selected: _interests.contains(tag),
                    selectedColor: _green.withValues(alpha: .12),
                    onSelected: (selected) => setState(() {
                      if (selected) { _interests.add(tag); } else { _interests.remove(tag); }
                    })),
            ]),
            const SizedBox(height: 20),
          ],
          if (_feed < 2) ...[
            if (ranked.isEmpty)
              const _Note(icon: Icons.manage_search,
                  text: 'No matching examples yet. Select an interest to explore connections.'),
            for (final item in ranked.take(3))
              Padding(padding: const EdgeInsets.only(bottom: 12),
                  child: _ListingTile(item: item,
                      onTap: () => _opportunityDetails(item, keys))),
          ] else ...[
            _CommunityCard(
              title: '${persona.field} circle',
              body: persona.community,
              tags: persona.tags,
              onTap: () => _explain('COMMUNITY / NOT AN OPPORTUNITY LISTING',
                  'A conversation has a different purpose.', [
                const Text('Every user type can share insights, questions, progress and '
                    'experiences. Posts are organized using the author’s field and relevant '
                    'keywords, then surfaced to people with shared interests.'),
                const SizedBox(height: 18),
                const _Tags(['Share', 'Discuss', 'Exchange ideas', 'Discover peers']),
                const SizedBox(height: 18),
                const _Note(icon: Icons.compare_arrows,
                    text: 'Community post: starts a conversation. Opportunity listing: '
                        'has a defined offer, audience, requirements and next action.'),
              ])),
          ],
          if (_role >= 3) ...[
            const SizedBox(height: 12),
            _Note(icon: Icons.publish_outlined,
                text: '${persona.role} also publish structured opportunities. '
                    'The sampler illustrates the audience they connect with.'),
          ],
        ])),
      ),
    ]);
  }

  Widget _catalogue() {
    final filtered = _types.where((item) =>
        (_category == 'All' || item.group == _category) &&
        '${item.name} ${item.description}'.toLowerCase().contains(_query.toLowerCase())).toList();
    final visible = _allTypes || _query.isNotEmpty || _category != 'All'
        ? filtered : filtered.take(6).toList();
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const _Headline('Many ways forward.\nOne place to find them.'),
      const SizedBox(height: 14),
      const Text('25 carefully grouped opportunity types. Research and academic growth first.'),
      const SizedBox(height: 24),
      TextField(
        controller: _search,
        onChanged: (value) => setState(() => _query = value),
        decoration: InputDecoration(
          labelText: 'Find an opportunity type',
          hintText: 'Research, FDP, internship…',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _query.isEmpty ? null : IconButton(
            tooltip: 'Clear search', icon: const Icon(Icons.close),
            onPressed: () { _search.clear(); setState(() => _query = ''); }),
          filled: true, fillColor: _white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        ),
      ),
      const SizedBox(height: 18),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (final category in const ['All', 'Research', 'Development', 'Career', 'Gatherings'])
          ChoiceChip(label: Text(category), selected: _category == category,
              onSelected: (_) => setState(() => _category = category)),
      ]),
      const SizedBox(height: 22),
      if (filtered.isEmpty)
        const _Note(icon: Icons.search_off,
            text: 'No matching type. Try another keyword or select All.'),
      _Tiles(minWidth: 260, children: [
        for (final item in visible)
          _TapCard(onTap: () => _typeDetails(item), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(item.icon, color: _blue, size: 27),
              const SizedBox(height: 22),
              _Eyebrow(item.group.toUpperCase()),
              const SizedBox(height: 8),
              Text(item.name, style: const TextStyle(fontSize: 19,
                  fontWeight: FontWeight.w600, height: 1.25)),
              const SizedBox(height: 16),
              const Text('Explore this connection ↗', style: TextStyle(color: _blue, fontSize: 13)),
            ])),
      ]),
      const SizedBox(height: 20),
      Wrap(alignment: WrapAlignment.spaceBetween, spacing: 16, runSpacing: 12, children: [
        Text('Showing ${visible.length} of ${filtered.length} types'),
        if (_category == 'All' && _query.isEmpty)
          OutlinedButton(onPressed: () => setState(() => _allTypes = !_allTypes),
              child: Text(_allTypes ? 'Show the essentials ↑' : 'Explore all 25 types ↓')),
      ]),
    ]);
  }

  Widget _engine() => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const _Headline('Not just posted.\nConnected with purpose.'),
        const SizedBox(height: 14),
        const Text('Follow one opportunity from its creator to the person it could matter to.'),
        const SizedBox(height: 24),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (var i = 0; i < _journey.length; i++)
            ChoiceChip(label: Text('0${i + 1}  ${_journey[i].title}'), selected: _step == i,
                selectedColor: _blue, showCheckmark: false,
                labelStyle: TextStyle(color: _step == i ? _white : _ink),
                onSelected: (_) => setState(() => _step = i)),
        ]),
        const SizedBox(height: 22),
        _Panel(color: _white, child: _Split(
          first: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Eyebrow('STEP 0${_step + 1} / PROPOSED PRODUCT FLOW'),
            const SizedBox(height: 20),
            Text(_journey[_step].heading,
                style: const TextStyle(fontSize: 30, height: 1.2, fontWeight: FontWeight.w700)),
            const SizedBox(height: 18),
            Text(_journey[_step].body),
            const SizedBox(height: 24),
            Wrap(spacing: 12, runSpacing: 12, children: [
              OutlinedButton(onPressed: _step == 0 ? null : () => setState(() => _step--),
                  child: const Text('← Previous')),
              FilledButton(onPressed: () => setState(() => _step = (_step + 1) % _journey.length),
                  child: Text(_step == _journey.length - 1 ? 'Replay the flow ↺' : 'Next connection →')),
            ]),
          ]),
          second: _Panel(color: _sand, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
              Icon(_journey[_step].icon, color: _green, size: 38),
              const SizedBox(height: 22),
              const _Eyebrow('WHAT MOVES THROUGH THE ENGINE'),
              const SizedBox(height: 18),
              _Tags(_journey[_step].tags),
              const SizedBox(height: 24),
              const _Numbered(number: 'A', title: 'The opportunity',
                  body: 'What is offered, to whom, and under which requirements.'),
              const SizedBox(height: 20),
              const _Numbered(number: 'B', title: 'The person',
                  body: 'What they know, what interests them and where they want to go.'),
              const SizedBox(height: 20),
              const _Note(icon: Icons.join_inner,
                  text: 'Shared keywords create a connection. Context makes it useful.'),
            ])),
        )),
        const SizedBox(height: 18),
        Wrap(spacing: 12, runSpacing: 12, children: [
          TextButton(onPressed: () => _explain('TWO DISTINCT PUBLISHING PATHS',
              'An offer is not the same as a post.', [
            const _Numbered(number: '01', title: 'Structured opportunities',
                body: 'Institutions, universities, industries and organizers describe '
                    'the offer, intended roles, field, keywords, dates, eligibility, '
                    'requirements, delivery mode and application route.'),
            const SizedBox(height: 22),
            const _Numbered(number: '02', title: 'Community conversations',
                body: 'All user types share insights, questions and progress. Author '
                    'context and shared keywords help the right people discover them.'),
          ]), child: const Text('Who posts what? ↗')),
          TextButton(onPressed: () => _go(6), child: const Text('Look beneath the interface ↗')),
        ]),
      ]);

  Widget _demand() {
    final records = _signalSource == 'All posts' ? _listings
        : _listings.where((item) => item.source == _signalSource).toList();
    final counts = <String, int>{};
    for (final item in records) {
      for (final tag in item.tags.toSet()) { counts[tag] = (counts[tag] ?? 0) + 1; }
    }
    final ranked = counts.entries.toList()..sort((a, b) =>
        b.value == a.value ? a.key.compareTo(b.key) : b.value.compareTo(a.value));
    final maxCount = ranked.isEmpty ? 1 : ranked.first.value;
    return _Panel(color: _ink, child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const _Eyebrow('SHARED INTELLIGENCE / EVERY ROLE', color: _sand),
        const SizedBox(height: 20),
        const _Headline('What the ecosystem\nis asking for.', color: _white),
        const SizedBox(height: 18),
        const Text('A shared dashboard turns keywords in opportunities into signals: '
            'what employers seek, what researchers explore and what educators teach.',
            style: TextStyle(color: _white, height: 1.6)),
        const SizedBox(height: 24),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final source in const ['All posts', 'Hiring', 'Learning', 'Research'])
            ChoiceChip(label: Text(source), selected: _signalSource == source,
                selectedColor: _sand, backgroundColor: _white,
                labelStyle: const TextStyle(color: _ink),
                onSelected: (_) => setState(() => _signalSource = source)),
        ]),
        const SizedBox(height: 25),
        _Split(
          firstFlex: 6, secondFlex: 4,
          first: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            for (final entry in ranked.take(5))
              Padding(padding: const EdgeInsets.only(bottom: 20), child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Wrap(alignment: WrapAlignment.spaceBetween, spacing: 12, runSpacing: 6, children: [
                    Text(entry.key, style: const TextStyle(color: _white, fontWeight: FontWeight.w600)),
                    Text('${entry.value} / ${records.length} example listings',
                        style: const TextStyle(color: _sand, fontSize: 12)),
                  ]),
                  const SizedBox(height: 9),
                  Semantics(label: '${entry.key}: ${entry.value} of ${records.length} example listings',
                    child: ClipRRect(borderRadius: BorderRadius.circular(8),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: entry.value / maxCount),
                        duration: MediaQuery.disableAnimationsOf(context)
                            ? Duration.zero : const Duration(milliseconds: 350),
                        builder: (_, value, _) => LinearProgressIndicator(
                          value: value, minHeight: 7,
                          backgroundColor: _white.withValues(alpha: .12),
                          valueColor: const AlwaysStoppedAnimation(_sand)),
                      )),
                  ),
                ])),
          ]),
          second: _Panel(color: _green, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Icon(Icons.insights_outlined, size: 34, color: _white),
              const SizedBox(height: 18),
              const Text('A signal. Not a crystal ball.',
                  style: TextStyle(color: _white, fontSize: 24, fontWeight: FontWeight.w600)),
              const SizedBox(height: 14),
              const Text('A workshop mentioning AI signals learning activity. '
                  'A job requiring AI signals hiring demand. Keeping those sources '
                  'separate makes the dashboard more honest.',
                  style: TextStyle(color: _white, height: 1.6)),
              const SizedBox(height: 20),
              TextButton(style: TextButton.styleFrom(foregroundColor: _white),
                onPressed: () => _explain('DEMAND SIGNALS / METHODOLOGY', 'Count the context, too.', [
                  const Text('In this preview, each keyword is counted once per fictional '
                      'listing. Filter by Hiring, Learning or Research to change the source. '
                      'Bar lengths are relative to the largest count in the selected group.'),
                  const SizedBox(height: 18),
                  const Text('The proposed dashboard would normalize synonymous skills, '
                      'remove duplicate or expired listings, and show time range, sample '
                      'size and source type. Platform activity is not the whole labour market.'),
                ]), child: const Text('How to read these signals ↗')),
            ])),
        ),
        const SizedBox(height: 16),
        const Text('DEMO DATA ONLY · Computed from fictional listings in this file. No live market claims.',
            style: TextStyle(color: _sand, fontSize: 12, height: 1.5)),
      ]));
  }

  Widget _philosophy() => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const _Headline('The smallest distance.\nThe greatest possibility.'),
        const SizedBox(height: 18),
        const Text('Why two reaching hands became the thought behind CareerMate.'),
        const SizedBox(height: 26),
        _Panel(padding: 0, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Semantics(image: true,
            label: 'The user’s adapted Creation of Adam artwork, symbolizing a connection to knowledge.',
            child: Image.asset(_art, width: double.infinity, fit: BoxFit.contain,
              excludeFromSemantics: true,
              errorBuilder: (_, _, _) => const Padding(
                padding: EdgeInsets.all(28),
                child: _Note(icon: Icons.image_outlined,
                    text: 'Add your landscape artwork at '
                        'assets/images/careermates-philosophy-art-1.jpeg. '
                        'The full image will appear here without cropping.')))),
          Padding(padding: const EdgeInsets.all(24),
            child: Wrap(alignment: WrapAlignment.spaceBetween, spacing: 16, runSpacing: 12, children: [
              const Text('A visual interpretation inspired by Michelangelo’s The Creation of Adam.',
                  style: TextStyle(fontSize: 12, height: 1.6)),
              TextButton(onPressed: () => _explain('THE FULL COMPOSITION', 'The connection, uninterrupted.', [
                const Text('Pinch or scroll to inspect. The initial view contains the entire image.'),
                const SizedBox(height: 18),
                InteractiveViewer(minScale: 1, maxScale: 4,
                  child: Image.asset(_art, fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => const Text('The artwork asset has not been added yet.'))),
              ]), child: const Text('Inspect the artwork ↗')),
            ])),
        ])),
        const SizedBox(height: 26),
        _Split(firstFlex: 5, secondFlex: 5,
          first: const _Panel(color: _green, child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children: [
              _Eyebrow('OUR INTERPRETATION', color: _white),
              SizedBox(height: 22),
              Text('“Talent is not always missing.\nSometimes, the connection is.”',
                  style: TextStyle(fontFamily: 'Georgia', fontSize: 32,
                      color: _white, height: 1.35, letterSpacing: -.6)),
              SizedBox(height: 20),
              Text('An original expression of the CareerMate concept.',
                  style: TextStyle(color: _white, fontSize: 12)),
            ])),
          second: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            for (final meaning in const [
              ('01', 'The reaching hand', 'The learner, the researcher, the institution: '
                  'human curiosity reaching beyond what it already knows.'),
              ('02', 'The answering hand', 'Knowledge, expertise and opportunity: '
                  'valuable not only because they exist, but because they can be shared.'),
              ('03', 'The connection', 'CareerMate is not knowledge itself. It is the '
                  'meeting place where curiosity finds someone, or something, that helps it grow.'),
            ]) ...[
              _Numbered(number: meaning.$1, title: meaning.$2, body: meaning.$3),
              const SizedBox(height: 23),
            ],
          ]),
        ),
        const SizedBox(height: 16),
        const Text('The painting supplies the metaphor; CareerMate gives it a contemporary '
            'purpose. This is our interpretation—not a claim about the artist’s original intent.',
            style: TextStyle(fontSize: 13, height: 1.6)),
      ]);

  Widget _project() => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const _Headline('A clear purpose.\nA practical foundation.'),
        const SizedBox(height: 24),
        _Tiles(minWidth: 280, children: [
          _TapCard(onTap: () => _explain('PROPOSED ARCHITECTURE', 'The system behind the connection.', [
            for (final item in const [
              ('01', 'Flutter + Dart', 'Responsive user interfaces and interaction.'),
              ('02', 'REST APIs · Node.js · Express · TypeScript',
                  'Request validation, role checks and application logic.'),
              ('03', 'PostgreSQL', 'Profiles, skills, opportunities, posts, applications and portfolio records.'),
              ('04', 'Matching engine', 'Keyword overlap, user goals and eligibility-aware filtering.'),
              ('05', 'FCM', 'Proposed notifications for relevant opportunities and status updates.'),
              ('06', 'Deployment & version control', 'The deck proposes GitHub, Vercel and Render. '
                  'Deployment configuration belongs to a later implementation phase.'),
            ]) ...[
              _Numbered(number: item.$1, title: item.$2, body: item.$3),
              const SizedBox(height: 20),
            ],
          ]), child: const _Feature(icon: Icons.account_tree_outlined, title: 'Built to connect.',
              body: 'One cross-platform interface. A structured, role-aware backend.', action: 'Inspect the architecture ↗')),
          _TapCard(onTap: () => _explain('PLANNED AUTHENTICATION', 'Trust belongs behind every interaction.', [
            const _Tags(['REST APIs', 'JWT', 'bcrypt', 'Role-based authorization']),
            const SizedBox(height: 20),
            const Text('The proposed backend verifies credentials against bcrypt password '
                'hashes and issues signed tokens after successful authentication. '
                'The server—not the visible UI—must enforce access permissions.'),
            const SizedBox(height: 18),
            const Text('HTTPS, input validation, token expiry, secure token handling and '
                'abuse controls belong to production implementation. JWT and bcrypt '
                'alone do not make a system secure.'),
            const SizedBox(height: 18),
            const _Note(icon: Icons.lock_outline,
                text: 'This frontend preview collects no credentials and implements no authentication.'),
          ]), child: const _Feature(icon: Icons.shield_outlined, title: 'Designed for trust.',
              body: 'A security plan—not a pretend sign-in screen.', action: 'Understand the boundary ↗')),
          _TapCard(onTap: () => _explain('SIH26044 / TECH VECTORS', 'An academic journey, connected.', [
            const _Numbered(number: '01', title: 'Access',
                body: 'Make research, learning and industry opportunities easier to discover.'),
            const SizedBox(height: 20),
            const _Numbered(number: '02', title: 'Alignment',
                body: 'Use skill mapping and source-aware demand signals to guide development.'),
            const SizedBox(height: 20),
            const _Numbered(number: '03', title: 'Continuity',
                body: 'Connect assessment, discovery, applications, progress and portfolio building.'),
            const SizedBox(height: 20),
            const Text('The deck proposes expansion from individual colleges to wider '
                'academic and industry networks. Adoption, cost and scalability still '
                'need validation; this preview does not claim proven outcomes.'),
          ]), child: const _Feature(icon: Icons.north_east, title: 'Built for a next step.',
              body: 'Access. Skill alignment. Collaboration. Evidence of growth.', action: 'See the intended impact ↗')),
        ]),
        const SizedBox(height: 24),
        _Panel(color: _blue, child: _Split(
          first: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Eyebrow('SMART INDIA HACKATHON 2026', color: _white),
            SizedBox(height: 20),
            _Headline('Let curiosity\nfind its counterpart.', color: _white),
            SizedBox(height: 18),
            Text('Portal for Academia–Industry Collaboration for Skill Mapping, '
                'Internships and Placement.', style: TextStyle(color: _white, height: 1.6)),
          ]),
          second: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const _Pill('SIH26044 · TEAM TECH VECTORS', dark: true),
            const SizedBox(height: 24),
            const Text('This phase explains the product. Real sign-in, publishing, '
                'recommendations, applications and tracking require the backend and '
                'validation work of the next phase.', style: TextStyle(color: _white, height: 1.6)),
            const SizedBox(height: 24),
            FilledButton(style: FilledButton.styleFrom(backgroundColor: _white, foregroundColor: _blue),
                onPressed: _tour, child: const Text('Walk through the concept ↗')),
          ]),
        )),
      ]);
}

class _Split extends StatelessWidget {
  const _Split({required this.first, required this.second, this.firstFlex = 1,
    this.secondFlex = 1, this.breakpoint = 780});
  final Widget first, second;
  final int firstFlex, secondFlex;
  final double breakpoint;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, box) {
    final scale = MediaQuery.textScalerOf(context).scale(1);
    if (box.maxWidth / scale < breakpoint) {
      return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [first, const SizedBox(height: 22), second]);
    }
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(flex: firstFlex, child: first), const SizedBox(width: 24),
      Expanded(flex: secondFlex, child: second),
    ]);
  });
}

class _Tiles extends StatelessWidget {
  const _Tiles({required this.children, this.minWidth = 260});
  final List<Widget> children;
  final double minWidth;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, box) {
    final effectiveMin = minWidth * MediaQuery.textScalerOf(context).scale(1);
    final columns = ((box.maxWidth + 16) / (effectiveMin + 16)).floor().clamp(1, 3);
    final width = (box.maxWidth - (columns - 1) * 16) / columns;
    return Wrap(spacing: 16, runSpacing: 16,
        children: [for (final child in children) SizedBox(width: width, child: child)]);
  });
}

class _Panel extends StatelessWidget {
  const _Panel({required this.child, this.color = _white, this.padding = 24});
  final Widget child;
  final Color color;
  final double padding;
  @override
  Widget build(BuildContext context) => Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    child: Padding(padding: EdgeInsets.all(padding), child: child),
  );
}

class _TapCard extends StatelessWidget {
  const _TapCard({required this.child, required this.onTap});
  final Widget child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: _white, borderRadius: BorderRadius.circular(16),
    clipBehavior: Clip.antiAlias,
    child: InkWell(onTap: onTap, hoverColor: _blue.withValues(alpha: .04),
      focusColor: _blue.withValues(alpha: .09),
      child: Padding(padding: const EdgeInsets.all(22), child: child)),
  );
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text, {this.color = _ink});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) => Text(text, style: TextStyle(
    color: color, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 1.5, height: 1.6));
}

class _Headline extends StatelessWidget {
  const _Headline(this.text, {this.color = _ink, this.large = false});
  final String text;
  final Color color;
  final bool large;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, box) {
    final narrow = box.maxWidth / MediaQuery.textScalerOf(context).scale(1) < 380;
    return Text(text, style: TextStyle(color: color,
        fontSize: large ? (narrow ? 38 : 61) : (narrow ? 30 : 43),
        height: 1.08, fontWeight: FontWeight.w600, letterSpacing: -1.5));
  });
}

class _Pill extends StatelessWidget {
  const _Pill(this.text, {this.dark = false});
  final String text;
  final bool dark;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
    decoration: BoxDecoration(
        color: dark ? _white.withValues(alpha: .12) : _sand,
        borderRadius: BorderRadius.circular(8)),
    child: Text(text, style: TextStyle(color: dark ? _white : _ink,
        fontSize: 11, fontWeight: FontWeight.w600, height: 1.5)),
  );
}

class _Tags extends StatelessWidget {
  const _Tags(this.items, {this.dark = false});
  final List<String> items;
  final bool dark;
  @override
  Widget build(BuildContext context) => Wrap(spacing: 7, runSpacing: 7,
      children: [for (final tag in items) _Pill(tag, dark: dark)]);
}

class _Numbered extends StatelessWidget {
  const _Numbered({required this.number, required this.title, required this.body});
  final String number, title, body;
  @override
  Widget build(BuildContext context) => Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(number, style: const TextStyle(color: _green, fontWeight: FontWeight.w700, fontSize: 12)),
    const SizedBox(width: 15),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, height: 1.3)),
      const SizedBox(height: 7), Text(body),
    ])),
  ]);
}

class _Note extends StatelessWidget {
  const _Note({required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(color: _sand, borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.all(14),
    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: _green, size: 20), const SizedBox(width: 12),
      Expanded(child: Text(text, style: const TextStyle(fontSize: 13, color: _ink, height: 1.5))),
    ]),
  );
}

class _Feature extends StatelessWidget {
  const _Feature({required this.icon, required this.title, required this.body, required this.action});
  final IconData icon;
  final String title, body, action;
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Icon(icon, color: _green, size: 30), const SizedBox(height: 22),
    Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.2)),
    const SizedBox(height: 12), Text(body), const SizedBox(height: 24),
    Text(action, style: const TextStyle(color: _blue, fontSize: 13)),
  ]);
}

class _ListingTile extends StatelessWidget {
  const _ListingTile({required this.item, required this.onTap});
  final _Listing item;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => Material(
    color: _sand, borderRadius: BorderRadius.circular(12), clipBehavior: Clip.antiAlias,
    child: InkWell(onTap: onTap, child: Padding(padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _Eyebrow(item.type.toUpperCase()), const SizedBox(height: 8),
        Text(item.title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, height: 1.25)),
        const SizedBox(height: 10), Text('${item.host} · Example', style: const TextStyle(fontSize: 12)),
        const SizedBox(height: 12),
        const Text('Why this connection? ↗', style: TextStyle(color: _blue, fontSize: 13)),
      ]))),
  );
}

class _CommunityCard extends StatelessWidget {
  const _CommunityCard({required this.title, required this.body, required this.tags, required this.onTap});
  final String title, body;
  final List<String> tags;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => _TapCard(onTap: onTap,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _Pill('COMMUNITY POST / EXAMPLE'), const SizedBox(height: 18),
      Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
      const SizedBox(height: 12), Text(body), const SizedBox(height: 18),
      _Tags(tags), const SizedBox(height: 22),
      const Text('See how conversations travel ↗', style: TextStyle(color: _blue, fontSize: 13)),
    ]));
}

class _Explanation extends StatelessWidget {
  const _Explanation({required this.label, required this.title, required this.children});
  final String label, title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) => Dialog(
    backgroundColor: _white,
    insetPadding: const EdgeInsets.all(12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 680, maxHeight: MediaQuery.sizeOf(context).height * .88),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(padding: const EdgeInsets.fromLTRB(20, 10, 10, 0), child: Row(children: [
          Expanded(child: _Eyebrow(label)),
          IconButton(tooltip: 'Close explanation', onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close)),
        ])),
        Flexible(child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(title, style: const TextStyle(fontSize: 29, fontWeight: FontWeight.w600,
                height: 1.2, letterSpacing: -.7)),
            const SizedBox(height: 24), ...children,
          ]),
        )),
      ]),
    ),
  );
}

class _GuidedTour extends StatefulWidget {
  const _GuidedTour();
  @override
  State<_GuidedTour> createState() => _GuidedTourState();
}

class _GuidedTourState extends State<_GuidedTour> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    final step = _journey[_page];
    return _Explanation(label: 'A SHORT WALK THROUGH / ${_page + 1} OF ${_journey.length}',
      title: step.heading, children: [
        LinearProgressIndicator(value: (_page + 1) / _journey.length,
            backgroundColor: _sand, color: _green, minHeight: 5),
        const SizedBox(height: 26),
        Align(alignment: Alignment.centerLeft, child: Icon(step.icon, size: 42, color: _blue)),
        const SizedBox(height: 20), Text(step.body), const SizedBox(height: 22),
        _Tags(step.tags), const SizedBox(height: 26),
        Wrap(spacing: 12, runSpacing: 12, children: [
          OutlinedButton(onPressed: _page == 0 ? null : () => setState(() => _page--),
              child: const Text('← Back')),
          FilledButton(onPressed: () {
            if (_page == _journey.length - 1) { Navigator.pop(context); }
            else { setState(() => _page++); }
          }, child: Text(_page == _journey.length - 1 ? 'Explore on your own ↗' : 'Continue →')),
        ]),
      ]);
  }
}

class _Persona {
  const _Persona(this.role, this.title, this.description, this.field, this.tags, this.community, this.icon);
  final String role, title, description, field, community;
  final List<String> tags;
  final IconData icon;
}

const _personas = [
  _Persona('Academicians', 'Give your expertise a wider world.',
      'Find research partners, industry exposure and academic development aligned with your work.',
      'Research', ['Research methods', 'Artificial intelligence', 'Sustainability'],
      'What changes when we take a research question outside the laboratory? '
          'Exploring how field experience can reshape our methods.', Icons.biotech_outlined),
  _Persona('Students', 'Turn curiosity into a direction.',
      'Map your skills, understand what is missing and discover learning, internships and early careers.',
      'Student', ['Software development', 'Artificial intelligence', 'Data analysis'],
      'Sharing what our first real-world dataset taught us that the tutorial did not.', Icons.school_outlined),
  _Persona('Faculty', 'Keep teaching connected to practice.',
      'Explore faculty development, industry learning and peers working on similar teaching challenges.',
      'Teaching', ['Teaching', 'Research methods', 'Data analysis'],
      'How are you bringing industry problems into the classroom without losing the fundamentals?',
      Icons.menu_book_outlined),
  _Persona('Institutions', 'Let your programmes find their people.',
      'Publish opportunities with a clear audience. Connect departments, researchers and industry partners.',
      'Institution', ['Teaching', 'Research methods', 'Sustainability'],
      'Opening a conversation on cross-department research and the questions we could answer together.',
      Icons.account_balance_outlined),
  _Persona('Industries', 'Find the expertise behind the profile.',
      'Share skill requirements, hire talent and connect practical challenges with academic expertise.',
      'Industry', ['Software development', 'Artificial intelligence', 'Sustainability'],
      'A field problem worth sharing: how can smaller factories measure energy use more effectively?',
      Icons.business_outlined),
  _Persona('Organizers', 'Reach the people it was made for.',
      'Describe your programme, its field and intended participants. Make discovery more relevant.',
      'Organizer', ['Teaching', 'Data analysis', 'Artificial intelligence'],
      'What makes a workshop genuinely useful after the event is over? Gathering perspectives from participants.',
      Icons.event_outlined),
];

const _keywords = ['Artificial intelligence', 'Research methods', 'Sustainability',
  'Teaching', 'Software development', 'Data analysis'];

class _Listing {
  const _Listing(this.title, this.type, this.host, this.source, this.tags, this.summary);
  final String title, type, host, source, summary;
  final List<String> tags;
}

const _listings = [
  _Listing('Responsible AI, across disciplines', 'Research collaboration', 'Example Research Collective',
      'Research', ['Artificial intelligence', 'Research methods', 'Data analysis'],
      'An illustrative call for researchers to shape an interdisciplinary study of responsible AI.'),
  _Listing('From energy data to field insight', 'Industry research partnership', 'Example Energy Lab',
      'Research', ['Sustainability', 'Data analysis', 'Research methods'],
      'An example partnership connecting academic methods with a practical energy-efficiency question.'),
  _Listing('Bring research into the classroom', 'Faculty development programme', 'Example Teaching Centre',
      'Learning', ['Teaching', 'Research methods'],
      'A sample programme on connecting research practice with meaningful classroom learning.'),
  _Listing('Build useful tools with data', 'Internship', 'Example Technology Studio',
      'Hiring', ['Software development', 'Data analysis', 'Artificial intelligence'],
      'An illustrative internship involving software, data interpretation and applied machine learning.'),
  _Listing('Methods for a changing environment', 'Workshop', 'Example Sustainability School',
      'Learning', ['Sustainability', 'Research methods', 'Data analysis'],
      'A fictional hands-on workshop exploring environmental evidence and research methods.'),
  _Listing('Teach with AI, thoughtfully', 'Faculty enrichment programme', 'Example Learning Network',
      'Learning', ['Teaching', 'Artificial intelligence'],
      'A demonstration listing about evaluating AI tools for teaching and learning.'),
  _Listing('Turn prototypes into reliable systems', 'Graduate job', 'Example Engineering Studio',
      'Hiring', ['Software development', 'Artificial intelligence'],
      'A fictional early-career role in building and evaluating software systems.'),
  _Listing('Investigate low-impact materials', 'Research fellowship', 'Example Materials Institute',
      'Research', ['Sustainability', 'Research methods'],
      'An example fellowship for researchers investigating sustainable materials.'),
];

class _OpportunityType {
  const _OpportunityType(this.name, this.group, this.description, this.icon);
  final String name, group, description;
  final IconData icon;
}

const _types = [
  _OpportunityType('Research collaborations', 'Research',
      'Find researchers and industry teams exploring related questions.', Icons.biotech_outlined),
  _OpportunityType('Project partnerships', 'Research',
      'Connect complementary expertise around a shared academic or industry project.', Icons.hub_outlined),
  _OpportunityType('Fellowships & grants', 'Research',
      'Discover research support, funded fellowships and grant calls with clear eligibility.', Icons.workspace_premium_outlined),
  _OpportunityType('Publications', 'Research',
      'Find calls for papers, book chapters and relevant publication opportunities.', Icons.menu_book_outlined),
  _OpportunityType('Paper & poster presentations', 'Research',
      'Share research through calls for abstracts, papers and poster sessions.', Icons.co_present_outlined),
  _OpportunityType('Consultancies', 'Research',
      'Apply academic expertise to well-defined institutional or industry problems.', Icons.handshake_outlined),
  _OpportunityType('Faculty development · FDP', 'Development',
      'Develop teaching, technical and research capabilities through faculty-focused programmes.', Icons.school_outlined),
  _OpportunityType('Faculty programmes · FEP', 'Development',
      'Explore faculty enrichment or other FEP-labelled programmes. The host must supply '
          'the full name because the abbreviation varies between organizers.', Icons.auto_stories_outlined),
  _OpportunityType('Faculty induction · FIP', 'Development',
      'Discover induction programmes supporting entry into academic teaching and institutional life.', Icons.person_add_alt),
  _OpportunityType('Workshops', 'Development',
      'Build practical skills through focused, discipline-specific sessions.', Icons.build_outlined),
  _OpportunityType('Lectures', 'Gatherings',
      'Learn from guest lectures, invited talks and expert lecture series.', Icons.record_voice_over_outlined),
  _OpportunityType('Webinars', 'Gatherings',
      'Join online knowledge-sharing sessions relevant to your field.', Icons.videocam_outlined),
  _OpportunityType('Seminars', 'Gatherings',
      'Explore focused academic discussions and emerging research topics.', Icons.groups_outlined),
  _OpportunityType('Conferences & symposia', 'Gatherings',
      'Connect with a wider research community through themed academic meetings.', Icons.forum_outlined),
  _OpportunityType('Mentorships', 'Development',
      'Find guidance for research, skill development and academic or professional progression.', Icons.diversity_3_outlined),
  _OpportunityType('Jobs', 'Career',
      'Discover academic, research and industry positions aligned with skills and qualifications.', Icons.work_outline),
  _OpportunityType('Internships', 'Career',
      'Build experience through structured student, research or industry internships.', Icons.badge_outlined),
  _OpportunityType('Apprenticeships', 'Career',
      'Explore structured work-based learning with clearly stated terms and eligibility.', Icons.engineering_outlined),
  _OpportunityType('Traineeships', 'Career',
      'Develop role-specific capability through supervised training placements.', Icons.trending_up),
  _OpportunityType('Hackathons', 'Gatherings',
      'Work with others to solve a time-bound technical or social challenge.', Icons.code),
  _OpportunityType('Contests', 'Gatherings',
      'Discover research, innovation, design and problem-solving competitions.', Icons.emoji_events_outlined),
  _OpportunityType('Academic & industry visits', 'Gatherings',
      'Explore study tours, laboratory visits and industry exposure opportunities.', Icons.travel_explore),
  _OpportunityType('Expos & fests', 'Gatherings',
      'Discover academic exhibitions, innovation showcases and technical festivals.', Icons.storefront_outlined),
  _OpportunityType('Certified courses', 'Development',
      'Explore structured learning with transparent assessment and certificate details.', Icons.verified_outlined),
  _OpportunityType('Refresher & short-term programmes', 'Development',
      'Update disciplinary knowledge through refresher courses, STPs and short-term training.', Icons.update),
];

class _JourneyStep {
  const _JourneyStep(this.title, this.heading, this.body, this.tags, this.icon);
  final String title, heading, body;
  final List<String> tags;
  final IconData icon;
}

const _journey = [
  _JourneyStep('Understand', 'Begin with the person, not the feed.',
      'After role-based sign-in, a guided profile captures background, skills, interests '
          'and goals. For students and academicians, assessment helps identify both '
          'existing strengths and learning gaps.',
      ['Role', 'Background', 'Skills', 'Interests', 'Goals'], Icons.person_outline),
  _JourneyStep('Publish', 'Give every opportunity a clear address.',
      'Institutions, universities, industries and organizers publish structured offers. '
          'They define the field, keywords, target audience, requirements and dates. '
          'Community posts remain a separate publishing path for every user type.',
      ['Offer', 'Audience', 'Requirements', 'Keywords', 'Deadline'], Icons.publish_outlined),
  _JourneyStep('Connect', 'Find the useful overlap.',
      'The proposed engine connects opportunity keywords with profile information '
          'or selected interests. Eligibility and context refine the result. Users can '
          'inspect why a connection appears instead of trusting an unexplained score.',
      ['Profile matches', 'Interest matches', 'Eligibility', 'Match explanation'], Icons.join_inner),
  _JourneyStep('Engage', 'Turn discovery into a next step.',
      'Users inspect details, save relevant opportunities and follow the appropriate '
          'registration, application or collaboration route. The proposed product '
          'tracks supported status updates and sends timely notifications.',
      ['Inspect', 'Save', 'Apply / register', 'Track', 'Notifications'], Icons.near_me_outlined),
  _JourneyStep('Grow', 'Let progress become part of the profile.',
      'Completed learning, participation and contributions can build a digital '
          'portfolio. Verification needs evidence and host confirmation; it is not '
          'automatic. Shared demand signals help users consider what to learn next.',
      ['Evidence', 'Portfolio', 'Skill gaps', 'Demand signals', 'Next direction'], Icons.eco_outlined),
];
