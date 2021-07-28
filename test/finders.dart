import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_simulation/hazardous_liquid.dart';
import 'package:liquid_simulation/main.dart';

final Finder liquidFinder = find.descendant(
  of: find.byType(HazardousLiquid),
  matching: find.byType(Container),
);

final incrementButtonFinder = expectAndFind(IncrementButton);
final decrementButtonFinder = expectAndFind(DecrementButton);

Finder expectAndFind(Type type) {
  // Find the Type on the page
  final found = find.byType(type);

  expect(found, findsOneWidget);

  return found;
}

extension ExpectAndFind on CommonFinders {
  Finder expectAndFind(Type type) {
    // Find the Type on the page
    final found = find.byType(type);

    expect(found, findsOneWidget);

    return found;
  }
}
