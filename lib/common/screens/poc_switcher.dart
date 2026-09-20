// ============================================================================
//  CareerMate — Universal POC switcher
//  SIH26044 · Team Tech Vectors
//
//  The three landing screens beside this file are three independent proof-of-
//  concept builds of the same product, each written by a different AI model.
//  Every one of them exports its own `LandingScreen` (plus its own palette and
//  helper classes), so they are imported here behind library prefixes and are
//  hosted one at a time by [PocSwitcher].
//
//  One universal bar sits above whichever build is running. It carries the
//  three buttons `POC-model-1`, `POC-model-2` and `POC-model-3`; tapping one
//  swaps the whole running model without leaving the app, so all three full
//  operations stay reachable from a single entry point.
// ============================================================================

import 'package:flutter/material.dart';

import 'landing-screen.dart' as poc1;
import 'landing-screen-2.dart' as poc2;
import 'landing-screen-3.dart' as poc3;

// ─────────────────────────────────────────────────────────────────────────────
//  MODEL REGISTRY
// ─────────────────────────────────────────────────────────────────────────────

/// One entry per proof-of-concept build.
class _PocEntry {
  const _PocEntry({
    required this.label,
    required this.note,
    required this.accent,
    required this.build,
  });

  /// Caption on the top-bar button, e.g. `POC-model-1`.
  final String label;

  /// One-line description, shown in the bar and in the about sheet.
  final String note;

  /// Accent of this build, used for its button and for the bar mark.
  final Color accent;

  /// Builds the root widget of this model.
  final Widget Function() build;
}

const Color _barInk = Color(0xFF0B0F1A);
const Color _barLine = Color(0x1AFFFFFF);

// ─────────────────────────────────────────────────────────────────────────────
//  SWITCHER SHELL
// ─────────────────────────────────────────────────────────────────────────────

/// Hosts every proof-of-concept landing screen behind one universal top bar.
class PocSwitcher extends StatefulWidget {
  const PocSwitcher({super.key});

  @override
  State<PocSwitcher> createState() => _PocSwitcherState();
}

class _PocSwitcherState extends State<PocSwitcher> {
  static final List<_PocEntry> _models = <_PocEntry>[
    _PocEntry(
      label: 'POC-model-1',
      note: 'Model 1 · explainer walkthrough',
      accent: const Color(0xFF214CDF),
      build: () => const poc1.LandingScreen(),
    ),
    _PocEntry(
      label: 'POC-model-2',
      note: 'Model 2 · component-library build',
      accent: const Color(0xFF0B2B7A),
      build: () => const poc2.LandingScreen(),
    ),
    _PocEntry(
      label: 'POC-model-3',
      note: 'Model 3 · cinematic app-flow build',
      accent: const Color(0xFF0A7A4D),
      build: () => const poc3.LandingScreen(),
    ),
  ];

  int _active = 0;

  void _select(int index) {
    if (index == _active) return;
    setState(() => _active = index);
  }

  @override
  Widget build(BuildContext context) {
    final _PocEntry model = _models[_active];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _PocBar(models: _models, active: _active, onSelect: _select),
          Expanded(
            // Each hosted build paints its own status-bar inset. The universal
            // bar above already covers that strip, so the inset is dropped for
            // the hosted screen instead of being reserved a second time.
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: KeyedSubtree(
                key: ValueKey<int>(_active),
                child: model.build(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  UNIVERSAL TOP BAR
// ─────────────────────────────────────────────────────────────────────────────

/// The universal bar: a brand mark, a caption, the three model buttons and an
/// about button that explains what the three builds are.
class _PocBar extends StatelessWidget {
  const _PocBar({
    required this.models,
    required this.active,
    required this.onSelect,
  });

  final List<_PocEntry> models;
  final int active;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _barInk,
      child: SafeArea(
        bottom: false,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: _barLine)),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints c) {
              final bool compact = c.maxWidth < 760;
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  compact ? 8 : 16, 7, compact ? 8 : 16, 7,
                ),
                child: Row(
                  children: <Widget>[
                    if (!compact) ...<Widget>[
                      _PocMark(accent: models[active].accent),
                      const SizedBox(width: 10),
                      Flexible(child: _PocCaption(note: models[active].note)),
                      const SizedBox(width: 16),
                    ] else
                      const SizedBox(width: 4),
                    Flexible(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (int i = 0; i < models.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(left: i == 0 ? 0 : 6),
                                  child: _PocTab(
                                    label: models[i].label,
                                    selected: i == active,
                                    accent: models[i].accent,
                                    onTap: () => onSelect(i),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (!compact) ...<Widget>[
                      const SizedBox(width: 10),
                      _AboutButton(onTap: () => _showAbout(context)),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showAbout(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext sheet) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Three models, one app',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              const Text(
                'Each button in the top bar runs a complete proof of concept of '
                'CareerMate, written by a different AI model. Its operations, '
                'screens and animations are exactly as that model built them.',
                style: TextStyle(fontSize: 12.5, height: 1.4, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              for (int i = 0; i < models.length; i++)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: _PocMark(accent: models[i].accent, size: 36),
                  title: Text(
                    models[i].label,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(models[i].note, style: const TextStyle(fontSize: 11.5)),
                  trailing: i == active
                      ? const Icon(Icons.check_circle_rounded,
                          size: 18, color: Color(0xFF12A46A))
                      : const Icon(Icons.arrow_forward_rounded,
                          size: 18, color: Colors.black38),
                  onTap: () {
                    Navigator.of(sheet).pop();
                    onSelect(i);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Brand caption of the universal bar.
class _PocCaption extends StatelessWidget {
  const _PocCaption({required this.note});

  final String note;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'CareerMate · universal POC switcher',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: .2,
            ),
          ),
          Text(
            note,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.white54,
            ),
          ),
        ],
      );
}

/// Accent tile with the CareerMate hub mark, used as the bar's brand.
class _PocMark extends StatelessWidget {
  const _PocMark({required this.accent, this.size = 28});

  final Color accent;
  final double size;

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: accent,
          borderRadius: BorderRadius.circular(size * .3),
        ),
        child: Icon(Icons.hub_rounded, size: size * .55, color: Colors.white),
      );
}

/// The universal about button of the bar.
class _AboutButton extends StatelessWidget {
  const _AboutButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Tooltip(
        message: 'About these POC models',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(9),
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: _barLine),
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(
                Icons.info_outline_rounded,
                size: 16,
                color: Colors.white70,
              ),
            ),
          ),
        ),
      );
}

/// One `POC-model-n` button of the universal bar.
class _PocTab extends StatelessWidget {
  const _PocTab({
    required this.label,
    required this.selected,
    required this.accent,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Semantics(
        button: true,
        selected: selected,
        label: selected ? '$label, running now' : 'Run $label',
        child: Tooltip(
          message: selected ? '$label · running now' : 'Run $label',
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(9),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: selected ? accent : Colors.transparent,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: selected ? accent : _barLine),
                ),
                child: Text(
                  label,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .3,
                    color: selected ? Colors.white : Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

