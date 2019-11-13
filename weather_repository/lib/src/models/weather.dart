import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum Condition { sunny, rainy, cloudy }

class Weather extends Equatable {
  final double temperature;
  final Condition condition;

  const Weather({
    @required this.temperature,
    @required this.condition,
  });

  @override
  List<Object> get props => [temperature, condition];
}
