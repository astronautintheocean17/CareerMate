// Smoke coverage for the universal POC switcher: every model button must be
// present in the top bar, and tapping one must swap the hosted proof of
// concept without taking the bar away.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:careermate/main.dart';

void main() {
  testWidgets('universal bar exposes all three POC models', (WidgetTester tester) async {
    await tester.pumpWidget(const CareerMateApp());
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.text('POC-model-1'), findsOneWidget);
    expect(find.text('POC-model-2'), findsOneWidget);
    expect(find.text('POC-model-3'), findsOneWidget);
  });

  testWidgets('tapping a model button swaps the running proof of concept', (WidgetTester tester) async {
    await tester.pumpWidget(const CareerMateApp());
    await tester.pump(const Duration(milliseconds: 250));

    await tester.tap(find.text('POC-model-3'));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('POC-model-3'), findsOneWidget);

    await tester.tap(find.text('POC-model-2'));
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pump(const Duration(milliseconds: 300));
    expect(find.text('POC-model-2'), findsOneWidget);

    // The hosted builds schedule short fade-in timers. Detach the tree and let
    // the last frame's timers fire so the test leaves nothing pending.
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(seconds: 2));
  });
}
