import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_simulation/hazardous_liquid.dart';
import 'package:liquid_simulation/key_constants.dart';
import 'package:liquid_simulation/main.dart';

import 'finders.dart';

void main() {
  const double temp = 19.0;
  const int step = 5;

  testWidgets('Starts with 19.0°C', (tester) async {
    await tester.pumpWidget(LabApp());
    expect(find.text('$temp°C'), findsOneWidget);
  });

  testWidgets('74.0°C is orange', (tester) async {
    await tester.pumpWidget(LabApp());

    // Find our TextField on the page
    final textFieldFinder = find.byType(TextField);

    // Expect that we found one TextField
    expect(textFieldFinder, findsOneWidget);

    // Enter 74.0 into the TextField
    await tester.enterText(textFieldFinder, '74');

    // Find the Confirm button
    final confirmButtonFinder = find.byKey(AppKeys.confirmButtonKey);

    // Expect that we found one Confirm button
    expect(confirmButtonFinder, findsOneWidget);

    // Tap the Confirm button
    await tester.tap(confirmButtonFinder);

    // Hydrate UI with button
    await tester.pump();

    // Wait for the TextField to be updated
    await tester.pump(const Duration(seconds: 6));

    // Find the liquid container
    final Finder liquidFinder = find.descendant(
      of: find.byType(HazardousLiquid),
      matching: find.byType(LiquidContainer),
    );

    find.byType(Container);

    // Expect that we found one Liquid container
    expect(liquidFinder, findsOneWidget);

    // Create a reference to the container
    final container = tester.widget<LiquidContainer>(liquidFinder);

    // Expect the liquid color to be orange
    expect(container.color, const Color(0xffffac26));
  });

  testWidgets('Pressing the + button increments the temperature', (tester) async {
    await tester.pumpWidget(LabApp());

    // Find our Increment Button on the page
    final incrementButtonFinder = find.byType(IncrementButton);

    // Expect that we found one Increment Button
    expect(incrementButtonFinder, findsOneWidget);

    // Tap the Increment Button
    await tester.tap(incrementButtonFinder);

    // Hydrate UI with button
    await tester.pump();

    // Expect the UI to show the new temperature
    const expectedText = '${temp + step}°C';
    expect(find.text(expectedText), findsOneWidget);
  });

  testWidgets('Pressing the - button decrements the temperature', (tester) async {
    await tester.pumpWidget(LabApp());

    // Find our Increment Button on the page
    final decrementButtonFinder = find.byType(DecrementButton);

    // Expect that we found one Decrement Button
    expect(decrementButtonFinder, findsOneWidget);

    // Tap the Decrement Button
    await tester.tap(decrementButtonFinder);

    // Hydrate UI with button
    await tester.pump();

    // Expect the UI to show the new temperature
    const expectedText = '${temp - step}°C';
    expect(find.text(expectedText), findsOneWidget);
  });

  testWidgets('TextField should start off with a default value of 19', (tester) async {
    // Pump the LabApp widget
    await tester.pumpWidget(LabApp());

    // Find our TextField on the page
    final textFieldFinder = find.expectAndFind(TextField);

    // Expect that the value of the TextField is 19
    expect(tester.widget<TextField>(textFieldFinder).controller?.text, temp.toStringAsFixed(0));
  });

  testWidgets('Pressing the + button changes the text field to show the new temperature', (tester) async {
    await tester.pumpWidget(LabApp());

    // Find our TextField on the page
    final textFieldFinder = find.expectAndFind(TextField);

    // Expect that the value of the TextField is 19
    expect(tester.widget<TextField>(textFieldFinder).controller?.text, temp.toStringAsFixed(0));

    // Find our Increment Button on the page
    final incrementButtonFinder = find.expectAndFind(IncrementButton);

    // Tap the Increment Button
    await tester.tap(incrementButtonFinder);

    // Hydrate UI with button
    await tester.pump();

    // Expect the value of the TextField to be 24
    expect(
      tester.widget<TextField>(textFieldFinder).controller?.text,
      (temp + step).toStringAsFixed(0),
    );
  });

  testWidgets('Pressing the - button changes the text field to show the new temperature', (tester) async {
    await tester.pumpWidget(LabApp());

    // Find our TextField on the page
    final textFieldFinder = find.expectAndFind(TextField);

    // Expect that the value of the TextField is 19
    expect(tester.widget<TextField>(textFieldFinder).controller?.text, temp.toStringAsFixed(0));

    // Find our Decrement Button on the page
    final decrementButtonFinder = find.expectAndFind(DecrementButton);

    // Tap the Decrement Button
    await tester.tap(decrementButtonFinder);

    // Hydrate UI with button
    await tester.pump();

    // Expect the value of the TextField to be 16
    expect(
      tester.widget<TextField>(textFieldFinder).controller?.text,
      (temp - step).toStringAsFixed(0),
    );
  });
}
