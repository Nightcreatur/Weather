part of 'bloc_bloc.dart';

sealed class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends BlocEvent {
  final Position position;

  const FetchWeather({required this.position});

  @override
  List<Object> get props => [position];
}
