import 'package:codemagic_bloc_unit_tests/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherEvent', () {
    group('WeatherRequested', () {
      test('returns correct props', () {
        expect(WeatherRequested(city: 'Chicago').props, ['Chicago']);
      });
    });
  });
}
