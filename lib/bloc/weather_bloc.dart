import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_repository/weather_repository.dart';
import './bloc.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc({@required WeatherRepository weatherRepository})
      : assert(weatherRepository != null),
        _weatherRepository = weatherRepository;

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
    WeatherRequested event,
  ) async* {
    yield WeatherLoadInProgress();
    try {
      final weather = await _weatherRepository.getWeather(
        city: event.city,
      );
      yield WeatherLoadSuccess(weather: weather);
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }
}
