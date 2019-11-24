import 'package:bloc_test/bloc_test.dart';
import 'package:codemagic_bloc_unit_tests/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_repository/weather_repository.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('WeatherBloc', () {
    WeatherRepository weatherRepository;
    WeatherBloc weatherBloc;

    setUp(() {
      weatherRepository = MockWeatherRepository();
      weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
    });

    test('throws AssertionError if WeatherRepository is null', () {
      expect(
        () => WeatherBloc(weatherRepository: null),
        throwsA(isAssertionError),
      );
    });

    group('WeatherRequested', () {
      blocTest(
        'emits [WeatherInitial, WeatherLoadInProgress, WeatherLoadSuccess] when WeatherRequested is added and getWeather succeeds',
        build: () {
          when(weatherRepository.getWeather(city: 'Chicago')).thenAnswer(
            (_) => Future.value(
              Weather(
                temperature: 10,
                condition: Condition.cloudy,
              ),
            ),
          );
          return weatherBloc;
        },
        act: (bloc) => bloc.add(WeatherRequested(city: 'Chicago')),
        expect: [
          WeatherInitial(),
          WeatherLoadInProgress(),
          WeatherLoadSuccess(
            weather: Weather(
              temperature: 10,
              condition: Condition.cloudy,
            ),
          ),
        ],
      );

      blocTest(
        'emits [WeatherInitial, WeatherLoadInProgress, WeatherLoadFailure] when WeatherRequested is added and getWeather fails',
        build: () {
          when(weatherRepository.getWeather(city: 'Chicago')).thenThrow('oops');
          return weatherBloc;
        },
        act: (bloc) => bloc.add(WeatherRequested(city: 'Chicago')),
        expect: [
          WeatherInitial(),
          WeatherLoadInProgress(),
          WeatherLoadFailure(),
        ],
      );
    });
  });
}
