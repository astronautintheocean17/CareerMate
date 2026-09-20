// ============================================================================
//  CareerMate — Pre-Product Explainer App
//  SIH26044 · Team Tech Vectors
//  Single-file Flutter MVP · 2026
// Authors: Astronautintheocean x Claude
// ============================================================================


import 'package:flutter/material.dart';

const String _kIcon = 'assets/icons/careermate-icon.png';
const String _kArt = 'assets/images/careermates-philosophy-art-1.jpeg';
const double _pi = 3.141592653589793;

class CM {
  CM._();
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF1A4FD6);
  static const Color blueDeep = Color(0xFF0B2580);
  static const Color blueSoft = Color(0xFFE8EEFD);
  static const Color ink = Color(0xFF0A0F1F);
  static const Color inkSoft = Color(0xFF151C33);
  static const Color sandal = Color(0xFFE7D8BD);
  static const Color sandalDeep = Color(0xFFC6AB7C);
  static const Color sandalInk = Color(0xFF8B6D3A);
  static const Color sandalSoft = Color(0xFFF7F1E5);
  static const Color green = Color(0xFF12A46A);
  static const Color greenDeep = Color(0xFF0A7A4D);
  static const Color greenSoft = Color(0xFFE1F5EA);
  static const Color text2 = Color(0xA60A0F1F);
  static const Color text3 = Color(0x730A0F1F);
  static const Color line = Color(0x1A0A0F1F);
}

double _sin(double x) {
  x = x - 2 * _pi * (x / (2 * _pi)).round();
  final x2 = x * x;
  return x *
      (1 -
          x2 / 6 *
              (1 -
                  x2 / 20 *
                      (1 - x2 / 42 * (1 - x2 / 72 * (1 - x2 / 110 * (1 - x2 / 156))))));
}

double _cos(double x) => _sin(x + _pi / 2);
double _pad(double w) => w < 600 ? 18 : (w < 1000 ? 32 : 48);

TextStyle _ts(double size,
        {FontWeight w = FontWeight.w500,
        Color c = CM.ink,
        double? h,
        double? ls,
        FontStyle? st}) =>
    TextStyle(fontSize: size, fontWeight: w, color: c, height: h, letterSpacing: ls, fontStyle: st);

List<BoxShadow> _sh([double a = .08, double blur = 28, double dy = 10]) =>
    [BoxShadow(color: CM.ink.withValues(alpha: a), blurRadius: blur, offset: Offset(0, dy))];

class _Role {
  const _Role(this.name, this.short, this.icon, this.color, this.tagline, this.gets,
      this.posts, this.kw, this.lanes);
  final String name, short, tagline;
  final IconData icon;
  final Color color;
  final List<String> gets, posts, kw;
  final List<List<String>> lanes;
}

const List<List<String>> _consumerLanes = [
  ['For You', 'Profile-based recommendations'],
  ['Niche', 'Keywords you choose'],
  ['Community', 'Posts from similar minds'],
];
const List<List<String>> _publisherLanes = [
  ['Upload', 'Programmes, events and jobs'],
  ['Reach', 'Keyword-filtered audiences'],
  ['Insights', 'Demand and outcome dashboards'],
];

const List<_Role> _roles = [
  _Role(
    'Academicians', 'Academicians', Icons.school_rounded, CM.blue,
    'Research, teaching and industry, one bridge.',
    ['FDP, FEP, FIP and refresher matches', 'Industry projects, consultancy and research partners', 'Conferences, publications and presentation calls'],
    ['Research calls and collaborations', 'Community posts to peers with matching niches'],
    ['Pedagogy', 'Research Methods', 'AI in Education', 'NEP 2020'],
    _consumerLanes,
  ),
  _Role(
    'Students', 'Students', Icons.person_rounded, CM.green,
    'Know the gap. Close the gap. Show the proof.',
    ['A skill-gap map against live industry demand', 'Internships, apprenticeships and traineeships', 'Hackathons, workshops and certified courses'],
    ['Project showcases and achievements', 'Team calls for hackathons'],
    ['Python', 'Data Analysis', 'Hackathons', 'UI / UX'],
    _consumerLanes,
  ),
  _Role(
    'Faculty & Mentors', 'Faculty', Icons.cast_for_education_rounded, CM.sandalInk,
    'Teach, guide and stay current.',
    ['Guest-lecture and mentoring invitations', 'Faculty growth programmes and refreshers', 'Mentee matching by niche'],
    ['Lectures and webinars', 'Mentorship openings'],
    ['Mentoring', 'Curriculum Design', 'Guest Lectures', 'Assessment'],
    _consumerLanes,
  ),
  _Role(
    'Institutions', 'Institutions', Icons.apartment_rounded, CM.inkSoft,
    'Publish once. Reach exactly the right people.',
    ['Upload programmes, workshops and fests', 'Filtered reach to matching profiles', 'Placement and outcome dashboards'],
    ['FDP, FIP, STP and workshops', 'Hackathons, expos and symposia', 'Placement drives'],
    ['Accreditation', 'Placements', 'Outreach', 'Partnerships'],
    _publisherLanes,
  ),
  _Role(
    'Industries', 'Industries', Icons.business_rounded, CM.blueDeep,
    'Find skill-matched people and academic partners.',
    ['Skill-matched candidates to hire', 'Academic partners for R&D and consultancy', 'Live demand analytics'],
    ['Jobs, internships and apprenticeships', 'Consultancy and project calls', 'Guest lectures and workshops'],
    ['Hiring', 'R&D', 'Consultancy', 'Upskilling'],
    _publisherLanes,
  ),
];

class _Fact {
  const _Fact(this.title, this.value, this.decimals, this.suffix, this.problem, this.answer, this.ref, this.icon);
  final String title, suffix, problem, answer;
  final double value;
  final int decimals, ref;
  final IconData icon;
}

const List<_Fact> _facts = [
  _Fact('Opportunity access', 55.6, 1, '%', 'report limited internship exposure in their colleges.', 'Connects students directly with live opportunities.', 10, Icons.explore_rounded),
  _Fact('Industry skill alignment', 63, 0, '%', 'of employers report skill gaps as a major barrier.', 'Drives skill development from industry demand.', 3, Icons.query_stats_rounded),
  _Fact('Career readiness', 42.6, 1, '%', 'of graduates who apply are overall employable.', 'Builds skills, experience and verified portfolios.', 4, Icons.workspace_premium_rounded),
  _Fact('Academia–industry link', 51.67, 2, '%', 'of researchers show low research–industry participation.', 'Enables direct collaboration, one connect away.', 5, Icons.handshake_rounded),
  _Fact('Future-ready skills', 39, 0, '%', 'of core skills may change by 2030.', 'Continuously shares what industry demands next.', 3, Icons.autorenew_rounded),
  _Fact('Stronger career pathways', 72, 0, '%', 'of India\'s unemployed are youth.', 'Strengthens pathways from learning to livelihood.', 2, Icons.trending_up_rounded),
];

class _Kind {
  const _Kind(this.name, this.g, this.icon, this.by, this.to, this.fmt, this.kw, this.line);
  final String name, by, to, fmt, line;
  final int g;
  final IconData icon;
  final List<String> kw;
}

const List<String> _groups = ['Careers', 'Faculty growth', 'Learning', 'Events & contests', 'Research & collaboration'];
const List<Color> _groupColors = [CM.blue, CM.green, CM.sandalInk, CM.inkSoft, CM.blueDeep];

const List<_Kind> _kinds = [
  _Kind('Jobs', 0, Icons.work_rounded, 'Industries', 'Students · Academicians', 'Full-time · Part-time · Contract', ['Skill match', 'Hiring'], 'Roles filtered to verified skill keywords.'),
  _Kind('Internships', 0, Icons.badge_rounded, 'Industries', 'Students', '1–6 months · Remote or on-site', ['Python', 'Analytics'], 'Real projects that land in your portfolio.'),
  _Kind('Apprenticeships', 0, Icons.construction_rounded, 'Industries', 'Students · Diploma and degree', 'Structured · On-the-job', ['Embedded', 'Manufacturing'], 'Learn on the floor, earn a credential.'),
  _Kind('Traineeships', 0, Icons.school_rounded, 'Industries · Institutions', 'Fresh graduates', 'Guided entry programme', ['Onboarding', 'Domain skills'], 'A guided first step into a profession.'),
  _Kind('Faculty Development (FDP)', 1, Icons.cast_for_education_rounded, 'Institutions', 'Academicians · Faculty', '5–15 days', ['Pedagogy', 'NEP 2020'], 'Upskill teaching and research practice.'),
  _Kind('Faculty Enablement (FEP)', 1, Icons.bolt_rounded, 'Institutions · Industries', 'Faculty', '3–10 days', ['EdTech', 'Industry tools'], 'Equip faculty with current tools and methods.'),
  _Kind('Faculty Induction (FIP)', 1, Icons.how_to_reg_rounded, 'Institutions', 'New faculty', 'About 4 weeks', ['Onboarding', 'Teaching basics'], 'A structured start for new faculty.'),
  _Kind('Refresher Courses', 1, Icons.autorenew_rounded, 'Institutions', 'Faculty', 'About 2 weeks', ['Subject updates', 'Research'], 'Stay current in your discipline.'),
  _Kind('Short-Term Programmes', 1, Icons.timer_rounded, 'Institutions', 'Faculty · Researchers', '5–8 days', ['Emerging topics'], 'Focused, quick-turnaround skilling.'),
  _Kind('Workshops', 2, Icons.build_circle_rounded, 'Institutions · Industries', 'Everyone', '1–6 days · Hands-on', ['Hands-on', 'Tools'], 'Field-specific, practice-first sessions.'),
  _Kind('Guest Lectures', 2, Icons.mic_rounded, 'Industries · Institutions', 'Students · Faculty', '1–2 hours', ['Expert talk'], 'Practitioners bring the field to the room.'),
  _Kind('Webinars', 2, Icons.videocam_rounded, 'Everyone', 'Everyone', 'Online · Live or recorded', ['Online', 'Open access'], 'Learn from anywhere, on your schedule.'),
  _Kind('Seminars', 2, Icons.groups_rounded, 'Institutions', 'Academicians · Students', 'Half-day to 2 days', ['Discussion', 'Research'], 'Focused academic discussion on one theme.'),
  _Kind('Certified Courses', 2, Icons.workspace_premium_rounded, 'Institutions · Industries', 'Students · Faculty', 'Weeks · Certificate', ['Certification'], 'Credentials that carry into your portfolio.'),
  _Kind('Conferences & Symposia', 3, Icons.record_voice_over_rounded, 'Institutions', 'Academicians · Researchers', '1–5 days · National or international', ['Papers', 'Networking'], 'Present, publish and meet your field.'),
  _Kind('Hackathons', 3, Icons.code_rounded, 'Institutions · Industries', 'Students', '24–48 hours', ['Build', 'Teams'], 'Build against a real problem, fast.'),
  _Kind('Contests & Challenges', 3, Icons.emoji_events_rounded, 'Institutions · Industries', 'Students', 'Rounds over days', ['Competition'], 'Prove skill in structured competition.'),
  _Kind('Expos & Fests', 3, Icons.storefront_rounded, 'Institutions', 'Everyone', '1–3 days', ['Showcase', 'Outreach'], 'Showcase work and meet the ecosystem.'),
  _Kind('Industrial Tours', 3, Icons.tour_rounded, 'Institutions · Industries', 'Students', 'Day visits', ['Exposure'], 'See how the industry actually operates.'),
  _Kind('Project Partnerships', 4, Icons.handshake_rounded, 'Industries · Institutions', 'Academicians · Students', 'Milestone-based', ['Co-build', 'Applied'], 'Partners on real, scoped projects.'),
  _Kind('Research Collaborations', 4, Icons.science_rounded, 'Institutions · Industries', 'Academicians', 'Multi-month', ['Joint research'], 'Find co-investigators across institutions.'),
  _Kind('Publications & Presentations', 4, Icons.menu_book_rounded, 'Institutions', 'Researchers', 'Call-for-papers cycles', ['Papers', 'Journals'], 'Calls for papers and presentation slots.'),
  _Kind('Consultancy', 4, Icons.support_agent_rounded, 'Industries', 'Academicians', 'Engagement-based', ['Advisory', 'Expertise'], 'Put academic expertise to work in industry.'),
  _Kind('Fellowships & Grants', 4, Icons.paid_rounded, 'Institutions · Industries', 'Researchers · Students', 'Application cycles', ['Funding'], 'Funding calls matched to your niche.'),
];

class _Opp {
  const _Opp(this.title, this.org, this.type, this.kw, this.icon);
  final String title, org, type;
  final List<String> kw;
  final IconData icon;
}

const List<String> _kwOptions = ['Machine Learning', 'Python', 'Pedagogy', 'NEP 2020', 'AI Tools', 'Research Writing', 'Data Analysis', 'IoT', 'Robotics', 'Cybersecurity', 'Public Policy', 'Leadership'];

const List<_Opp> _opps = [
  _Opp('NEP-Aligned Pedagogy FDP', 'Central University · Dept. of Education', 'FDP', ['Pedagogy', 'NEP 2020', 'AI Tools'], Icons.cast_for_education_rounded),
  _Opp('AI in Research Methods, 5-day Workshop', 'Technical Institute', 'Workshop', ['Machine Learning', 'Research Writing', 'Python'], Icons.build_circle_rounded),
  _Opp('Data Science Internship (Remote)', 'Industry Partner · Analytics', 'Internship', ['Python', 'Data Analysis', 'Machine Learning'], Icons.badge_rounded),
  _Opp('Faculty Induction Programme, Batch 12', 'Teacher Training Centre', 'FIP', ['Pedagogy', 'Leadership'], Icons.how_to_reg_rounded),
  _Opp('Smart Campus Hackathon', 'Engineering College', 'Hackathon', ['IoT', 'Robotics', 'Python'], Icons.code_rounded),
  _Opp('Cybersecurity Guest Lecture Series', 'Industry Partner · Security', 'Lecture', ['Cybersecurity', 'Networks'], Icons.mic_rounded),
  _Opp('Joint Research: Climate Analytics', 'Research Institute', 'Collaboration', ['Data Analysis', 'Machine Learning', 'Climate'], Icons.science_rounded),
  _Opp('Public Policy Symposium', 'University School of Policy', 'Symposium', ['Public Policy', 'Research Writing'], Icons.record_voice_over_rounded),
  _Opp('Consultancy: IoT Retrofit', 'Manufacturing Partner', 'Consultancy', ['IoT', 'Robotics'], Icons.support_agent_rounded),
  _Opp('Apprenticeship: Embedded Systems', 'Industry Partner · Electronics', 'Apprenticeship', ['IoT', 'Robotics', 'Embedded'], Icons.construction_rounded),
];

class _Post {
  const _Post(this.name, this.role, this.text, this.tags, this.reach);
  final String name, role, text, reach;
  final List<String> tags;
}

const List<_Post> _posts = [
  _Post('Dr. Meera Iyer', 'Academician', 'Seeking co-authors for a paper on adaptive assessment in NEP-aligned classrooms.', ['Pedagogy', 'Research Writing'], '1.2k'),
  _Post('Nova Labs', 'Industry', 'Open mentorship slots for students building IoT prototypes this semester.', ['IoT', 'Robotics'], '860'),
  _Post('Ananya S.', 'Student', 'Our team placed top-3 at a campus hackathon. Building a data dashboard next.', ['Python', 'Data Analysis'], '540'),
];

class _Dem {
  const _Dem(this.k, this.v, this.d);
  final String k;
  final int v, d;
}

const Map<String, List<_Dem>> _demand = {
  'All domains': [_Dem('Generative AI', 92, 38), _Dem('Python', 88, 12), _Dem('Data Analysis', 81, 15), _Dem('NEP 2020', 76, 25), _Dem('Cybersecurity', 72, 21), _Dem('Machine Learning', 69, 17)],
  'Tech': [_Dem('Python', 88, 12), _Dem('Cloud Computing', 84, 18), _Dem('Cybersecurity', 79, 21), _Dem('Full-Stack Dev', 71, 9), _Dem('Embedded & IoT', 66, 14), _Dem('DevOps', 62, 16)],
  'Research': [_Dem('Research Methods', 84, 11), _Dem('AI for Science', 79, 27), _Dem('Scientific Writing', 72, 8), _Dem('Data Visualisation', 66, 10), _Dem('Grant Writing', 61, 14), _Dem('Open Science', 55, 19)],
  'Teaching': [_Dem('NEP 2020', 90, 25), _Dem('EdTech Tools', 82, 20), _Dem('Outcome-Based Education', 78, 9), _Dem('Blended Pedagogy', 68, 11), _Dem('Assessment Design', 60, 7), _Dem('Mentoring', 57, 6)],
  'Business': [_Dem('Business Analytics', 80, 16), _Dem('Product Management', 74, 13), _Dem('Entrepreneurship', 69, 12), _Dem('ESG & Sustainability', 63, 22), _Dem('Digital Marketing', 58, 7), _Dem('Finance Analytics', 54, 10)],
};

class _Ref {
  const _Ref(this.n, this.source, this.claim, this.link);
  final int n;
  final String source, claim, link;
}

const List<_Ref> _refs = [
  _Ref(1, 'Journal of Environmental Management, 2026 · DOI 10.1016/j.jenvman.2026.130322', 'Higher-education ↔ industry skill-alignment and collaboration gap.', 'https://www.sciencedirect.com/science/article/pii/S0301479726017822?via%3Dihub'),
  _Ref(2, 'World Bank, 2026 · India Skills & Jobs Program', '72% of India\'s unemployed are youth.', 'https://www.worldbank.org/en/news/press-release/2026/02/02/world-bank-supports-india-s-ambitious-skills-program-to-better-prepare-youth-for-the-job-market'),
  _Ref(3, 'World Economic Forum, 2025 · Future of Jobs Report', '63% cite skill gaps as a major barrier; 39% of workers\' core skills expected to change by 2030.', 'https://www.weforum.org/publications/the-future-of-jobs-report-2025/'),
  _Ref(4, 'Mercer | Mettl · India\'s Graduate Skill Index 2025', '42.6% of Indian graduates who apply for jobs are overall employable.', 'https://www.mercer.com/insights/talent-and-transformation/talent-assessment/indias-graduate-skill-index-2025/'),
  _Ref(5, 'Journal of Extension Education, 2025 · DOI 10.26725/JEE.2023.4.35.7134-7140', '51.67% of university researchers showed low participation in university–industry activities in the studied AP sectors.', 'https://extensioneducation.org/index.php/jee/article/view/1711'),
  _Ref(6, 'Ministry of Labour & Employment · National Career Service, 2025', '1.45Cr+ new jobseekers and 17L+ new employers registered in FY 2024–25.', 'https://www.labour.gov.in/static/uploads/2025/09/9893bb5a589c16cca8f36e513a94945b.pdf'),
  _Ref(7, 'SWAYAM Plus · Ministry of Education & IIT Madras', '6.6L+ learners, 500+ courses and 77 industry partners.', 'https://swayamplus.education.gov.in'),
  _Ref(8, 'AICTE · National Internship Portal', '79.5L+ internships from 83K+ companies.', 'https://internship.aicte-india.org/internships?mode=Remote'),
  _Ref(9, 'Internshala · Hire Talent', '32M+ candidate profiles and 250K+ Indian companies.', 'https://internshala.com/hire-talent/'),
  _Ref(10, 'The New Indian Express, 2023', '55.6% of surveyed Tier II students said their colleges lacked sufficient internships or industry projects.', 'https://www.newindianexpress.com/cities/bengaluru/2023/Nov/26/over-50-students-in-tier-ii-cities-in-india-say-not-enough-job-opportunities-2636226.html'),
];

class _PageScope extends InheritedWidget {
  const _PageScope({required this.controller, required super.child});
  final ScrollController controller;
  static ScrollController? of(BuildContext c) =>
      c.dependOnInheritedWidgetOfExactType<_PageScope>()?.controller;
  @override
  bool updateShouldNotify(_PageScope old) => controller != old.controller;
}

class _Reveal extends StatefulWidget {
  const _Reveal({required this.builder, this.delay = 0});
  final Widget Function(BuildContext context, bool shown) builder;
  final int delay;
  @override
  State<_Reveal> createState() => _RevealState();
}

class _RevealState extends State<_Reveal> {
  bool _shown = false;
  bool _queued = false;
  ScrollController? _sc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final sc = _PageScope.of(context);
    if (!identical(sc, _sc)) {
      _sc?.removeListener(_check);
      _sc = sc;
      _sc?.addListener(_check);
    }
    if (sc == null) _shown = true;
  }

  @override
  void dispose() {
    _sc?.removeListener(_check);
    super.dispose();
  }

  void _check() {
    if (!mounted || _shown || _queued) return;
    final ro = context.findRenderObject();
    if (ro is! RenderBox || !ro.attached || !ro.hasSize) return;
    final top = ro.localToGlobal(Offset.zero).dy;
    if (top < MediaQuery.sizeOf(context).height * 0.9) {
      _queued = true;
      Future<void>.delayed(Duration(milliseconds: widget.delay), () {
        if (mounted) setState(() => _shown = true);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_shown) WidgetsBinding.instance.addPostFrameCallback((_) => _check());
    return widget.builder(context, _shown);
  }
}

Widget _rv(Widget child, {int delay = 0}) => _Reveal(
      delay: delay,
      builder: (c, s) => AnimatedOpacity(
        opacity: s ? 1 : 0,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: s ? Offset.zero : const Offset(0, .04),
          duration: const Duration(milliseconds: 650),
          curve: Curves.easeOutCubic,
          child: child,
        ),
      ),
    );


class _Logo extends StatelessWidget {
  const _Logo({super.key, this.size = 40});
  final double size;
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(size * .24),
        child: Image.asset(
          _kIcon,
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (c, e, s) => Container(
            width: size,
            height: size,
            color: CM.blue,
            alignment: Alignment.center,
            child: Text('C', style: _ts(size * .5, w: FontWeight.w800, c: CM.white)),
          ),
        ),
      );
}

class _Pill extends StatelessWidget {
  const _Pill(this.label, {this.icon, this.bg = CM.blueSoft, this.fg = CM.blue, this.small = false});
  final String label;
  final IconData? icon;
  final Color bg, fg;
  final bool small;
  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: small ? 9 : 12, vertical: small ? 4 : 7),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(100)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[Icon(icon, size: small ? 12 : 14, color: fg), const SizedBox(width: 6)],
          Flexible(
            child: Text(label,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: _ts(small ? 10.5 : 11.5, w: FontWeight.w800, c: fg, ls: .6)),
          ),
        ]),
      );
}

class _IconBadge extends StatelessWidget {
  const _IconBadge(this.icon, this.color, {this.size = 42});
  final IconData icon;
  final Color color;
  final double size;
  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color.withValues(alpha: .12), borderRadius: BorderRadius.circular(size * .3)),
        child: Icon(icon, color: color, size: size * .5),
      );
}

class _Tap extends StatelessWidget {
  const _Tap({required this.child, required this.onTap, this.radius = 14});
  final Widget child;
  final VoidCallback? onTap;
  final double radius;
  @override
  Widget build(BuildContext context) => Material(
        type: MaterialType.transparency,
        child: InkWell(borderRadius: BorderRadius.circular(radius), onTap: onTap, child: child),
      );
}

class _Lift extends StatefulWidget {
  const _Lift({
    required this.child,
    this.onTap,
    this.color = CM.white,
    this.radius = 22,
    this.padding = const EdgeInsets.all(20),
    this.border,
    this.shadow = true,
  });
  final Widget child;
  final VoidCallback? onTap;
  final Color color;
  final double radius;
  final EdgeInsets padding;
  final Color? border;
  final bool shadow;
  @override
  State<_Lift> createState() => _LiftState();
}

class _LiftState extends State<_Lift> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final r = BorderRadius.circular(widget.radius);
    final lift = _h && widget.onTap != null;
    return MouseRegion(
      cursor: widget.onTap == null ? MouseCursor.defer : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, lift ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: r,
          border: Border.all(color: widget.border ?? CM.line),
          boxShadow: widget.shadow ? _sh(lift ? .14 : .06, lift ? 36 : 24, lift ? 16 : 8) : null,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            borderRadius: r,
            onTap: widget.onTap,
            child: Padding(padding: widget.padding, child: widget.child),
          ),
        ),
      ),
    );
  }
}

enum _BK { primary, ghost, sandal, dark, outlineLight }

class _Btn extends StatelessWidget {
  const _Btn(this.label, {required this.onTap, this.icon, this.kind = _BK.primary, this.expand = false, this.small = false});
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final _BK kind;
  final bool expand, small;
  @override
  Widget build(BuildContext context) {
    late Color bg, fg, bd;
    switch (kind) {
      case _BK.primary:
        bg = CM.blue; fg = CM.white; bd = CM.blue;
      case _BK.ghost:
        bg = Colors.transparent; fg = CM.ink; bd = CM.ink.withValues(alpha: .22);
      case _BK.sandal:
        bg = CM.sandal; fg = CM.ink; bd = CM.sandal;
      case _BK.dark:
        bg = CM.ink; fg = CM.white; bd = CM.ink;
      case _BK.outlineLight:
        bg = Colors.transparent; fg = CM.white; bd = CM.white.withValues(alpha: .35);
    }
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(small ? 12 : 16), side: BorderSide(color: bd));
    return Material(
      color: bg,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        customBorder: shape,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: small ? 14 : 22, vertical: small ? 10 : 15),
          child: Row(
            mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[Icon(icon, size: small ? 16 : 18, color: fg), const SizedBox(width: 8)],
              Flexible(child: Text(label, textAlign: TextAlign.center, style: _ts(small ? 13 : 14.5, w: FontWeight.w700, c: fg))),
            ],
          ),
        ),
      ),
    );
  }
}

class _SelChip extends StatelessWidget {
  const _SelChip(this.label, {required this.selected, required this.onTap, this.icon, this.dark = false, this.small = false});
  final String label;
  final bool selected, dark, small;
  final VoidCallback onTap;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final bg = selected ? (dark ? CM.sandal : CM.blue) : (dark ? CM.white.withValues(alpha: .06) : CM.white);
    final fg = selected ? (dark ? CM.ink : CM.white) : (dark ? CM.white.withValues(alpha: .85) : CM.ink);
    final bd = selected ? (dark ? CM.sandal : CM.blue) : (dark ? CM.white.withValues(alpha: .16) : CM.line);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(100), border: Border.all(color: bd)),
        child: _Tap(
          radius: 100,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: small ? 10 : 15, vertical: small ? 6 : 9),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              if (icon != null) ...[Icon(icon, size: small ? 13 : 15, color: fg), const SizedBox(width: 6)],
              Flexible(child: Text(label, style: _ts(small ? 11.5 : 13, w: FontWeight.w700, c: fg))),
            ]),
          ),
        ),
      ),
    );
  }
}

class _Sec extends StatelessWidget {
  const _Sec({super.key, required this.child, this.bg, this.gradient, this.vPad = 88});
  final Widget child;
  final Color? bg;
  final Gradient? gradient;
  final double vPad;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: bg, gradient: gradient),
      padding: EdgeInsets.symmetric(vertical: w < 600 ? vPad * .62 : vPad),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: _pad(w)), child: child),
        ),
      ),
    );
  }
}

class _Head extends StatelessWidget {
  const _Head({required this.kicker, required this.title, this.sub, this.dark = false, this.center = false});
  final String kicker, title;
  final String? sub;
  final bool dark, center;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final size = w < 600 ? 28.0 : (w < 1000 ? 36.0 : 44.0);
    return Column(
      crossAxisAlignment: center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        _Pill(kicker, bg: dark ? CM.sandal.withValues(alpha: .14) : CM.sandalSoft, fg: dark ? CM.sandal : CM.sandalInk),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 860),
          child: Text(title,
              textAlign: center ? TextAlign.center : TextAlign.start,
              style: _ts(size, w: FontWeight.w800, c: dark ? CM.white : CM.ink, h: 1.1, ls: -1)),
        ),
        if (sub != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Text(sub!,
                textAlign: center ? TextAlign.center : TextAlign.start,
                style: _ts(16, c: dark ? CM.sandal.withValues(alpha: .85) : CM.text2, h: 1.5)),
          ),
        ],
      ],
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({super.key, required this.children, this.minTile = 260, this.gap = 16, this.maxCols = 6});
  final List<Widget> children;
  final double minTile, gap;
  final int maxCols;
  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) return const SizedBox.shrink();
    return LayoutBuilder(builder: (c, b) {
      final w = b.maxWidth;
      var cols = ((w + gap) / (minTile + gap)).floor();
      if (cols < 1) cols = 1;
      if (cols > maxCols) cols = maxCols;
      if (cols > children.length) cols = children.length;
      final tw = ((w - gap * (cols - 1)) / cols).floorToDouble();
      return Wrap(spacing: gap, runSpacing: gap, children: [for (final ch in children) SizedBox(width: tw, child: ch)]);
    });
  }
}

class _Adaptive extends StatelessWidget {
  const _Adaptive({required this.children, this.at = 720, this.gap = 20, this.flex});
  final List<Widget> children;
  final double at, gap;
  final List<int>? flex;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (c, b) {
        if (b.maxWidth >= at) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (var i = 0; i < children.length; i++) ...[
              if (i > 0) SizedBox(width: gap),
              Expanded(flex: flex != null ? flex![i] : 1, child: children[i]),
            ],
          ]);
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0) SizedBox(height: gap),
            children[i],
          ],
        ]);
      });
}

Widget _switcher(Widget child, Object key) => AnimatedSwitcher(
      duration: const Duration(milliseconds: 320),
      switchInCurve: Curves.easeOutCubic,
      layoutBuilder: (cur, prev) => Stack(alignment: Alignment.topLeft, children: [...prev, if (cur != null) cur]),
      child: KeyedSubtree(key: ValueKey(key), child: SizedBox(width: double.infinity, child: child)),
    );

class _CountUp extends StatelessWidget {
  const _CountUp({required this.value, required this.style, this.decimals = 0, this.suffix = '', this.run = true});
  final double value;
  final int decimals;
  final String suffix;
  final TextStyle style;
  final bool run;
  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: run ? value : 0),
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeOutCubic,
        builder: (c, v, _) => Text('${v.toStringAsFixed(decimals)}$suffix', style: style),
      );
}

class _Row {
  const _Row(this.label, this.text);
  final String label, text;
}

class _PanelShell extends StatelessWidget {
  const _PanelShell({required this.child, required this.sheet});
  final Widget child;
  final bool sheet;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.sizeOf(context).height;
    final bottom = MediaQuery.viewPaddingOf(context).bottom;
    final br = sheet ? const BorderRadius.vertical(top: Radius.circular(28)) : BorderRadius.circular(28);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: h * (sheet ? .92 : .86), maxWidth: 580),
      child: DecoratedBox(
        decoration: BoxDecoration(borderRadius: br, boxShadow: _sh(.25, 60, 20)),
        child: Material(
          color: CM.white,
          borderRadius: br,
          clipBehavior: Clip.antiAlias,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            if (sheet)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(width: 44, height: 4, decoration: BoxDecoration(color: CM.line, borderRadius: BorderRadius.circular(4))),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.close_rounded, color: CM.text2)),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 28 + (sheet ? bottom : 0)),
                child: SizedBox(width: double.infinity, child: child),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

Future<void> _openPanel(BuildContext context, WidgetBuilder builder) {
  final w = MediaQuery.sizeOf(context).width;
  if (w < 700) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      builder: (c) => _PanelShell(sheet: true, child: builder(c)),
    );
  }
  return showDialog<void>(
    context: context,
    builder: (c) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.all(24),
      child: _PanelShell(sheet: false, child: builder(c)),
    ),
  );
}

class _InfoBody extends StatelessWidget {
  const _InfoBody({required this.icon, required this.color, required this.kicker, required this.title, this.lead, this.rows = const [], this.chips = const [], this.note});
  final IconData icon;
  final Color color;
  final String kicker, title;
  final String? lead, note;
  final List<_Row> rows;
  final List<String> chips;
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
        _IconBadge(icon, color, size: 52),
        const SizedBox(height: 16),
        Text(kicker.toUpperCase(), style: _ts(11, w: FontWeight.w800, c: color, ls: 1.2)),
        const SizedBox(height: 6),
        Text(title, style: _ts(24, w: FontWeight.w800, h: 1.15, ls: -.4)),
        if (lead != null) ...[const SizedBox(height: 10), Text(lead!, style: _ts(15.5, c: CM.text2, h: 1.5))],
        for (final r in rows) ...[
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(r.label.toUpperCase(), style: _ts(10.5, w: FontWeight.w800, c: CM.sandalInk, ls: 1)),
              const SizedBox(height: 6),
              Text(r.text, style: _ts(14.5, h: 1.55)),
            ]),
          ),
        ],
        if (chips.isNotEmpty) ...[
          const SizedBox(height: 16),
          Wrap(spacing: 8, runSpacing: 8, children: [for (final c in chips) _Pill(c)]),
        ],
        if (note != null) ...[const SizedBox(height: 16), Text(note!, style: _ts(12, c: CM.text3, h: 1.4))],
      ]);
}

void _openInfo(BuildContext context, {required IconData icon, required Color color, required String kicker, required String title, String? lead, List<_Row> rows = const [], List<String> chips = const [], String? note}) {
  _openPanel(context, (c) => _InfoBody(icon: icon, color: color, kicker: kicker, title: title, lead: lead, rows: rows, chips: chips, note: note));
}

void _openRole(BuildContext context, int i) {
  final r = _roles[i];
  _openInfo(context,
      icon: r.icon,
      color: r.color,
      kicker: 'Priority ${i + 1} · ${r.short}',
      title: r.name,
      lead: r.tagline,
      rows: [
        _Row('What you get', r.gets.map((e) => '• $e').join('\n')),
        _Row('What you post', r.posts.map((e) => '• $e').join('\n')),
        _Row('Home lanes', r.lanes.map((l) => l[0]).join('  ·  ')),
      ],
      chips: r.kw);
}

void _openRefs(BuildContext context, {int? highlight}) {
  _openPanel(context, (c) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const _IconBadge(Icons.menu_book_rounded, CM.blue, size: 52),
        const SizedBox(height: 16),
        Text('RESEARCH AND REFERENCES', style: _ts(11, w: FontWeight.w800, c: CM.blue, ls: 1.2)),
        const SizedBox(height: 6),
        Text('Where the numbers come from', style: _ts(24, w: FontWeight.w800, ls: -.4)),
        const SizedBox(height: 14),
        for (final r in _refs)
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: r.n == highlight ? CM.blueSoft : CM.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: r.n == highlight ? CM.blue : CM.line, width: r.n == highlight ? 1.5 : 1),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('[${r.n}]  ${r.source}', style: _ts(13, w: FontWeight.w800, h: 1.35)),
              const SizedBox(height: 4),
              Text(r.claim, style: _ts(13, c: CM.text2, h: 1.45)),
              const SizedBox(height: 6),
              SelectableText(r.link, style: _ts(11.5, c: CM.blue, h: 1.4)),
            ]),
          ),
      ]));
}

class _DotsPainter extends CustomPainter {
  const _DotsPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()..color = CM.blue.withValues(alpha: .09);
    for (double y = 14; y < size.height; y += 30) {
      for (double x = 14; x < size.width; x += 30) {
        canvas.drawCircle(Offset(x, y), 1.3, p);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}

class _OrbitPainter extends CustomPainter {
  _OrbitPainter(this.t, this.r, this.coreR);
  final double t, r, coreR;
  Offset _pos(Offset c, int i) {
    final a = -_pi / 2 + 2 * _pi * (i / _roles.length + t);
    return Offset(c.dx + r * _cos(a), c.dy + r * _sin(a));
  }

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final glow = Rect.fromCircle(center: c, radius: size.width * .48);
    canvas.drawCircle(c, size.width * .48, Paint()..shader = RadialGradient(colors: [CM.sandal.withValues(alpha: .6), CM.sandal.withValues(alpha: 0)]).createShader(glow));
    final ring = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawCircle(c, r * .6, ring..color = CM.green.withValues(alpha: .22));
    canvas.drawCircle(c, r, ring..color = CM.blue.withValues(alpha: .2));
    canvas.drawCircle(c, r * 1.27, ring..color = CM.ink.withValues(alpha: .08));
    for (var k = 0; k < 3; k++) {
      final a = 2 * _pi * (k / 3 - t * 2);
      canvas.drawCircle(Offset(c.dx + r * 1.27 * _cos(a), c.dy + r * 1.27 * _sin(a)), 3.2, Paint()..color = CM.sandalDeep);
    }
    for (var k = 0; k < 3; k++) {
      final ph = (t * 16 + k / 3) % 1.0;
      canvas.drawCircle(c, coreR + ph * (r * .5), Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..color = CM.blue.withValues(alpha: (1 - ph) * .28));
    }
    final line = Paint()
      ..strokeWidth = 1.2
      ..color = CM.blue.withValues(alpha: .14);
    for (var i = 0; i < _roles.length; i++) {
      final p = _pos(c, i);
      canvas.drawLine(c, p, line);
      final ph = (t * 24 + i * .37) % 1.0;
      canvas.drawCircle(Offset.lerp(p, c, ph)!, 3.4, Paint()..color = CM.green);
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitPainter old) => old.t != t || old.r != r;
}

class _PulsePainter extends CustomPainter {
  _PulsePainter(this.t);
  final double t;
  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    for (var k = 0; k < 3; k++) {
      final ph = (t + k / 3) % 1.0;
      final rad = 46 + ph * (size.width / 2 - 46);
      canvas.drawCircle(c, rad, Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.8
        ..color = CM.blue.withValues(alpha: (1 - ph) * .3));
    }
  }

  @override
  bool shouldRepaint(covariant _PulsePainter old) => old.t != t;
}

class _LinkPainter extends CustomPainter {
  _LinkPainter(this.t, this.vertical);
  final double t;
  final bool vertical;
  @override
  void paint(Canvas canvas, Size s) {
    final a = vertical ? Offset(s.width / 2, 0) : Offset(0, s.height / 2);
    final b = vertical ? Offset(s.width / 2, s.height) : Offset(s.width, s.height / 2);
    final len = vertical ? s.height : s.width;
    final p = Paint()
      ..color = CM.blue.withValues(alpha: .35)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    for (double d = 0; d < len; d += 9) {
      final e = d + 5 > len ? len : d + 5;
      canvas.drawLine(Offset.lerp(a, b, d / len)!, Offset.lerp(a, b, e / len)!, p);
    }
    canvas.drawCircle(Offset.lerp(a, b, t)!, 4.5, Paint()..color = CM.green);
  }

  @override
  bool shouldRepaint(covariant _LinkPainter old) => old.t != t;
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.v, this.w);
  final double v, w;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(w / 2);
    canvas.drawArc(rect, 0, 2 * _pi, false, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w
      ..color = CM.blueSoft);
    canvas.drawArc(rect, -_pi / 2, 2 * _pi * v, false, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w
      ..strokeCap = StrokeCap.round
      ..color = CM.green);
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) => old.v != v;
}

class _DonutPainter extends CustomPainter {
  _DonutPainter(this.values, this.colors, this.progress, this.selected);
  final List<double> values;
  final List<Color> colors;
  final double progress;
  final int selected;
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.shortestSide / 2 - 16);
    final total = values.fold<double>(0, (a, b) => a + b);
    var start = -_pi / 2;
    for (var i = 0; i < values.length; i++) {
      final sweep = values[i] / total * 2 * _pi * progress;
      final p = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = i == selected ? 30 : 22
        ..color = colors[i];
      canvas.drawArc(rect, start, sweep > .06 ? sweep - .04 : sweep, false, p);
      start += sweep;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutPainter old) => old.progress != progress || old.selected != selected;
}

class _SparkPainter extends CustomPainter {
  _SparkPainter(this.values, this.t);
  final List<double> values;
  final double t;
  @override
  void paint(Canvas canvas, Size s) {
    final mn = values.reduce((a, b) => a < b ? a : b);
    final mx = values.reduce((a, b) => a > b ? a : b);
    final pts = <Offset>[
      for (var i = 0; i < values.length; i++)
        Offset(s.width * i / (values.length - 1), s.height * .9 - (values[i] - mn) / (mx - mn) * s.height * .75 * t),
    ];
    final path = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (var i = 1; i < pts.length; i++) {
      final a = pts[i - 1], b = pts[i];
      final mid = (a.dx + b.dx) / 2;
      path.cubicTo(mid, a.dy, mid, b.dy, b.dx, b.dy);
    }
    final fill = Path.from(path)
      ..lineTo(s.width, s.height)
      ..lineTo(0, s.height)
      ..close();
    canvas.drawPath(fill, Paint()..shader = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [CM.green.withValues(alpha: .28), CM.green.withValues(alpha: 0)]).createShader(Offset.zero & s));
    canvas.drawPath(path, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..strokeCap = StrokeCap.round
      ..color = CM.green);
    canvas.drawCircle(pts.last, 5, Paint()..color = CM.white);
    canvas.drawCircle(pts.last, 5, Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.6
      ..color = CM.green);
  }

  @override
  bool shouldRepaint(covariant _SparkPainter old) => old.t != t;
}

class _GapPainter extends CustomPainter {
  _GapPainter(this.t);
  final double t;
  @override
  void paint(Canvas canvas, Size s) {
    final cy = s.height / 2;
    final fh = s.height * .2 < 34 ? s.height * .2 : 34.0;
    final gap = s.width * .55 + (14 - s.width * .55) * t;
    final le = s.width / 2 - gap / 2;
    final rs = s.width / 2 + gap / 2;
    Paint fillFor(Rect r, List<Color> cols, bool leftToRight) => Paint()
      ..shader = LinearGradient(begin: leftToRight ? Alignment.centerLeft : Alignment.centerRight, end: leftToRight ? Alignment.centerRight : Alignment.centerLeft, colors: cols).createShader(r);
    final l1 = Rect.fromLTRB(-30, cy - fh / 2, le, cy + fh / 2);
    final l2 = Rect.fromLTRB(-30, cy + fh / 2 + 7, le - 34, cy + fh / 2 + 7 + fh * .7);
    canvas.drawRRect(RRect.fromRectAndRadius(l1, Radius.circular(fh / 2)), fillFor(l1, [CM.sandalDeep, CM.sandal], true));
    canvas.drawRRect(RRect.fromRectAndRadius(l2, Radius.circular(fh * .35)), fillFor(l2, [CM.sandalDeep.withValues(alpha: .7), CM.sandal.withValues(alpha: .7)], true));
    final r1 = Rect.fromLTRB(rs, cy - fh / 2, s.width + 30, cy + fh / 2);
    final r2 = Rect.fromLTRB(rs + 34, cy + fh / 2 + 7, s.width + 30, cy + fh / 2 + 7 + fh * .7);
    canvas.drawRRect(RRect.fromRectAndRadius(r1, Radius.circular(fh / 2)), fillFor(r1, [CM.blue, CM.blueDeep], false));
    canvas.drawRRect(RRect.fromRectAndRadius(r2, Radius.circular(fh * .35)), fillFor(r2, [CM.blue.withValues(alpha: .7), CM.blueDeep.withValues(alpha: .7)], false));
    final c = Offset(s.width / 2, cy);
    final rad = 8 + t * 40;
    canvas.drawCircle(c, rad, Paint()..shader = RadialGradient(colors: [CM.green.withValues(alpha: .85), CM.green.withValues(alpha: 0)]).createShader(Rect.fromCircle(center: c, radius: rad)));
    for (var i = 0; i < 8; i++) {
      final a = 2 * _pi * i / 8;
      canvas.drawLine(Offset(c.dx + rad * .45 * _cos(a), c.dy + rad * .45 * _sin(a)), Offset(c.dx + rad * .95 * _cos(a), c.dy + rad * .95 * _sin(a)), Paint()
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round
        ..color = CM.green.withValues(alpha: t * .9));
    }
    canvas.drawCircle(c, 4 + t * 5, Paint()..color = CM.green);
    if (t > .95) {
      canvas.drawCircle(c, 15, Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..color = CM.white.withValues(alpha: .8));
    }
  }

  @override
  bool shouldRepaint(covariant _GapPainter old) => old.t != t;
}

 
class _NavItem {
  const _NavItem(this.id, this.label, this.icon);
  final String id, label;
  final IconData icon;
}

const List<_NavItem> _nav = [
  _NavItem('why', 'The gap', Icons.insights_rounded),
  _NavItem('roles', "Who it's for", Icons.groups_rounded),
  _NavItem('flow', 'App flow', Icons.phone_iphone_rounded),
  _NavItem('catalogue', 'Opportunities', Icons.grid_view_rounded),
  _NavItem('engine', 'Engine', Icons.hub_rounded),
  _NavItem('insights', 'Insights', Icons.bar_chart_rounded),
  _NavItem('philosophy', 'Philosophy', Icons.auto_awesome_rounded),
  _NavItem('stack', 'Stack', Icons.layers_rounded),
];

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final ScrollController _sc = ScrollController();
  final ValueNotifier<int> _tour = ValueNotifier<int>(0);
  final Map<String, GlobalKey> _keys = {for (final n in _nav) n.id: GlobalKey()};

  @override
  void dispose() {
    _sc.dispose();
    _tour.dispose();
    super.dispose();
  }

  void _go(String id) {
    final ctx = _keys[id]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 750), curve: Curves.easeInOutCubic);
  }

  void _playTour() {
    _go('flow');
    Future<void>.delayed(const Duration(milliseconds: 850), () {
      if (mounted) _tour.value++;
    });
  }

  void _menu() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (c) => _PanelShell(
        sheet: true,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Navigate', style: _ts(24, w: FontWeight.w800, ls: -.4)),
          const SizedBox(height: 8),
          for (final n in _nav)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: _IconBadge(n.icon, CM.blue, size: 40),
              title: Text(n.label, style: _ts(16, w: FontWeight.w700)),
              trailing: const Icon(Icons.arrow_forward_rounded, size: 18, color: CM.text3),
              onTap: () {
                Navigator.of(c).pop();
                _go(n.id);
              },
            ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return MediaQuery(
      data: mq.copyWith(textScaler: mq.textScaler.clamp(minScaleFactor: .9, maxScaleFactor: 1.15)),
      child: Scaffold(
        backgroundColor: CM.white,
        body: SafeArea(
          bottom: false,
          child: Column(children: [
            _NavBar(onGo: _go, onTour: _playTour, onMenu: _menu),
            Expanded(
              child: _PageScope(
                controller: _sc,
                child: SingleChildScrollView(
                  controller: _sc,
                  child: Column(children: [
                    _Hero(onTour: _playTour, onGo: _go),
                    _Sec(key: _keys['why'], bg: CM.white, child: const _Why()),
                    _Sec(key: _keys['roles'], bg: CM.sandalSoft, child: _Roles(onFlow: () => _go('flow'))),
                    _Sec(key: _keys['flow'], bg: CM.white, child: _Experience(signal: _tour)),
                    _Sec(key: _keys['catalogue'], bg: CM.sandalSoft, child: const _Catalogue()),
                    _Sec(key: _keys['engine'], bg: CM.white, child: const _Engine()),
                    _Sec(key: _keys['insights'], bg: CM.blueSoft, child: const _Insights()),
                    _Sec(key: _keys['philosophy'], bg: CM.ink, child: const _Philosophy()),
                    _Sec(bg: CM.white, child: const _Compare()),
                    _Sec(key: _keys['stack'], bg: CM.sandalSoft, child: const _TechStack()),
                    _Sec(bg: CM.white, child: const _Proof()),
                    _Footer(onTour: _playTour, onPhilosophy: () => _go('philosophy'), onTop: () => _sc.animateTo(0, duration: const Duration(milliseconds: 800), curve: Curves.easeInOutCubic)),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


class _NavBar extends StatelessWidget {
  const _NavBar({required this.onGo, required this.onTour, required this.onMenu});
  final ValueChanged<String> onGo;
  final VoidCallback onTour, onMenu;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (c, b) {
        final w = b.maxWidth;
        final desktop = w >= 1200;
        return Container(
          height: 68,
          padding: EdgeInsets.symmetric(horizontal: _pad(w)),
          decoration: const BoxDecoration(color: CM.white, border: Border(bottom: BorderSide(color: CM.line))),
          child: Row(children: [
            Flexible(
              flex: desktop ? 0 : 1,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const _Logo(size: 38),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('CareerMate', maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(19, w: FontWeight.w800, ls: -.4)),
                    if (w >= 380) Text('SIH26044 · Tech Vectors', maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(10, c: CM.text3, w: FontWeight.w600, ls: .4)),
                  ]),
                ),
              ]),
            ),
            if (desktop)
              Expanded(
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      for (final n in _nav)
                        TextButton(
                          onPressed: () => onGo(n.id),
                          style: TextButton.styleFrom(foregroundColor: CM.ink, padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10)),
                          child: Text(n.label, style: _ts(13.5, w: FontWeight.w700)),
                        ),
                    ]),
                  ),
                ),
              )
            else
              const Spacer(),
            if (desktop)
              _Btn('Play the tour', icon: Icons.play_arrow_rounded, small: true, onTap: onTour)
            else ...[
              IconButton.filled(
                onPressed: onTour,
                style: IconButton.styleFrom(backgroundColor: CM.blue, foregroundColor: CM.white),
                icon: const Icon(Icons.play_arrow_rounded),
                tooltip: 'Play the tour',
              ),
              const SizedBox(width: 4),
              IconButton(onPressed: onMenu, icon: const Icon(Icons.menu_rounded, color: CM.ink), tooltip: 'Menu'),
            ],
          ]),
        );
      });
}

 
class _Hero extends StatelessWidget {
  const _Hero({required this.onTour, required this.onGo});
  final VoidCallback onTour;
  final ValueChanged<String> onGo;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final h1 = w < 420 ? 40.0 : (w < 700 ? 50.0 : (w < 1000 ? 60.0 : 66.0));
    final left = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const _Pill('SIH 2026 · SIH26044 · PRE-PRODUCT PREVIEW', icon: Icons.bolt_rounded, bg: CM.white, fg: CM.sandalInk),
      const SizedBox(height: 22),
      Text.rich(
        TextSpan(style: _ts(h1, w: FontWeight.w800, h: 1.04, ls: -1.8), children: const [
          TextSpan(text: 'Made for '),
          TextSpan(text: 'academicians', style: TextStyle(color: CM.blue)),
          TextSpan(text: ' first.'),
        ]),
      ),
      const SizedBox(height: 20),
      Text('One profile. One skill journey. Every opportunity.', style: _ts(w < 500 ? 18 : 21, w: FontWeight.w700, h: 1.3)),
      const SizedBox(height: 8),
      Text('A recommendation engine connecting people, programmes and industry demand.', style: _ts(15.5, c: CM.text2, h: 1.5)),
      const SizedBox(height: 26),
      Text('PRIORITY ORDER', style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.4)),
      const SizedBox(height: 10),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (var i = 0; i < _roles.length; i++)
          _Tap(
            radius: 100,
            onTap: () => onGo('roles'),
            child: Container(
              padding: const EdgeInsets.fromLTRB(6, 6, 14, 6),
              decoration: BoxDecoration(color: i == 0 ? CM.blue : CM.white, borderRadius: BorderRadius.circular(100), border: Border.all(color: i == 0 ? CM.blue : CM.line)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  width: 22,
                  height: 22,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: i == 0 ? CM.white : CM.sandal, shape: BoxShape.circle),
                  child: Text('${i + 1}', style: _ts(11, w: FontWeight.w800, c: i == 0 ? CM.blue : CM.ink)),
                ),
                const SizedBox(width: 8),
                Text(_roles[i].short, style: _ts(12.5, w: FontWeight.w700, c: i == 0 ? CM.white : CM.ink)),
              ]),
            ),
          ),
      ]),
      const SizedBox(height: 28),
      Wrap(spacing: 12, runSpacing: 12, children: [
        _Btn('Play the guided tour', icon: Icons.play_arrow_rounded, onTap: onTour),
        _Btn("Explore who it's for", icon: Icons.arrow_downward_rounded, kind: _BK.ghost, onTap: () => onGo('roles')),
      ]),
      const SizedBox(height: 32),
      Wrap(spacing: 34, runSpacing: 16, children: [
        _MiniStat('24', 'opportunity types', () => onGo('catalogue')),
        _MiniStat('3', 'home lanes', () => onGo('flow')),
        _MiniStat('1', 'demand dashboard', () => onGo('insights')),
      ]),
    ]);
    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [CM.white, CM.sandalSoft])),
      child: Stack(children: [
        const Positioned.fill(child: CustomPaint(painter: _DotsPainter())),
        _Sec(
          vPad: 64,
          child: LayoutBuilder(builder: (c, b) {
            final wide = b.maxWidth >= 920;
            final orbit = Column(mainAxisSize: MainAxisSize.min, children: [
              _OrbitHero(onRole: (i) => _openRole(context, i)),
              const SizedBox(height: 6),
              Text('Tap any node · every role connects through one engine', textAlign: TextAlign.center, style: _ts(12, c: CM.text3, w: FontWeight.w600)),
            ]);
            if (wide) {
              return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Expanded(flex: 11, child: _rv(left)),
                const SizedBox(width: 40),
                Expanded(flex: 10, child: _rv(orbit, delay: 150)),
              ]);
            }
            return Column(children: [_rv(left), const SizedBox(height: 40), _rv(orbit, delay: 150)]);
          }),
        ),
      ]),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat(this.n, this.label, this.onTap);
  final String n, label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => _Tap(
        onTap: onTap,
        radius: 10,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
          Text(n, style: _ts(34, w: FontWeight.w800, c: CM.blue, ls: -1, h: 1)),
          const SizedBox(height: 4),
          Text(label, style: _ts(12.5, c: CM.text2, w: FontWeight.w600)),
        ]),
      );
}

class _OrbitHero extends StatefulWidget {
  const _OrbitHero({required this.onRole});
  final ValueChanged<int> onRole;
  @override
  State<_OrbitHero> createState() => _OrbitHeroState();
}

class _OrbitHeroState extends State<_OrbitHero> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(seconds: 48))..repeat();
  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (ctx, b) {
        final side = b.maxWidth < 460 ? b.maxWidth : 460.0;
        final node = side < 340 ? 46.0 : 56.0;
        final r = side * .37;
        final core = side * .27;
        return Center(
          child: SizedBox(
            width: side,
            height: side,
            child: AnimatedBuilder(
              animation: _c,
              builder: (context, _) {
                final t = _c.value;
                final cx = side / 2, cy = side / 2;
                final kids = <Widget>[
                  Positioned.fill(child: CustomPaint(painter: _OrbitPainter(t, r, core / 2))),
                  Center(
                    child: Container(
                      width: core,
                      height: core,
                      decoration: BoxDecoration(color: CM.white, shape: BoxShape.circle, border: Border.all(color: CM.sandal, width: 2), boxShadow: _sh(.18, 40, 14)),
                      alignment: Alignment.center,
                      child: _Logo(size: core * .99),
                    ),
                  ),
                ];
                for (var i = 0; i < _roles.length; i++) {
                  final a = -_pi / 2 + 2 * _pi * (i / _roles.length + t);
                  final dx = cx + r * _cos(a), dy = cy + r * _sin(a);
                  final role = _roles[i];
                  kids.add(Positioned(
                    left: dx - 42,
                    top: dy - node / 2,
                    width: 84,
                    child: GestureDetector(
                      onTap: () => widget.onRole(i),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            width: node,
                            height: node,
                            decoration: BoxDecoration(color: CM.white, shape: BoxShape.circle, border: Border.all(color: role.color.withValues(alpha: .35), width: 1.5), boxShadow: _sh(.14, 20, 8)),
                            child: Icon(role.icon, color: role.color, size: node * .42),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(color: i == 0 ? CM.blue : CM.white, borderRadius: BorderRadius.circular(100), border: Border.all(color: i == 0 ? CM.blue : CM.line)),
                            child: Text(role.short, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(10.5, w: FontWeight.w800, c: i == 0 ? CM.white : CM.ink)),
                          ),
                        ]),
                      ),
                    ),
                  ));
                }
                return Stack(clipBehavior: Clip.none, children: kids);
              },
            ),
          ),
        );
      });
}


class _Why extends StatelessWidget {
  const _Why();
  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _rv(const _Head(kicker: 'THE GAP, IN NUMBERS', title: 'Talent is not the shortage. Connection is.', sub: 'Tap a card to flip from the problem to CareerMate\'s answer.')),
        const SizedBox(height: 40),
        _Grid(minTile: 330, children: [for (var i = 0; i < _facts.length; i++) _FlipStat(fact: _facts[i], delay: (i % 3) * 110)]),
        const SizedBox(height: 22),
        _rv(Align(
          alignment: Alignment.centerLeft,
          child: _Btn('See every source', icon: Icons.menu_book_rounded, kind: _BK.ghost, small: true, onTap: () => _openRefs(context)),
        )),
      ]);
}

class _FlipStat extends StatefulWidget {
  const _FlipStat({required this.fact, required this.delay});
  final _Fact fact;
  final int delay;
  @override
  State<_FlipStat> createState() => _FlipStatState();
}

class _FlipStatState extends State<_FlipStat> {
  bool _back = false;
  @override
  Widget build(BuildContext context) {
    final f = widget.fact;
    return _Reveal(
      delay: widget.delay,
      builder: (context, shown) {
        final refChip = GestureDetector(
          onTap: () => _openRefs(context, highlight: f.ref),
          child: _Pill('SOURCE [${f.ref}]', small: true, bg: _back ? CM.white.withValues(alpha: .14) : CM.sandalSoft, fg: _back ? CM.sandal : CM.sandalInk),
        );
        final front = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            _IconBadge(f.icon, CM.blue),
            const SizedBox(width: 12),
            Expanded(child: Text(f.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: _ts(14, w: FontWeight.w800, h: 1.25))),
          ]),
          const SizedBox(height: 18),
          _CountUp(value: f.value, decimals: f.decimals, suffix: f.suffix, run: shown, style: _ts(58, w: FontWeight.w800, c: CM.blue, ls: -2.4, h: 1)),
          const SizedBox(height: 8),
          Text(f.problem, style: _ts(14.5, c: CM.text2, h: 1.45)),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: Text('Tap · see the answer', style: _ts(11.5, w: FontWeight.w800, c: CM.blue))),
            refChip,
          ]),
        ]);
        final back = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 42, height: 42, decoration: BoxDecoration(color: CM.green, borderRadius: BorderRadius.circular(13)), child: const Icon(Icons.check_rounded, color: CM.white)),
            const SizedBox(width: 12),
            Expanded(child: Text('CAREERMATE\'S ANSWER', style: _ts(11, w: FontWeight.w800, c: CM.sandal, ls: 1.2))),
          ]),
          const SizedBox(height: 22),
          Text(f.answer, style: _ts(23, w: FontWeight.w800, c: CM.white, h: 1.2, ls: -.4)),
          const SizedBox(height: 20),
          Row(children: [
            Expanded(child: Text('Tap · back to the problem', style: _ts(11.5, w: FontWeight.w800, c: CM.sandal))),
            refChip,
          ]),
        ]);
        return _Lift(
          color: _back ? CM.blueDeep : CM.white,
          border: _back ? CM.blueDeep : null,
          padding: const EdgeInsets.all(22),
          onTap: () => setState(() => _back = !_back),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 226),
            child: _switcher(_back ? back : front, _back ? 'b' : 'f'),
          ),
        );
      },
    );
  }
}


class _Roles extends StatefulWidget {
  const _Roles({required this.onFlow});
  final VoidCallback onFlow;
  @override
  State<_Roles> createState() => _RolesState();
}

class _RolesState extends State<_Roles> {
  int _i = 0;

  Widget _ladderTile(int i) {
    final r = _roles[i];
    final on = i == _i;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        decoration: BoxDecoration(color: on ? CM.blue : CM.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: on ? CM.blue : CM.line), boxShadow: on ? _sh(.16, 26, 10) : null),
        child: _Tap(
          radius: 18,
          onTap: () => setState(() => _i = i),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(children: [
              Container(width: 30, height: 30, alignment: Alignment.center, decoration: BoxDecoration(color: on ? CM.white : CM.sandal, shape: BoxShape.circle), child: Text('${i + 1}', style: _ts(13, w: FontWeight.w800, c: on ? CM.blue : CM.ink))),
              const SizedBox(width: 12),
              Icon(r.icon, size: 20, color: on ? CM.white : r.color),
              const SizedBox(width: 10),
              Expanded(child: Text(r.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(15, w: FontWeight.w700, c: on ? CM.white : CM.ink))),
              Icon(Icons.arrow_forward_rounded, size: 16, color: on ? CM.white : CM.text3),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _block(String title, List<String> items) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.3)),
        const SizedBox(height: 10),
        for (final e in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(padding: EdgeInsets.only(top: 2), child: Icon(Icons.check_circle_rounded, size: 16, color: CM.green)),
              const SizedBox(width: 8),
              Expanded(child: Text(e, style: _ts(14, h: 1.4))),
            ]),
          ),
      ]);

  Widget _detail() {
    final r = _roles[_i];
    final content = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        _IconBadge(r.icon, r.color, size: 56),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('PRIORITY 0${_i + 1}', style: _ts(11, w: FontWeight.w800, c: r.color, ls: 1.4)),
            const SizedBox(height: 2),
            Text(r.name, style: _ts(26, w: FontWeight.w800, ls: -.6, h: 1.1)),
          ]),
        ),
      ]),
      const SizedBox(height: 14),
      Text(r.tagline, style: _ts(17, w: FontWeight.w600, c: CM.text2, h: 1.4)),
      const SizedBox(height: 24),
      Text('HOME LANES', style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.3)),
      const SizedBox(height: 10),
      _Grid(minTile: 150, gap: 10, children: [
        for (var k = 0; k < r.lanes.length; k++)
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(16)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('0${k + 1}', style: _ts(11, w: FontWeight.w800, c: r.color)),
              const SizedBox(height: 4),
              Text(r.lanes[k][0], style: _ts(16, w: FontWeight.w800)),
              const SizedBox(height: 2),
              Text(r.lanes[k][1], style: _ts(12, c: CM.text2, h: 1.35)),
            ]),
          ),
      ]),
      const SizedBox(height: 24),
      _Adaptive(at: 560, gap: 22, children: [_block('WHAT YOU GET', r.gets), _block('WHAT YOU POST', r.posts)]),
      const SizedBox(height: 12),
      Text('KEYWORDS THE ENGINE LISTENS FOR', style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.3)),
      const SizedBox(height: 10),
      Wrap(spacing: 8, runSpacing: 8, children: [for (final k in r.kw) _Pill(k, bg: r.color.withValues(alpha: .1), fg: r.color)]),
      const SizedBox(height: 24),
      _Btn('Watch this on the phone', icon: Icons.phone_iphone_rounded, small: true, onTap: widget.onFlow),
    ]);
    return _Lift(radius: 26, padding: const EdgeInsets.all(26), child: _switcher(content, _i));
  }

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _rv(const _Head(kicker: "WHO IT'S FOR · IN PRIORITY ORDER", title: 'Academicians first. Then everyone who learns and builds with them.', sub: 'Pick a role to see the home it gets.')),
        const SizedBox(height: 40),
        LayoutBuilder(builder: (c, b) {
          if (b.maxWidth >= 860) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(width: 300, child: Column(children: [for (var i = 0; i < _roles.length; i++) _ladderTile(i)])),
              const SizedBox(width: 28),
              Expanded(child: _detail()),
            ]);
          }
          return Column(children: [
            SizedBox(
              height: 56,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _roles.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (c, i) => Center(child: _SelChip('${i + 1} · ${_roles[i].short}', selected: _i == i, icon: _roles[i].icon, onTap: () => setState(() => _i = i))),
              ),
            ),
            const SizedBox(height: 16),
            _detail(),
          ]);
        }),
      ]);
}


class _StepInfo {
  const _StepInfo(this.title, this.tag, this.icon, this.api, this.points, this.sees, this.engine);
  final String title, tag, api, sees, engine;
  final IconData icon;
  final List<String> points;
}

const List<_StepInfo> _steps = [
  _StepInfo('Secure sign-in', 'Entry', Icons.lock_rounded, 'POST /auth/login → JWT · Bcrypt compare',
      ['Choose your role once', 'Passwords are Bcrypt-hashed', 'Stateless JWT session over REST'],
      'A role picker, credentials and one sign-in button. No clutter.', 'Issues a signed JWT scoped to the role. Every later request carries it.'),
  _StepInfo('Profile extraction', 'Feeds the engine', Icons.fingerprint_rounded, 'PUT /profile/keywords',
      ['Skills and interests become keywords', 'Goals say what you are looking for', 'Strength ring fills as you add signal'],
      'Tappable keyword chips and a live profile-strength ring.', 'Normalises keywords and indexes them for matching. This is the engine\'s fuel.'),
  _StepInfo('Home · three lanes', 'Discover', Icons.home_rounded, 'GET /feed?lane=for-you|niche|community',
      ['For You: matched to your profile', 'Niche: filtered by keywords you pick', 'Community: posts from similar minds'],
      'Three lanes on one home screen, identical for academicians and students.', 'Ranks opportunities by keyword overlap and shows why each one matched.'),
  _StepInfo('Post and publish', 'Contribute', Icons.edit_note_rounded, 'POST /opportunities · POST /posts',
      ['Opportunities are structured uploads', 'Community posts are free-form, LinkedIn-style', 'Both travel to members with similar keywords'],
      'A composer with two modes: upload an opportunity or share a community post.', 'Tags the post with keywords and spreads it to profiles with similar skills, niches and interests.'),
  _StepInfo('Market-demand dashboard', 'Insight', Icons.insights_rounded, 'GET /insights/demand',
      ['Skills extracted from every posting', 'Your keywords against live demand', 'One dashboard for every role'],
      'Ranked in-demand keywords and a personal skill-gap strip.', 'Aggregates keywords from jobs, workshops, events and research calls into demand scores.'),
  _StepInfo('Digital portfolio', 'Proof', Icons.workspace_premium_rounded, 'GET /portfolio',
      ['Every connection is saved', 'Participation is recorded as proof', 'Shareable with recruiters and institutions'],
      'A timeline of completed programmes, internships and collaborations.', 'Writes each Connect event into the participant\'s portfolio automatically.'),
];

const List<String> _signRoles = ['Academician', 'Student', 'Institution', 'Industry'];
const List<String> _signNames = ['Dr. Rao', 'Ananya', 'Metro University', 'Nova Labs'];

class _Experience extends StatefulWidget {
  const _Experience({required this.signal});
  final ValueNotifier<int> signal;
  @override
  State<_Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<_Experience> with SingleTickerProviderStateMixin {
  late final AnimationController _tick;
  int _step = 0;
  bool _play = false;
  int _role = 0;
  int _tab = 0;
  int _compose = 0;
  int _ptype = 0;
  bool _posted = false;
  String? _niche;
  final Set<String> _kw = {'Machine Learning', 'Python', 'Pedagogy'};
  final Set<String> _goal = {'FDP'};

  @override
  void initState() {
    super.initState();
    _tick = AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed && _play) {
          if (_step >= _steps.length - 1) {
            setState(() => _play = false);
          } else {
            setState(() {
              _step++;
              _posted = false;
            });
            _tick.forward(from: 0);
          }
        }
      });
    widget.signal.addListener(_onSignal);
  }

  @override
  void dispose() {
    widget.signal.removeListener(_onSignal);
    _tick.dispose();
    super.dispose();
  }

  void _onSignal() {
    setState(() {
      _step = 0;
      _play = true;
      _posted = false;
    });
    _tick.forward(from: 0);
  }

  void _touch() {
    if (_play) {
      _play = false;
      _tick.stop();
    }
  }

  void _goTo(int i) {
    setState(() {
      _step = i;
      _posted = false;
    });
    if (_play) _tick.forward(from: 0);
  }

  void _togglePlay() {
    if (_play) {
      setState(() => _play = false);
      _tick.stop();
    } else {
      setState(() => _play = true);
      _tick.forward(from: _tick.value >= 1 ? 0 : _tick.value);
    }
  }

  void _explain(int i) {
    final s = _steps[i];
    _openInfo(context,
        icon: s.icon,
        color: CM.blue,
        kicker: 'Screen ${i + 1} of ${_steps.length} · ${s.tag}',
        title: s.title,
        rows: [_Row('What the user sees', s.sees), _Row('What the engine does', s.engine), _Row('Under the hood', s.api)],
        note: 'Pre-product preview. This screen is a working illustration, not live data.');
  }

  int _pct(int h) => h == 0 ? 34 : (h >= 3 ? 96 : 52 + h * 20);
  List<String> _hits(_Opp o) => o.kw.where(_kw.contains).toList();

  // ── phone chrome ──
  Widget _phone(Widget screen) {
    final showNav = _step >= 2;
    return SizedBox(
      width: 300,
      height: 600,
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(color: CM.ink, borderRadius: BorderRadius.circular(44), boxShadow: [BoxShadow(color: CM.blue.withValues(alpha: .28), blurRadius: 60, offset: const Offset(0, 28))]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(36),
          child: ColoredBox(
            color: CM.white,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 16, 4),
                child: Row(children: [
                  Text('9:41', style: _ts(11.5, w: FontWeight.w800)),
                  const Spacer(),
                  Container(width: 54, height: 14, decoration: BoxDecoration(color: CM.ink, borderRadius: BorderRadius.circular(10))),
                  const Spacer(),
                  const Icon(Icons.signal_cellular_alt_rounded, size: 13),
                  const SizedBox(width: 4),
                  const Icon(Icons.battery_full_rounded, size: 14),
                ]),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 320),
                  layoutBuilder: (cur, prev) => Stack(fit: StackFit.expand, children: [...prev, if (cur != null) cur]),
                  child: KeyedSubtree(key: ValueKey('$_step-$_tab-$_compose'), child: screen),
                ),
              ),
              if (showNav) _phoneNav(),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _phoneNav() {
    const items = [
      (Icons.home_rounded, 'Home'),
      (Icons.filter_alt_rounded, 'Niche'),
      (Icons.add_circle_rounded, 'Post'),
      (Icons.insights_rounded, 'Demand'),
      (Icons.person_rounded, 'Me'),
    ];
    final active = _step == 2 ? (_tab == 1 ? 1 : 0) : (_step == 3 ? 2 : (_step == 4 ? 3 : 4));
    void tap(int i) {
      _touch();
      switch (i) {
        case 0:
          _tab = 0;
          _goTo(2);
        case 1:
          _tab = 1;
          _goTo(2);
        case 2:
          _goTo(3);
        case 3:
          _goTo(4);
        default:
          _goTo(5);
      }
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 10),
      decoration: const BoxDecoration(color: CM.white, border: Border(top: BorderSide(color: CM.line))),
      child: Row(children: [
        for (var i = 0; i < items.length; i++)
          Expanded(
            child: _Tap(
              onTap: () => tap(i),
              radius: 12,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Icon(items[i].$1, size: 20, color: i == active ? CM.blue : CM.text3),
                  const SizedBox(height: 2),
                  Text(items[i].$2, maxLines: 1, style: _ts(9.5, w: FontWeight.w700, c: i == active ? CM.blue : CM.text3)),
                ]),
              ),
            ),
          ),
      ]),
    );
  }

  Widget _mockField(IconData i, String t) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(12), border: Border.all(color: CM.line)),
        child: Row(children: [
          Icon(i, size: 16, color: CM.text3),
          const SizedBox(width: 10),
          Expanded(child: Text(t, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(12, c: CM.text2))),
        ]),
      );

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.only(bottom: 8, top: 4),
        child: Text(t, style: _ts(10, w: FontWeight.w800, c: CM.text3, ls: 1.2)),
      );

  Widget _sSignIn() => ListView(padding: const EdgeInsets.fromLTRB(20, 12, 20, 20), children: [
        const Center(child: _Logo(size: 56)),
        const SizedBox(height: 12),
        Center(child: Text('Welcome to CareerMate', style: _ts(18, w: FontWeight.w800))),
        const SizedBox(height: 4),
        Center(child: Text('One profile. One skill journey.', style: _ts(12, c: CM.text2))),
        const SizedBox(height: 20),
        _label('I AM A…'),
        Wrap(spacing: 6, runSpacing: 6, children: [
          for (var i = 0; i < _signRoles.length; i++)
            _SelChip(_signRoles[i], small: true, selected: _role == i, onTap: () {
              _touch();
              setState(() => _role = i);
            }),
        ]),
        const SizedBox(height: 16),
        _mockField(Icons.mail_outline_rounded, 'you@institution.edu'),
        _mockField(Icons.lock_outline_rounded, '••••••••••'),
        const SizedBox(height: 4),
        _Btn('Sign in', expand: true, onTap: () {
          _touch();
          _goTo(1);
        }),
        const SizedBox(height: 14),
        Wrap(alignment: WrapAlignment.center, spacing: 6, runSpacing: 6, children: const [
          _Pill('JWT', small: true, icon: Icons.key_rounded),
          _Pill('BCRYPT', small: true, icon: Icons.shield_rounded, bg: CM.greenSoft, fg: CM.greenDeep),
          _Pill('REST', small: true, icon: Icons.api_rounded, bg: CM.sandalSoft, fg: CM.sandalInk),
        ]),
      ]);

  Widget _sProfile() {
    final v = _kw.length >= 6 ? 1.0 : _kw.length / 6;
    return ListView(padding: const EdgeInsets.fromLTRB(18, 8, 18, 18), children: [
      Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Build your profile', style: _ts(18, w: FontWeight.w800)),
            const SizedBox(height: 3),
            Text('${_kw.length} keywords indexed', style: _ts(11.5, c: CM.text2)),
          ]),
        ),
        _Ring(value: v, size: 58, stroke: 6, child: Text('${(v * 100).round()}%', style: _ts(12, w: FontWeight.w800, c: CM.greenDeep))),
      ]),
      const SizedBox(height: 14),
      _label('WHAT I KNOW · WHAT I SEEK'),
      Wrap(spacing: 6, runSpacing: 6, children: [
        for (final k in _kwOptions)
          _SelChip(k, small: true, selected: _kw.contains(k), onTap: () {
            _touch();
            setState(() => _kw.contains(k) ? _kw.remove(k) : _kw.add(k));
          }),
      ]),
      const SizedBox(height: 12),
      _label('I AM LOOKING FOR'),
      Wrap(spacing: 6, runSpacing: 6, children: [
        for (final g in ['FDP', 'Internship', 'Collaboration', 'Hackathon'])
          _SelChip(g, small: true, selected: _goal.contains(g), onTap: () {
            _touch();
            setState(() => _goal.contains(g) ? _goal.remove(g) : _goal.add(g));
          }),
      ]),
      const SizedBox(height: 16),
      _Btn('Build my recommendations', expand: true, small: true, onTap: () {
        _touch();
        _goTo(2);
      }),
    ]);
  }

  Widget _oppCard(_Opp o, List<String> hit, {bool match = true}) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          decoration: BoxDecoration(color: CM.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: CM.line)),
          child: _Tap(
            onTap: () {
              _touch();
              _openInfo(context,
                  icon: o.icon,
                  color: CM.blue,
                  kicker: o.type,
                  title: o.title,
                  lead: o.org,
                  rows: [
                    _Row('Why it matched', hit.isEmpty ? 'No keyword overlap yet. Add skills to your profile to unlock a match.' : 'Shared keywords: ${hit.join(', ')}'),
                    _Row('Opportunity keywords', o.kw.join(' · ')),
                  ],
                  note: 'Illustrative listing for the preview.');
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Container(width: 38, height: 38, decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(10)), child: Icon(o.icon, size: 18, color: CM.sandalInk)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(o.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: _ts(12, w: FontWeight.w700, h: 1.25)),
                    const SizedBox(height: 2),
                    Text(o.org, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(10, c: CM.text3)),
                    const SizedBox(height: 5),
                    _Pill(o.type, small: true),
                  ]),
                ),
                if (match) ...[
                  const SizedBox(width: 8),
                  Column(mainAxisSize: MainAxisSize.min, children: [
                    Text('${_pct(hit.length)}%', style: _ts(14, w: FontWeight.w800, c: hit.isEmpty ? CM.text3 : CM.green)),
                    Text('match', style: _ts(9, c: CM.text3, w: FontWeight.w700)),
                  ]),
                ],
              ]),
            ),
          ),
        ),
      );

  Widget _postCard(_Post p) => Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: CM.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: CM.line)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 30, height: 30, alignment: Alignment.center, decoration: const BoxDecoration(color: CM.blueSoft, shape: BoxShape.circle), child: Text(p.name.substring(0, 1), style: _ts(13, w: FontWeight.w800, c: CM.blue))),
            const SizedBox(width: 8),
            Expanded(child: Text(p.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(12, w: FontWeight.w800))),
            _Pill(p.role, small: true, bg: CM.sandalSoft, fg: CM.sandalInk),
          ]),
          const SizedBox(height: 8),
          Text(p.text, maxLines: 3, overflow: TextOverflow.ellipsis, style: _ts(11.5, h: 1.4)),
          const SizedBox(height: 8),
          Wrap(spacing: 5, runSpacing: 5, children: [for (final t in p.tags) _Pill('#$t', small: true)]),
          const SizedBox(height: 8),
          Row(children: [
            const Icon(Icons.hub_rounded, size: 12, color: CM.green),
            const SizedBox(width: 5),
            Expanded(child: Text('Reaches ${p.reach} similar members', maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(10, w: FontWeight.w700, c: CM.greenDeep))),
          ]),
        ]),
      );

  Widget _sHome() {
    const tabs = [(Icons.auto_awesome_rounded, 'For You'), (Icons.filter_alt_rounded, 'Niche'), (Icons.forum_rounded, 'Community')];
    final ranked = _opps.map((o) => (o: o, hit: _hits(o))).toList()..sort((a, b) => b.hit.length.compareTo(a.hit.length));
    final sorted = _kw.toList()..sort();
    final key = (_niche != null && _kw.contains(_niche)) ? _niche : (sorted.isEmpty ? null : sorted.first);
    Widget body;
    if (_tab == 0) {
      body = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _label('MATCHED TO YOUR PROFILE'),
        for (final e in ranked.take(4)) _oppCard(e.o, e.hit),
      ]);
    } else if (_tab == 1) {
      final list = key == null ? <_Opp>[] : _opps.where((o) => o.kw.contains(key)).take(4).toList();
      body = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _label('YOUR NICHE KEYWORDS'),
        if (sorted.isEmpty) Text('Pick keywords in your profile to open this lane.', style: _ts(12, c: CM.text2)),
        Wrap(spacing: 6, runSpacing: 6, children: [
          for (final k in sorted)
            _SelChip(k, small: true, selected: k == key, onTap: () {
              _touch();
              setState(() => _niche = k);
            }),
        ]),
        const SizedBox(height: 10),
        for (final o in list) _oppCard(o, _hits(o), match: false),
      ]);
    } else {
      body = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [_label('FROM SIMILAR MINDS'), for (final p in _posts) _postCard(p)]);
    }
    return ListView(padding: const EdgeInsets.fromLTRB(16, 6, 16, 14), children: [
      Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Good morning,', style: _ts(11, c: CM.text2)),
            Text(_signNames[_role], maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(17, w: FontWeight.w800)),
          ]),
        ),
        Container(width: 36, height: 36, alignment: Alignment.center, decoration: const BoxDecoration(color: CM.blue, shape: BoxShape.circle), child: Text(_signNames[_role].substring(0, 1), style: _ts(14, w: FontWeight.w800, c: CM.white))),
      ]),
      if (_role >= 2) ...[
        const SizedBox(height: 8),
        const _Pill('Publisher tools live under Post', small: true, icon: Icons.edit_note_rounded, bg: CM.greenSoft, fg: CM.greenDeep),
      ],
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(14)),
        child: Row(children: [
          for (var i = 0; i < tabs.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _touch();
                  setState(() => _tab = i);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(color: _tab == i ? CM.white : Colors.transparent, borderRadius: BorderRadius.circular(11), boxShadow: _tab == i ? _sh(.08, 10, 3) : null),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Icon(tabs[i].$1, size: 15, color: _tab == i ? CM.blue : CM.text3),
                    const SizedBox(height: 2),
                    Text(tabs[i].$2, maxLines: 1, style: _ts(10, w: FontWeight.w800, c: _tab == i ? CM.blue : CM.text3)),
                  ]),
                ),
              ),
            ),
        ]),
      ),
      const SizedBox(height: 6),
      body,
    ]);
  }

  Widget _sPost() {
    final types = ['Workshop', 'FDP', 'Internship', 'Hackathon'];
    Widget seg(int i, String t) => Expanded(
          child: GestureDetector(
            onTap: () {
              _touch();
              setState(() {
                _compose = i;
                _posted = false;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 9),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: _compose == i ? CM.white : Colors.transparent, borderRadius: BorderRadius.circular(11), boxShadow: _compose == i ? _sh(.08, 10, 3) : null),
              child: Text(t, style: _ts(11, w: FontWeight.w800, c: _compose == i ? CM.blue : CM.text3)),
            ),
          ),
        );
    return ListView(padding: const EdgeInsets.fromLTRB(16, 6, 16, 14), children: [
      Text('Create', style: _ts(18, w: FontWeight.w800)),
      const SizedBox(height: 10),
      Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(14)), child: Row(children: [seg(0, 'Opportunity'), seg(1, 'Community post')])),
      const SizedBox(height: 12),
      if (_compose == 0) ...[
        _label('TYPE'),
        Wrap(spacing: 6, runSpacing: 6, children: [
          for (var i = 0; i < types.length; i++)
            _SelChip(types[i], small: true, selected: _ptype == i, onTap: () {
              _touch();
              setState(() => _ptype = i);
            }),
        ]),
        const SizedBox(height: 8),
        _label('SKILLS REQUIRED'),
        Wrap(spacing: 6, runSpacing: 6, children: [for (final k in (_kw.toList()..sort()).take(3)) _Pill(k, small: true, icon: Icons.check_rounded)]),
        const SizedBox(height: 10),
        _mockField(Icons.timer_rounded, 'Duration · 5 days'),
        _mockField(Icons.wifi_rounded, 'Mode · Online'),
      ] else ...[
        _label('SHARE WITH YOUR NETWORK'),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(12), border: Border.all(color: CM.line)),
          child: Text('Looking for collaborators on adaptive learning research…', style: _ts(12, c: CM.text2, h: 1.4)),
        ),
        const SizedBox(height: 10),
        Wrap(spacing: 6, runSpacing: 6, children: [for (final k in (_kw.toList()..sort()).take(3)) _Pill('#$k', small: true)]),
        const SizedBox(height: 10),
      ],
      _Btn(_compose == 0 ? 'Publish opportunity' : 'Post to community', expand: true, small: true, onTap: () {
        _touch();
        setState(() => _posted = true);
      }),
      AnimatedSize(
        duration: const Duration(milliseconds: 260),
        alignment: Alignment.topCenter,
        child: _posted
            ? Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: CM.greenSoft, borderRadius: BorderRadius.circular(12)),
                child: Row(children: [
                  const Icon(Icons.check_circle_rounded, color: CM.green, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(_compose == 0 ? 'Published · matched to 1,284 profiles by keyword' : 'Spread to 860 similar members by keyword', style: _ts(11.5, w: FontWeight.w700, c: CM.greenDeep, h: 1.35))),
                ]),
              )
            : const SizedBox(width: double.infinity),
      ),
    ]);
  }

  String _dom = 'All domains';

  Widget _demandRow(_Dem d) {
    final own = _kw.contains(d.k);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text(d.k, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(11.5, w: FontWeight.w700))),
          if (own) const Padding(padding: EdgeInsets.only(right: 6), child: Icon(Icons.check_circle_rounded, size: 12, color: CM.green)),
          Text('+${d.d}%', style: _ts(10, w: FontWeight.w800, c: CM.greenDeep)),
        ]),
        const SizedBox(height: 4),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: d.v / 100),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOutCubic,
          builder: (c, v, _) => ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(children: [
              Container(height: 7, color: CM.blueSoft),
              FractionallySizedBox(widthFactor: v, child: Container(height: 7, color: own ? CM.green : CM.blue)),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget _sDemand() {
    final list = _demand[_dom]!;
    final gaps = list.where((d) => !_kw.contains(d.k)).take(3).toList();
    return ListView(padding: const EdgeInsets.fromLTRB(16, 6, 16, 14), children: [
      Text('Market demand', style: _ts(18, w: FontWeight.w800)),
      const SizedBox(height: 2),
      Text('Skills pulled from every posting', style: _ts(11.5, c: CM.text2)),
      const SizedBox(height: 10),
      Wrap(spacing: 6, runSpacing: 6, children: [
        for (final d in _demand.keys)
          _SelChip(d, small: true, selected: d == _dom, onTap: () {
            _touch();
            setState(() => _dom = d);
          }),
      ]),
      const SizedBox(height: 14),
      for (final d in list) _demandRow(d),
      const SizedBox(height: 4),
      _label('YOUR GAP'),
      if (gaps.isEmpty)
        Text('You already cover every keyword in this view.', style: _ts(11.5, c: CM.text2))
      else
        Wrap(spacing: 6, runSpacing: 6, children: [for (final g in gaps) _Pill('Learn · ${g.k}', small: true, icon: Icons.flag_rounded, bg: CM.sandalSoft, fg: CM.sandalInk)]),
    ]);
  }

  Widget _sPortfolio() {
    const items = [
      (Icons.cast_for_education_rounded, 'NEP-Aligned Pedagogy FDP', 'Central University', 'Completed'),
      (Icons.badge_rounded, 'Data Science Internship', 'Industry Partner', 'Connected'),
      (Icons.science_rounded, 'Joint Research: Climate Analytics', 'Research Institute', 'Collaborating'),
      (Icons.code_rounded, 'Smart Campus Hackathon', 'Engineering College', 'Participated'),
    ];
    return ListView(padding: const EdgeInsets.fromLTRB(16, 6, 16, 14), children: [
      Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Digital portfolio', style: _ts(18, w: FontWeight.w800)),
            const SizedBox(height: 2),
            Text('Saved on every Connect', style: _ts(11.5, c: CM.text2)),
          ]),
        ),
        _Ring(value: .8, size: 52, stroke: 6, child: Text('4', style: _ts(14, w: FontWeight.w800, c: CM.greenDeep))),
      ]),
      const SizedBox(height: 14),
      for (var i = 0; i < items.length; i++)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            decoration: BoxDecoration(color: CM.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: CM.line)),
            child: _Tap(
              onTap: () {
                _touch();
                _openInfo(context,
                    icon: items[i].$1,
                    color: CM.green,
                    kicker: 'Portfolio entry · ${items[i].$4}',
                    title: items[i].$2,
                    lead: items[i].$3,
                    rows: const [
                      _Row('Saved as', 'A verified entry, created automatically when the Connect button was pressed.'),
                      _Row('Shareable with', 'Recruiters, institutions and collaborators, only when you choose.'),
                    ],
                    note: 'Illustrative entry for the preview.');
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  Container(width: 34, height: 34, decoration: BoxDecoration(color: CM.greenSoft, borderRadius: BorderRadius.circular(10)), child: Icon(items[i].$1, size: 17, color: CM.greenDeep)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(items[i].$2, maxLines: 2, overflow: TextOverflow.ellipsis, style: _ts(12, w: FontWeight.w700, h: 1.25)),
                      const SizedBox(height: 2),
                      Text(items[i].$3, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(10, c: CM.text3)),
                    ]),
                  ),
                  const SizedBox(width: 6),
                  Flexible(child: _Pill(items[i].$4, small: true, bg: CM.greenSoft, fg: CM.greenDeep)),
                ]),
              ),
            ),
          ),
        ),
      const SizedBox(height: 4),
      _Btn('Share with a recruiter', expand: true, small: true, kind: _BK.dark, icon: Icons.ios_share_rounded, onTap: () {
        _touch();
        _openInfo(context,
            icon: Icons.ios_share_rounded,
            color: CM.green,
            kicker: 'Portfolio',
            title: 'Share what you choose',
            lead: 'A private link to the entries you pick. Nothing is public by default.',
            note: 'Pre-product preview.');
      }),
    ]);
  }

  Widget _screen() {
    switch (_step) {
      case 0:
        return _sSignIn();
      case 1:
        return _sProfile();
      case 2:
        return _sHome();
      case 3:
        return _sPost();
      case 4:
        return _sDemand();
      default:
        return _sPortfolio();
    }
  }

  Widget _seg(int i) => AnimatedBuilder(
        animation: _tick,
        builder: (c, _) {
          final f = i < _step ? 1.0 : (i == _step ? (_play ? _tick.value : 1.0) : 0.0);
          return ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(children: [
              Container(height: 5, color: CM.line),
              FractionallySizedBox(widthFactor: f, child: Container(height: 5, color: i < _step ? CM.green : CM.blue)),
            ]),
          );
        },
      );

  Widget _rail() => Row(children: [
        for (var i = 0; i < _steps.length; i++)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: i == _steps.length - 1 ? 0 : 6),
              child: _Tap(
                radius: 8,
                onTap: () {
                  _touch();
                  _goTo(i);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(children: [
                    _seg(i),
                    const SizedBox(height: 6),
                    Text('0${i + 1}', style: _ts(11, w: FontWeight.w800, c: i == _step ? CM.blue : CM.text3)),
                  ]),
                ),
              ),
            ),
          ),
      ]);

  Widget _panel() {
    final s = _steps[_step];
    final body = Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        _IconBadge(s.icon, CM.blue, size: 54),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('SCREEN 0${_step + 1} · ${s.tag.toUpperCase()}', style: _ts(11, w: FontWeight.w800, c: CM.blue, ls: 1.3)),
            const SizedBox(height: 2),
            Text(s.title, style: _ts(25, w: FontWeight.w800, ls: -.5, h: 1.15)),
          ]),
        ),
      ]),
      const SizedBox(height: 18),
      for (final p in s.points)
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(padding: EdgeInsets.only(top: 1), child: Icon(Icons.check_circle_rounded, size: 18, color: CM.green)),
            const SizedBox(width: 10),
            Expanded(child: Text(p, style: _ts(14.5, h: 1.4))),
          ]),
        ),
      const SizedBox(height: 8),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('WHAT THE ENGINE DOES', style: _ts(10.5, w: FontWeight.w800, c: CM.sandalInk, ls: 1)),
          const SizedBox(height: 6),
          Text(s.engine, style: _ts(14, h: 1.5)),
        ]),
      ),
      const SizedBox(height: 14),
      _Pill(s.api, icon: Icons.terminal_rounded, bg: CM.ink, fg: CM.sandal, small: true),
    ]);
    return _Lift(
      radius: 26,
      padding: const EdgeInsets.all(26),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _switcher(body, _step),
        const SizedBox(height: 22),
        Wrap(spacing: 10, runSpacing: 10, crossAxisAlignment: WrapCrossAlignment.center, children: [
          _Btn(_play ? 'Pause tour' : 'Play tour', icon: _play ? Icons.pause_rounded : Icons.play_arrow_rounded, small: true, onTap: _togglePlay),
          _Btn('Explain this screen', icon: Icons.info_outline_rounded, kind: _BK.ghost, small: true, onTap: () {
            _touch();
            _explain(_step);
          }),
          IconButton(
            onPressed: _step == 0
                ? null
                : () {
                    _touch();
                    _goTo(_step - 1);
                  },
            icon: const Icon(Icons.skip_previous_rounded),
            tooltip: 'Previous screen',
          ),
          IconButton(
            onPressed: _step == _steps.length - 1
                ? null
                : () {
                    _touch();
                    _goTo(_step + 1);
                  },
            icon: const Icon(Icons.skip_next_rounded),
            tooltip: 'Next screen',
          ),
        ]),
        const SizedBox(height: 12),
        Text('Tap inside the phone. Chips, tabs and buttons all respond.', style: _ts(12, c: CM.text3, h: 1.4)),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final phone = LayoutBuilder(builder: (c, b) {
      final w = b.maxWidth < 300 ? b.maxWidth : 300.0;
      return Center(
        child: SizedBox(
          width: w,
          height: 600 * w / 300,
          child: FittedBox(fit: BoxFit.contain, child: _phone(_screen())),
        ),
      );
    });
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _rv(const _Head(kicker: 'THE APP, STEP BY STEP', title: 'Walk through the product before it exists.', sub: 'Press play, or tap inside the phone. Every screen is interactive.')),
      const SizedBox(height: 36),
      LayoutBuilder(builder: (c, b) {
        if (b.maxWidth >= 900) {
          return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(width: 320, child: phone),
            const SizedBox(width: 44),
            Expanded(child: Column(children: [_rail(), const SizedBox(height: 18), _panel()])),
          ]);
        }
        return Column(children: [_rail(), const SizedBox(height: 20), phone, const SizedBox(height: 24), _panel()]);
      }),
    ]);
  }
}


class _Ring extends StatelessWidget {
  const _Ring({required this.value, required this.size, required this.stroke, this.child});
  final double value, size, stroke;
  final Widget? child;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: size,
        height: size,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: value),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutCubic,
          builder: (c, v, _) => CustomPaint(painter: _RingPainter(v, stroke), child: Center(child: child)),
        ),
      );
}

class _Loop extends StatefulWidget {
  const _Loop({required this.builder, this.seconds = 3});
  final Widget Function(BuildContext context, double t) builder;
  final int seconds;
  @override
  State<_Loop> createState() => _LoopState();
}

class _LoopState extends State<_Loop> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: Duration(seconds: widget.seconds))..repeat();
  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(animation: _c, builder: (c, _) => widget.builder(c, _c.value));
}


class _Catalogue extends StatefulWidget {
  const _Catalogue();
  @override
  State<_Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<_Catalogue> {
  int _g = -1;

  void _open(_Kind k) => _openInfo(context,
      icon: k.icon,
      color: _groupColors[k.g],
      kicker: _groups[k.g],
      title: k.name,
      lead: k.line,
      rows: [_Row('Posted by', k.by), _Row('Meant for', k.to), _Row('Format', k.fmt)],
      chips: k.kw);

  Widget _groupRow(int g, String name, int count, Color color) {
    final on = g == _g;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(color: on ? color.withValues(alpha: .1) : Colors.transparent, borderRadius: BorderRadius.circular(12), border: Border.all(color: on ? color : CM.line)),
        child: _Tap(
          radius: 12,
          onTap: () => setState(() => _g = on ? -1 : g),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(children: [
              Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
              const SizedBox(width: 10),
              Expanded(child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(13, w: FontWeight.w700))),
              Text('$count', style: _ts(13, w: FontWeight.w800, c: color)),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shown = _g < 0 ? _kinds : _kinds.where((k) => k.g == _g).toList();
    final counts = [for (var g = 0; g < _groups.length; g++) _kinds.where((k) => k.g == g).length];
    final donut = _Lift(
      radius: 24,
      padding: const EdgeInsets.all(22),
      child: Column(children: [
        _Reveal(
          builder: (c, s) => SizedBox(
            width: 200,
            height: 200,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: s ? 1 : 0),
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeOutCubic,
              builder: (c, v, _) => CustomPaint(
                painter: _DonutPainter([for (final n in counts) n.toDouble()], _groupColors, v, _g),
                child: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Text('${shown.length}', style: _ts(42, w: FontWeight.w800, ls: -1.5, h: 1)),
                    Text(_g < 0 ? 'types' : 'in family', style: _ts(12, c: CM.text2, w: FontWeight.w600)),
                  ]),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        _groupRow(-1, 'All types', _kinds.length, CM.blue),
        for (var g = 0; g < _groups.length; g++) _groupRow(g, _groups[g], counts[g], _groupColors[g]),
      ]),
    );
    final grid = _switcher(
      _Grid(
        key: ValueKey(_g),
        minTile: 200,
        gap: 12,
        children: [
          for (final k in shown)
            _Lift(
              radius: 18,
              padding: const EdgeInsets.all(16),
              onTap: () => _open(k),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  _IconBadge(k.icon, _groupColors[k.g], size: 40),
                  const Spacer(),
                  Icon(Icons.arrow_outward_rounded, size: 16, color: CM.text3),
                ]),
                const SizedBox(height: 12),
                Text(k.name, style: _ts(15, w: FontWeight.w800, h: 1.2)),
                const SizedBox(height: 4),
                Text(k.line, style: _ts(12.5, c: CM.text2, h: 1.4)),
              ]),
            ),
        ],
      ),
      _g,
    );
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _rv(const _Head(kicker: 'THE OPPORTUNITY CATALOGUE', title: 'Twenty-four types. Only the ones academia actually uses.', sub: 'Curated for academic life, not dumped from a list. Filter by family and tap any card.')),
      const SizedBox(height: 40),
      _Adaptive(at: 900, gap: 28, flex: const [4, 9], children: [_rv(donut), grid]),
    ]);
  }
}


class _Stage {
  const _Stage(this.title, this.sub, this.icon, this.detail, this.api);
  final String title, sub, detail, api;
  final IconData icon;
}

const List<_Stage> _pubStages = [
  _Stage('Define', 'Skills, requirements, duration', Icons.tune_rounded, 'The publisher picks what is on offer (an internship, workshop, hackathon or another type), the skills it needs and how long it runs.', 'Typed form schema · TypeScript'),
  _Stage('POST', 'One structured upload', Icons.upload_rounded, 'The listing is posted through the REST API as structured data, so every field can be matched, filtered and counted.', 'POST /opportunities'),
  _Stage('Filter target users', 'Only matching profiles', Icons.filter_alt_rounded, 'Keywords on the listing are compared with member profiles, and only relevant people see it.', 'Keyword index · PostgreSQL'),
];

const List<_Stage> _seekStages = [
  _Stage('Profile assessment', 'Set up once, at sign-in', Icons.fingerprint_rounded, 'The first sign-in extracts what you know, what you care about and what you are looking for.', 'PUT /profile/keywords'),
  _Stage('Field and skill evaluation', 'Background, niche and goals', Icons.query_stats_rounded, 'Academicians are read by background and field, students by skills and niche. Both feed the same engine.', 'Keyword profile re-indexed on change'),
  _Stage('Recommendations and advisements', 'Ranked, with reasons', Icons.auto_awesome_rounded, 'Matches arrive with the reason they matched, plus advice on what to add next.', 'GET /feed'),
];

const List<List<String>> _outcomesIn = [
  ['Internships', 'Live projects that go into a portfolio.'],
  ['Placements', 'Roles matched to verified skills.'],
  ['Certified courses', 'Credentials that carry forward.'],
  ['Workshops', 'Hands-on, field-specific sessions.'],
  ['Events', 'Conferences, fests and symposia.'],
  ['Hackathons', 'Build against a real problem.'],
];

const List<List<String>> _outcomesOut = [
  ['Recruit / Hire', 'Industry finds skill-matched people.'],
  ['Collaborate', 'Researchers find co-investigators.'],
  ['Partner', 'Institutions and industry co-build.'],
  ['Participate', 'Learners join the right programme.'],
  ['Teach', 'Practitioners reach the classroom.'],
  ['Guide', 'Mentors meet the right mentees.'],
];

class _Engine extends StatefulWidget {
  const _Engine();
  @override
  State<_Engine> createState() => _EngineState();
}

class _EngineState extends State<_Engine> {
  final Set<String> _kw = {'Python', 'Machine Learning'};

  void _stageInfo(_Stage s, int i, String kicker, Color color) => _openInfo(context,
      icon: s.icon,
      color: color,
      kicker: '$kicker · step ${i + 1}',
      title: s.title,
      lead: s.sub,
      rows: [_Row('What happens', s.detail), _Row('Under the hood', s.api)]);

  Widget _stageTile(_Stage s, int i, String kicker, Color color) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          decoration: BoxDecoration(color: CM.sandalSoft, borderRadius: BorderRadius.circular(14)),
          child: _Tap(
            radius: 14,
            onTap: () => _stageInfo(s, i, kicker, color),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(children: [
                Container(width: 26, height: 26, alignment: Alignment.center, decoration: const BoxDecoration(color: CM.white, shape: BoxShape.circle), child: Text('${i + 1}', style: _ts(12, w: FontWeight.w800, c: color))),
                const SizedBox(width: 10),
                Icon(s.icon, size: 18, color: color),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(s.title, style: _ts(13.5, w: FontWeight.w800, h: 1.2)),
                    const SizedBox(height: 2),
                    Text(s.sub, style: _ts(11.5, c: CM.text2, h: 1.3)),
                  ]),
                ),
                const Icon(Icons.chevron_right_rounded, size: 18, color: CM.text3),
              ]),
            ),
          ),
        ),
      );

  Widget _track(String kicker, String title, List<_Stage> st, Color color) => _Lift(
        radius: 24,
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _Pill(kicker, small: true, bg: color.withValues(alpha: .1), fg: color),
          const SizedBox(height: 10),
          Text(title, style: _ts(19, w: FontWeight.w800, ls: -.3, h: 1.15)),
          const SizedBox(height: 14),
          for (var i = 0; i < st.length; i++) _stageTile(st[i], i, kicker, color),
        ]),
      );

  Widget _core() => Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          width: 200,
          height: 200,
          child: _Loop(
            seconds: 3,
            builder: (c, t) => CustomPaint(
              painter: _PulsePainter(t),
              child: Center(
                child: Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(color: CM.white, shape: BoxShape.circle, border: Border.all(color: CM.sandal, width: 2), boxShadow: _sh(.16, 30, 10)),
                  alignment: Alignment.center,
                  child: const _Logo(size: 52),
                ),
              ),
            ),
          ),
        ),
        const _Pill('RECOMMENDATION ENGINE', small: true, bg: CM.blue, fg: CM.white),
      ]);

  Widget _link({required bool vertical, required bool reverse}) => _Loop(
        seconds: 2,
        builder: (c, t) => SizedBox(
          width: vertical ? 24 : 60,
          height: vertical ? 48 : 24,
          child: CustomPaint(painter: _LinkPainter(reverse ? 1 - t : t, vertical)),
        ),
      );

  Widget _flow() => LayoutBuilder(builder: (c, b) {
        final pub = _track('PUBLISH', 'Industries and institutions', _pubStages, CM.blue);
        final seek = _track('DISCOVER', 'Academicians and students', _seekStages, CM.green);
        if (b.maxWidth >= 900) {
          return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(child: pub),
            _link(vertical: false, reverse: false),
            _core(),
            _link(vertical: false, reverse: true),
            Expanded(child: seek),
          ]);
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          pub,
          Center(child: _link(vertical: true, reverse: false)),
          Center(child: _core()),
          Center(child: _link(vertical: true, reverse: true)),
          seek,
        ]);
      });

  Widget _chipsCard() {
    Widget group(String label, List<List<String>> items, Color color) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.3)),
          const SizedBox(height: 10),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final o in items)
              _SelChip(o[0], selected: false, onTap: () => _openInfo(context, icon: Icons.hub_rounded, color: color, kicker: label, title: o[0], lead: o[1])),
          ]),
        ]);
    return _Lift(
      radius: 24,
      padding: const EdgeInsets.all(22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        group('PUBLISHERS POST', _outcomesIn, CM.blue),
        const SizedBox(height: 20),
        group('A CONNECTION BECOMES', _outcomesOut, CM.green),
        const SizedBox(height: 18),
        const _Pill('EVERY CONNECTION IS SAVED TO A DIGITAL PORTFOLIO', small: true, icon: Icons.workspace_premium_rounded, bg: CM.greenSoft, fg: CM.greenDeep),
      ]),
    );
  }

  Widget _matcher() {
    final ranked = _opps.map((o) => (o: o, hit: o.kw.where(_kw.contains).toList())).toList()..sort((a, b) => b.hit.length.compareTo(a.hit.length));
    final top = ranked.take(4).toList();
    return _Lift(
      radius: 24,
      padding: const EdgeInsets.all(22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Try the matcher', style: _ts(22, w: FontWeight.w800, ls: -.4)),
        const SizedBox(height: 4),
        Text('Pick keywords. Watch the ranking reorder.', style: _ts(13.5, c: CM.text2)),
        const SizedBox(height: 14),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final k in _kwOptions)
            _SelChip(k, small: true, selected: _kw.contains(k), onTap: () => setState(() => _kw.contains(k) ? _kw.remove(k) : _kw.add(k))),
        ]),
        const SizedBox(height: 18),
        for (final e in top)
          Builder(builder: (context) {
            final score = e.o.kw.isEmpty ? 0 : (e.hit.length / e.o.kw.length * 100).round();
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _IconBadge(e.o.icon, CM.blue, size: 38),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(e.o.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: _ts(13.5, w: FontWeight.w700, h: 1.25)),
                    const SizedBox(height: 4),
                    if (e.hit.isEmpty)
                      Text('No shared keywords yet', style: _ts(11.5, c: CM.text3))
                    else
                      Wrap(spacing: 5, runSpacing: 5, children: [for (final h in e.hit) _Pill(h, small: true, bg: CM.greenSoft, fg: CM.greenDeep)]),
                    const SizedBox(height: 7),
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: score / 100),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutCubic,
                      builder: (c, v, _) => ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Stack(children: [
                          Container(height: 6, color: CM.blueSoft),
                          FractionallySizedBox(widthFactor: v, child: Container(height: 6, color: CM.green)),
                        ]),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(width: 12),
                Text('$score%', style: _ts(16, w: FontWeight.w800, c: score == 0 ? CM.text3 : CM.green)),
              ]),
            );
          }),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _rv(const _Head(kicker: 'THE RECOMMENDATION ENGINE', title: 'Publishers post. Seekers set up. The engine connects.', sub: 'Follow both tracks into the engine, then try the matcher yourself.')),
        const SizedBox(height: 40),
        _rv(_flow()),
        const SizedBox(height: 24),
        _rv(_chipsCard()),
        const SizedBox(height: 24),
        _rv(_matcher()),
      ]);
}

 
class _Insights extends StatefulWidget {
  const _Insights();
  @override
  State<_Insights> createState() => _InsightsState();
}

class _InsightsState extends State<_Insights> {
  String _dom = 'All domains';
  int _sel = 0;
  int _aud = 0;

  static const List<List<String>> _auds = [
    ['Students', 'Ranked skills to build next, set against what you already hold.'],
    ['Academicians', 'What to teach, research and partner on, straight from live postings.'],
    ['Institutions', 'Curriculum and programmes aligned with what hiring actually asks for.'],
    ['Industries', 'Where the supply of skills is thin, before you post a single role.'],
  ];

  List<double> _series(_Dem d) => [
        for (var i = 0; i < 8; i++) d.v - d.d * 1.4 * (1 - i / 7) + (((i * 37 + d.v) % 7) - 3) * .5 * (1 - i / 7),
      ];

  Widget _barRow(_Dem d, int i) {
    final on = i == _sel;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(color: on ? CM.blueSoft : Colors.transparent, borderRadius: BorderRadius.circular(14)),
        child: _Tap(
          radius: 14,
          onTap: () => setState(() => _sel = i),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: [
              Container(width: 26, height: 26, alignment: Alignment.center, decoration: BoxDecoration(color: on ? CM.blue : CM.sandal, shape: BoxShape.circle), child: Text('${i + 1}', style: _ts(11.5, w: FontWeight.w800, c: on ? CM.white : CM.ink))),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(child: Text(d.k, maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(14, w: FontWeight.w700))),
                    const SizedBox(width: 8),
                    Text('+${d.d}%', style: _ts(12, w: FontWeight.w800, c: CM.greenDeep)),
                  ]),
                  const SizedBox(height: 7),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: d.v / 100),
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeOutCubic,
                    builder: (c, v, _) => ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Stack(children: [
                        Container(height: 8, color: on ? CM.white : CM.blueSoft),
                        FractionallySizedBox(widthFactor: v, child: Container(height: 8, color: on ? CM.blue : CM.blue.withValues(alpha: .55))),
                      ]),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final list = _demand[_dom]!;
    final d = list[_sel];
    final bars = _Lift(
      radius: 24,
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Wrap(spacing: 10, runSpacing: 8, crossAxisAlignment: WrapCrossAlignment.center, children: [
          Text('In-demand keywords', style: _ts(20, w: FontWeight.w800, ls: -.3)),
          const _Pill('ILLUSTRATIVE DATA', small: true, bg: CM.sandalSoft, fg: CM.sandalInk),
        ]),
        const SizedBox(height: 14),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (final k in _demand.keys)
            _SelChip(k, small: true, selected: k == _dom, onTap: () => setState(() {
                  _dom = k;
                  _sel = 0;
                })),
        ]),
        const SizedBox(height: 16),
        for (var i = 0; i < list.length; i++) _barRow(list[i], i),
      ]),
    );
    final spark = _Lift(
      radius: 24,
      padding: const EdgeInsets.all(22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('TREND · LAST 8 WEEKS', style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.3)),
        const SizedBox(height: 8),
        Text(d.k, maxLines: 2, overflow: TextOverflow.ellipsis, style: _ts(22, w: FontWeight.w800, ls: -.4, h: 1.15)),
        const SizedBox(height: 10),
        Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Text('${d.v}', style: _ts(46, w: FontWeight.w800, c: CM.blue, ls: -1.5, h: 1)),
          const SizedBox(width: 10),
          Expanded(child: Padding(padding: const EdgeInsets.only(bottom: 6), child: Text('demand score, up ${d.d}% this quarter', style: _ts(12.5, c: CM.text2, h: 1.3)))),
        ]),
        const SizedBox(height: 14),
        SizedBox(
          height: 120,
          width: double.infinity,
          child: TweenAnimationBuilder<double>(
            key: ValueKey('$_dom-$_sel'),
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeOutCubic,
            builder: (c, t, _) => CustomPaint(painter: _SparkPainter(_series(d), t)),
          ),
        ),
        const SizedBox(height: 14),
        Text('EXTRACTED FROM', style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.3)),
        const SizedBox(height: 8),
        const Wrap(spacing: 6, runSpacing: 6, children: [
          _Pill('Jobs', small: true),
          _Pill('Workshops', small: true),
          _Pill('Events', small: true),
          _Pill('Research calls', small: true),
        ]),
      ]),
    );
    final audience = _Lift(
      radius: 24,
      padding: const EdgeInsets.all(22),
      color: CM.ink,
      border: CM.ink,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('ONE DASHBOARD · EVERY ROLE', style: _ts(10.5, w: FontWeight.w800, c: CM.sandal, ls: 1.3)),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (var i = 0; i < _auds.length; i++) _SelChip(_auds[i][0], dark: true, small: true, selected: _aud == i, onTap: () => setState(() => _aud = i)),
        ]),
        const SizedBox(height: 14),
        _switcher(Text(_auds[_aud][1], style: _ts(16, c: CM.white, h: 1.45, w: FontWeight.w600)), _aud),
      ]),
    );
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _rv(const _Head(kicker: 'THE MARKET-DEMAND DASHBOARD', title: 'See what the market wants, before it asks.', sub: 'Keywords are extracted from every job, workshop, event and research call posted on the platform.')),
      const SizedBox(height: 40),
      _Adaptive(at: 900, gap: 24, flex: const [7, 5], children: [
        _rv(bars),
        _rv(Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [spark, const SizedBox(height: 20), audience]), delay: 120),
      ]),
    ]);
  }
}


class _Philosophy extends StatefulWidget {
  const _Philosophy();
  @override
  State<_Philosophy> createState() => _PhilosophyState();
}

class _PhilosophyState extends State<_Philosophy> {
  double _t = 0;
  int _r = 0;

  static const List<List<String>> _reads = [
    ['The seeker', 'Students · Academicians · Institutions', 'One hand hangs loose and unhurried. It is the learner: capable, willing, waiting to be met. Every student, teacher and institution on CareerMate is this hand.'],
    ['The knowledge', 'Research · Skills · Opportunity · Industry', 'The other hand is extended with intent. Knowledge does not wait to be found. It reaches outward, if only someone is positioned to receive it.'],
    ['The space between', 'CareerMate', 'The fingers never quite touch, and that is the point. The gap is where relevance, timing and intent get decided. CareerMate is that space, engineered: it reads both hands and closes the distance with a match instead of a search.'],
  ];

  static const List<List<String>> _principles = [
    ['01', 'Nearly touching is the design', 'A platform should never pretend to be the knowledge. It keeps the distance honest and makes it crossable.'],
    ['02', 'Reach is mutual', 'Learners reach for opportunity, and opportunity reaches for learners. Both sides post. Both sides receive.'],
    ['03', 'Connection is a beginning', 'The touch is not the end of the story. Every connection is written into a portfolio that keeps growing.'],
  ];

  Widget _art() => Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: CM.inkSoft, borderRadius: BorderRadius.circular(24), border: Border.all(color: CM.sandal.withValues(alpha: .3)), boxShadow: _sh(.4, 60, 24)),
        child: Image.asset(
          _kArt,
          width: double.infinity,
          fit: BoxFit.contain,
          errorBuilder: (c, e, s) => AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(child: Padding(padding: const EdgeInsets.all(20), child: Text('Add the artwork at $_kArt', textAlign: TextAlign.center, style: _ts(13, c: CM.sandal)))),
          ),
        ),
      );

  Widget _readings() {
    final r = _reads[_r];
    return _Lift(
      radius: 24,
      padding: const EdgeInsets.all(24),
      color: CM.inkSoft,
      border: CM.white.withValues(alpha: .1),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('THREE READINGS', style: _ts(10.5, w: FontWeight.w800, c: CM.sandal, ls: 1.3)),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: [
          for (var i = 0; i < _reads.length; i++) _SelChip(_reads[i][0], dark: true, small: true, selected: _r == i, onTap: () => setState(() => _r = i)),
        ]),
        const SizedBox(height: 20),
        _switcher(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(r[0], style: _ts(26, w: FontWeight.w800, c: CM.white, ls: -.5, h: 1.1)),
            const SizedBox(height: 6),
            Text(r[1].toUpperCase(), style: _ts(10.5, w: FontWeight.w800, c: CM.sandal, ls: 1.2, h: 1.4)),
            const SizedBox(height: 14),
            Text(r[2], style: _ts(15.5, c: CM.white.withValues(alpha: .82), h: 1.6)),
          ]),
          _r,
        ),
      ]),
    );
  }

  Widget _gapCard() {
    final stage = _t < .34 ? 0 : (_t < .75 ? 1 : 2);
    const titles = ['Apart', 'Narrowing', 'Connected'];
    const lines = [
      'Knowledge exists. So does the learner. Between them, only distance.',
      'The engine reads both sides and narrows the space.',
      'Connected. Not by force, but by fit.',
    ];
    return _Lift(
      radius: 24,
      padding: const EdgeInsets.all(24),
      color: CM.inkSoft,
      border: CM.white.withValues(alpha: .1),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Expanded(child: Text('CLOSE THE GAP', style: _ts(10.5, w: FontWeight.w800, c: CM.sandal, ls: 1.3))),
          AnimatedOpacity(opacity: _t > .95 ? 1 : 0, duration: const Duration(milliseconds: 250), child: const _Pill('CONNECTED', small: true, icon: Icons.check_rounded, bg: CM.green, fg: CM.white)),
        ]),
        const SizedBox(height: 12),
        ClipRect(child: SizedBox(height: 170, width: double.infinity, child: CustomPaint(painter: _GapPainter(_t)))),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(activeTrackColor: CM.green, inactiveTrackColor: CM.white.withValues(alpha: .18), thumbColor: CM.sandal, overlayColor: CM.green.withValues(alpha: .15)),
          child: Slider(value: _t, onChanged: (v) => setState(() => _t = v)),
        ),
        Row(children: [
          Text('Apart', style: _ts(11, c: CM.sandal, w: FontWeight.w700)),
          const Spacer(),
          Text('Drag to connect', style: _ts(11, c: CM.white.withValues(alpha: .5), w: FontWeight.w600)),
          const Spacer(),
          Text('Connected', style: _ts(11, c: CM.sandal, w: FontWeight.w700)),
        ]),
        const SizedBox(height: 18),
        _switcher(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(titles[stage], style: _ts(20, w: FontWeight.w800, c: CM.white, ls: -.3)),
            const SizedBox(height: 6),
            Text(lines[stage], style: _ts(14.5, c: CM.white.withValues(alpha: .8), h: 1.5)),
          ]),
          stage,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _rv(const _Head(dark: true, kicker: 'THE PHILOSOPHY OF THE MARK', title: 'The space between two hands is where learning happens.', sub: 'A reading of Michelangelo\'s The Creation of Adam, and why it became our logo.')),
        const SizedBox(height: 36),
        _rv(_art()),
        const SizedBox(height: 12),
        Text('The two hands link us, students, academicians and institutions, to knowledge, through the platform that connects them.', style: _ts(13, c: CM.white.withValues(alpha: .6), h: 1.5)),
        const SizedBox(height: 40),
        _Adaptive(at: 900, gap: 24, flex: const [5, 6], children: [_rv(_readings()), _rv(_gapCard(), delay: 120)]),
        const SizedBox(height: 40),
        _Grid(minTile: 260, gap: 16, children: [
          for (final p in _principles)
            _rv(Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(color: CM.inkSoft, borderRadius: BorderRadius.circular(20), border: Border.all(color: CM.white.withValues(alpha: .1))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(p[0], style: _ts(28, w: FontWeight.w800, c: CM.sandal, ls: -1)),
                const SizedBox(height: 10),
                Text(p[1], style: _ts(17, w: FontWeight.w800, c: CM.white, h: 1.25)),
                const SizedBox(height: 8),
                Text(p[2], style: _ts(13.5, c: CM.white.withValues(alpha: .7), h: 1.5)),
              ]),
            )),
        ]),
        const SizedBox(height: 44),
        _rv(Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: const BoxDecoration(border: Border(left: BorderSide(color: CM.sandal, width: 3))),
          child: Text('The gap was never the problem. Leaving it unmapped was.', style: _ts(30, w: FontWeight.w800, c: CM.white, h: 1.2, ls: -.6)),
        )),
      ]);
}

 
const List<List<String>> _platforms = [
  ['Events', 'Events and community discovery', 'Luma · Event Tribe', 'Discover and take part in workshops, meetups, professional events and communities.'],
  ['Jobs', 'Internships, jobs and recruitment', 'Internshala · Apna · Naukri', 'Connect candidates with internships, jobs, employers and career opportunities.'],
  ['Learn', 'Learning, skills and placement prep', 'SWAYAM · Coursera · PrepLinc', 'Build industry-relevant skills through courses, certifications and placement preparation.'],
  ['Network', 'Professional and research networking', 'LinkedIn · ResearchGate', 'Connect professionals, academicians and researchers for networking, careers and collaboration.'],
];

const List<(String, List<int>)> _caps = [
  ('Events and community', [2, 0, 0, 1, 2]),
  ('Internships, jobs and hiring', [0, 2, 0, 1, 2]),
  ('Learning and skilling', [0, 0, 2, 0, 2]),
  ('Professional and research networking', [1, 0, 0, 2, 2]),
  ('Skill mapping and gap analysis', [0, 0, 1, 0, 2]),
  ('Academia–industry collaboration', [0, 0, 0, 1, 2]),
  ('Portfolio of every connection', [0, 0, 1, 0, 2]),
];

class _Compare extends StatelessWidget {
  const _Compare();

  Widget _cell(int v, bool cm) {
    final c = cm ? CM.green : CM.ink;
    if (v == 2) return Container(width: 16, height: 16, decoration: BoxDecoration(color: c, shape: BoxShape.circle));
    if (v == 1) {
      return SizedBox(
        width: 16,
        height: 16,
        child: Stack(children: [
          Container(width: 16, height: 16, decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: c, width: 1.6))),
          ClipRect(child: Align(alignment: Alignment.centerLeft, widthFactor: .5, child: Container(width: 16, height: 16, decoration: BoxDecoration(color: c, shape: BoxShape.circle)))),
        ]),
      );
    }
    return Container(width: 8, height: 2, color: CM.text3);
  }

  void _info(BuildContext context, int i) {
    if (i < 4) {
      final p = _platforms[i];
      _openInfo(context,
          icon: Icons.layers_rounded,
          color: CM.sandalInk,
          kicker: 'Existing solutions',
          title: p[1],
          lead: p[2],
          rows: [_Row('What they do', p[3]), const _Row('The gap', 'Each one solves a single stage. CareerMate connects skills, learning, collaboration, internships and placements.')]);
    } else {
      _openInfo(context,
          icon: Icons.hub_rounded,
          color: CM.blue,
          kicker: 'CareerMate',
          title: 'One profile. One skill journey. Every opportunity.',
          rows: const [_Row('What it unifies', 'Skill mapping, learning, opportunities, recruitment and academia–industry collaboration.')]);
    }
  }

  Widget _header(BuildContext context) {
    const icons = [Icons.event_rounded, Icons.work_rounded, Icons.menu_book_rounded, Icons.share_rounded];
    return SizedBox(
      height: 66,
      child: Row(children: [
        const Expanded(flex: 6, child: SizedBox.shrink()),
        for (var i = 0; i < 5; i++)
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(color: i == 4 ? CM.blueSoft : null, borderRadius: i == 4 ? const BorderRadius.vertical(top: Radius.circular(14)) : null),
              child: _Tap(
                radius: 14,
                onTap: () => _info(context, i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    if (i < 4) Icon(icons[i], size: 18, color: CM.ink) else const _Logo(size: 22),
                    const SizedBox(height: 4),
                    FittedBox(fit: BoxFit.scaleDown, child: Text(i < 4 ? _platforms[i][0] : 'CM', style: _ts(10.5, w: FontWeight.w800, c: i == 4 ? CM.blue : CM.ink))),
                  ]),
                ),
              ),
            ),
          ),
      ]),
    );
  }

  Widget _row(String label, List<int> v, bool last) => Container(
        height: 56,
        decoration: BoxDecoration(border: Border(top: const BorderSide(color: CM.line), bottom: last ? BorderSide.none : BorderSide.none)),
        child: Row(children: [
          Expanded(flex: 6, child: Padding(padding: const EdgeInsets.only(right: 6), child: Align(alignment: Alignment.centerLeft, child: Text(label, style: _ts(12, w: FontWeight.w700, h: 1.25))))),
          for (var i = 0; i < 5; i++)
            Expanded(
              flex: 2,
              child: Container(
                color: i == 4 ? CM.blueSoft : null,
                alignment: Alignment.center,
                child: _cell(v[i], i == 4),
              ),
            ),
        ]),
      );

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _rv(const _Head(kicker: 'WHY NOT WHAT ALREADY EXISTS', title: 'Great platforms. Each solves one stage.', sub: 'Tap a column to see who they are. CareerMate is the one that connects the stages.')),
        const SizedBox(height: 36),
        _rv(_Lift(
          radius: 24,
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
          child: Column(children: [
            _header(context),
            for (var i = 0; i < _caps.length; i++) _row(_caps[i].$1, _caps[i].$2, i == _caps.length - 1),
            const SizedBox(height: 4),
          ]),
        )),
        const SizedBox(height: 16),
        _rv(Wrap(spacing: 18, runSpacing: 10, crossAxisAlignment: WrapCrossAlignment.center, children: [
          Row(mainAxisSize: MainAxisSize.min, children: [_cell(2, false), const SizedBox(width: 8), Text('Core focus', style: _ts(12, c: CM.text2, w: FontWeight.w600))]),
          Row(mainAxisSize: MainAxisSize.min, children: [_cell(1, false), const SizedBox(width: 8), Text('Partial', style: _ts(12, c: CM.text2, w: FontWeight.w600))]),
          Row(mainAxisSize: MainAxisSize.min, children: [_cell(0, false), const SizedBox(width: 8), Text('Not the focus', style: _ts(12, c: CM.text2, w: FontWeight.w600))]),
        ])),
      ]);
}


class _Layer {
  const _Layer(this.name, this.icon, this.techs, this.detail);
  final String name, detail;
  final IconData icon;
  final List<String> techs;
}

const List<_Layer> _layers = [
  _Layer('Client', Icons.phone_iphone_rounded, ['Flutter', 'Dart'], 'Flutter builds the cross-platform interface and Dart runs the app logic and interactions.'),
  _Layer('API', Icons.api_rounded, ['Express.js', 'Node.js', 'TypeScript'], 'Express handles REST requests, Node.js processes them and TypeScript keeps the backend type-safe.'),
  _Layer('Data', Icons.storage_rounded, ['PostgreSQL'], 'Stores users, skills, opportunities, applications, profiles and platform data.'),
  _Layer('Matching', Icons.hub_rounded, ['Recommendation engine'], 'Matching connects the right opportunities to the right profiles.'),
  _Layer('Notify', Icons.notifications_active_rounded, ['Firebase Cloud Messaging'], 'Real-time push notifications for opportunities, applications, updates and announcements.'),
  _Layer('Ship', Icons.rocket_launch_rounded, ['GitHub', 'Vercel', 'Render'], 'GitHub manages the codebase. Vercel and Render deploy everything.'),
];

const List<String> _journey = [
  'User opens the app',
  'Flutter handles the interface',
  'Dart runs the app logic',
  'Express handles API requests',
  'Node.js processes the requests',
  'PostgreSQL stores platform data',
  'Matching connects the right opportunities',
  'FCM sends timely notifications',
  'GitHub manages the codebase',
  'Vercel and Render deploy everything',
];

const List<int> _journeyLayer = [0, 0, 0, 1, 1, 2, 3, 4, 5, 5];

class _TechStack extends StatefulWidget {
  const _TechStack();
  @override
  State<_TechStack> createState() => _TechStackState();
}

class _TechStackState extends State<_TechStack> {
  int _i = 0;
  int _tok = 0;
  bool _run = false;

  @override
  void dispose() {
    _tok++;
    super.dispose();
  }

  Future<void> _auto() async {
    final t = ++_tok;
    setState(() => _run = true);
    for (var k = 0; k < _journey.length; k++) {
      if (!mounted || t != _tok) return;
      setState(() => _i = k);
      await Future<void>.delayed(const Duration(milliseconds: 1200));
    }
    if (mounted && t == _tok) setState(() => _run = false);
  }

  void _stop() {
    _tok++;
    if (_run) setState(() => _run = false);
  }

  void _go(int k) {
    _stop();
    setState(() => _i = k.clamp(0, _journey.length - 1));
  }

  Widget _layerRow(int i) {
    final l = _layers[i];
    final on = _journeyLayer[_i] == i;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        decoration: BoxDecoration(color: on ? CM.blue : CM.white, borderRadius: BorderRadius.circular(18), border: Border.all(color: on ? CM.blue : CM.line), boxShadow: on ? _sh(.16, 26, 10) : null),
        child: _Tap(
          radius: 18,
          onTap: () {
            _stop();
            _openInfo(context, icon: l.icon, color: CM.blue, kicker: 'Layer ${i + 1}', title: l.name, lead: l.detail, chips: l.techs);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(width: 40, height: 40, decoration: BoxDecoration(color: on ? CM.white.withValues(alpha: .16) : CM.blueSoft, borderRadius: BorderRadius.circular(12)), child: Icon(l.icon, size: 20, color: on ? CM.white : CM.blue)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(l.name, style: _ts(15, w: FontWeight.w800, c: on ? CM.white : CM.ink)),
                  const SizedBox(height: 7),
                  Wrap(spacing: 6, runSpacing: 6, children: [
                    for (final t in l.techs) _Pill(t, small: true, bg: on ? CM.white.withValues(alpha: .16) : CM.sandalSoft, fg: on ? CM.white : CM.sandalInk),
                  ]),
                ]),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _journeyCard() => _Lift(
        radius: 24,
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('ONE REQUEST, TEN STEPS', style: _ts(10.5, w: FontWeight.w800, c: CM.text3, ls: 1.3)),
          const SizedBox(height: 14),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text((_i + 1).toString().padLeft(2, '0'), style: _ts(56, w: FontWeight.w800, c: CM.blue, ls: -2, h: 1)),
            const SizedBox(width: 8),
            Padding(padding: const EdgeInsets.only(bottom: 8), child: Text('/ 10', style: _ts(15, c: CM.text3, w: FontWeight.w700))),
          ]),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: _switcher(Text(_journey[_i], style: _ts(20, w: FontWeight.w800, ls: -.3, h: 1.25)), _i),
          ),
          const SizedBox(height: 14),
          Wrap(spacing: 6, runSpacing: 6, children: [
            for (var k = 0; k < _journey.length; k++)
              GestureDetector(
                onTap: () => _go(k),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: k == _i ? CM.blue : (k < _i ? CM.greenSoft : CM.sandalSoft), shape: BoxShape.circle),
                  child: Text('${k + 1}', style: _ts(11.5, w: FontWeight.w800, c: k == _i ? CM.white : (k < _i ? CM.greenDeep : CM.text2))),
                ),
              ),
          ]),
          const SizedBox(height: 20),
          Wrap(spacing: 10, runSpacing: 10, crossAxisAlignment: WrapCrossAlignment.center, children: [
            _Btn(_run ? 'Pause' : 'Play the journey', icon: _run ? Icons.pause_rounded : Icons.play_arrow_rounded, small: true, onTap: _run ? _stop : _auto),
            IconButton(onPressed: _i == 0 ? null : () => _go(_i - 1), icon: const Icon(Icons.skip_previous_rounded), tooltip: 'Previous step'),
            IconButton(onPressed: _i == _journey.length - 1 ? null : () => _go(_i + 1), icon: const Icon(Icons.skip_next_rounded), tooltip: 'Next step'),
          ]),
        ]),
      );

  @override
  Widget build(BuildContext context) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _rv(const _Head(kicker: 'THE STACK', title: 'Practical, open and built to scale.', sub: 'Follow a single request down through the layers, or tap a layer to see what it does.')),
        const SizedBox(height: 40),
        _Adaptive(at: 900, gap: 24, flex: const [6, 5], children: [
          _rv(Column(children: [for (var i = 0; i < _layers.length; i++) _layerRow(i)])),
          _rv(_journeyCard(), delay: 120),
        ]),
      ]);
}

 
class _Val {
  const _Val(this.value, this.decimals, this.suffix, this.name, this.line, this.ref, this.icon);
  final double value;
  final int decimals, ref;
  final String suffix, name, line;
  final IconData icon;
}

const List<_Val> _vals = [
  _Val(79.5, 1, 'L+', 'AICTE Internship Portal', 'internships from 83K+ companies', 8, Icons.badge_rounded),
  _Val(32, 0, 'M+', 'Internshala', 'candidate profiles, 250K+ companies', 9, Icons.people_alt_rounded),
  _Val(6.6, 1, 'L+', 'SWAYAM Plus', 'learners, 500+ courses, 77 industry partners', 7, Icons.school_rounded),
  _Val(1.45, 2, 'Cr+', 'National Career Service', 'new jobseekers in FY 2024–25', 6, Icons.trending_up_rounded),
];

class _Pt {
  const _Pt(this.icon, this.title, this.text);
  final IconData icon;
  final String title, text;
}

const List<_Pt> _feas = [
  _Pt(Icons.build_circle_rounded, 'Technically feasible', 'Flutter, Node.js, PostgreSQL and a recommendation engine cover the full platform.'),
  _Pt(Icons.savings_rounded, 'Cost effective', 'An open-source stack keeps server costs low.'),
  _Pt(Icons.open_in_full_rounded, 'Scalable', 'Role-based, API-driven architecture expands across institutions and industries.'),
  _Pt(Icons.checklist_rounded, 'Implementable', 'Assessment, matching, applications, portfolios and analytics all use established technology.'),
];

const List<_Pt> _viab = [
  _Pt(Icons.trending_up_rounded, 'Proven demand', 'NCS recorded 1.45Cr+ new jobseekers and 17L+ new employers in FY 2024–25.'),
  _Pt(Icons.account_balance_rounded, 'Institutional fit', 'Government platforms already connect education, skills, internships and employment digitally.'),
  _Pt(Icons.groups_rounded, 'Scalable adoption', 'One role-based platform serves students, academicians, institutions and industries.'),
  _Pt(Icons.public_rounded, 'Market potential', 'Multi-million-user platforms show strong demand for skilling, matching and recruitment.'),
];

class _Proof extends StatefulWidget {
  const _Proof();
  @override
  State<_Proof> createState() => _ProofState();
}

class _ProofState extends State<_Proof> {
  bool _via = false;

  @override
  Widget build(BuildContext context) {
    final pts = _via ? _viab : _feas;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _rv(const _Head(kicker: 'FEASIBILITY AND VIABILITY', title: 'The demand is proven. The stack is ready.', sub: 'Existing platforms validate the need. CareerMate connects what they keep separate.')),
      const SizedBox(height: 36),
      _Grid(minTile: 240, gap: 16, children: [
        for (var i = 0; i < _vals.length; i++)
          _Reveal(
            delay: i * 100,
            builder: (c, shown) {
              final v = _vals[i];
              return AnimatedOpacity(
                opacity: shown ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: _Lift(
                  radius: 22,
                  padding: const EdgeInsets.all(20),
                  onTap: () => _openRefs(context, highlight: v.ref),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      _IconBadge(v.icon, CM.blue, size: 38),
                      const Spacer(),
                      _Pill('SOURCE [${v.ref}]', small: true, bg: CM.sandalSoft, fg: CM.sandalInk),
                    ]),
                    const SizedBox(height: 14),
                    _CountUp(value: v.value, decimals: v.decimals, suffix: v.suffix, run: shown, style: _ts(44, w: FontWeight.w800, c: CM.blue, ls: -1.6, h: 1)),
                    const SizedBox(height: 8),
                    Text(v.name, style: _ts(14, w: FontWeight.w800)),
                    const SizedBox(height: 2),
                    Text(v.line, style: _ts(12.5, c: CM.text2, h: 1.4)),
                  ]),
                ),
              );
            },
          ),
      ]),
      const SizedBox(height: 32),
      _rv(Wrap(spacing: 8, runSpacing: 8, children: [
        _SelChip('Feasibility', icon: Icons.build_circle_rounded, selected: !_via, onTap: () => setState(() => _via = false)),
        _SelChip('Viability', icon: Icons.trending_up_rounded, selected: _via, onTap: () => setState(() => _via = true)),
      ])),
      const SizedBox(height: 16),
      _switcher(
        _Grid(key: ValueKey(_via), minTile: 260, gap: 14, children: [
          for (final p in pts)
            _Lift(
              radius: 20,
              padding: const EdgeInsets.all(18),
              color: CM.sandalSoft,
              shadow: false,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _IconBadge(p.icon, _via ? CM.blue : CM.green, size: 38),
                const SizedBox(height: 12),
                Text(p.title, style: _ts(15.5, w: FontWeight.w800, h: 1.2)),
                const SizedBox(height: 4),
                Text(p.text, style: _ts(13, c: CM.text2, h: 1.45)),
              ]),
            ),
        ]),
        _via,
      ),
    ]);
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.onTour, required this.onPhilosophy, required this.onTop});
  final VoidCallback onTour, onPhilosophy, onTop;
  @override
  Widget build(BuildContext context) => _Sec(
        bg: CM.ink,
        vPad: 64,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            const _Logo(size: 44),
            const SizedBox(width: 12),
            Flexible(child: Text('CareerMate', maxLines: 1, overflow: TextOverflow.ellipsis, style: _ts(26, w: FontWeight.w800, c: CM.white, ls: -.6))),
          ]),
          const SizedBox(height: 18),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text('One profile. One skill journey. Every opportunity.', style: _ts(28, w: FontWeight.w800, c: CM.white, h: 1.15, ls: -.6)),
          ),
          const SizedBox(height: 26),
          Wrap(spacing: 12, runSpacing: 12, children: [
            _Btn('Replay the tour', icon: Icons.play_arrow_rounded, onTap: onTour),
            _Btn('Read the philosophy', icon: Icons.auto_awesome_rounded, kind: _BK.sandal, onTap: onPhilosophy),
            _Btn('Back to top', icon: Icons.arrow_upward_rounded, kind: _BK.outlineLight, onTap: onTop),
          ]),
          const SizedBox(height: 36),
          Container(height: 1, color: CM.white.withValues(alpha: .12)),
          const SizedBox(height: 22),
          Wrap(spacing: 8, runSpacing: 8, children: const [
            _Pill('SIH 2026', small: true, bg: CM.white, fg: CM.ink),
            _Pill('SIH26044', small: true, bg: CM.sandal, fg: CM.ink),
            _Pill('SMART AUTOMATION', small: true, bg: CM.blue, fg: CM.white),
            _Pill('SOFTWARE', small: true, bg: CM.green, fg: CM.white),
            _Pill('TEAM TECH VECTORS', small: true, bg: CM.white, fg: CM.ink),
          ]),
          const SizedBox(height: 16),
          Text('Portal for Academia–Industry Collaboration for Skill Mapping, Internships and Placement.', style: _ts(13.5, c: CM.white.withValues(alpha: .72), h: 1.5)),
          const SizedBox(height: 8),
          Text('Pre-product preview. Screens are working illustrations and all figures marked illustrative are sample data.', style: _ts(12, c: CM.white.withValues(alpha: .5), h: 1.5)),
        ]),
      );
}