import 'package:flutter_test/flutter_test.dart';
import 'package:liquid_simulation/temperature_model.dart';

void main() {
  const temp = 19;
  const step = 5;

  late TemperatureModel model;

  setUp(() {
    // Runs once per test
    model = TemperatureModel();
  });

  test('initial value is 19', () {
    expect(model.temperature, temp);
  });

  test('The temperature should increment in 5 degree steps', () {
    expect(model.temperature, temp);

    model.increment();

    expect(model.temperature, temp + step);
  });
  test('The temperature should decrement in 5 degree steps', () {
    expect(model.temperature, temp);

    model.decrement();

    expect(model.temperature, temp - step);
  });

  test('When incremented twice, the temperature should have increased by 10', () {
    expect(model.temperature, temp);

    model.increment();
    model.increment();

    const expected = temp + (step * 2);

    expect(model.temperature, expected);
  });

  test('When decremented twice, the temperature should have decreased by 10', () {
    expect(model.temperature, temp);

    model.decrement();
    model.decrement();

    const expected = temp - (step * 2);

    expect(model.temperature, expected);
  });
}
