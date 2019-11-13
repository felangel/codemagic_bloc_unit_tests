import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather_repository/weather_repository.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Weather weather;

  const WeatherLoadSuccess({@required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailure extends WeatherState {}
