part of 'bloc_bloc.dart';

sealed class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object> get props => [];
}

final class BlocInitial extends BlocState {}

final class BlocLoading extends BlocState {}

final class BlocFailuer extends BlocState {}

final class BlocSucess extends BlocState {
  final Weather weather;
  const BlocSucess(this.weather);

  @override
  List<Object> get props => [weather];
}
