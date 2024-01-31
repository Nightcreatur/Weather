import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weathers/data/global.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(BlocLoading());
      try {
        WeatherFactory wt = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wt.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(BlocSucess(weather));
        print(weather);
      } catch (e) {
        emit(BlocFailuer());
      }
    });
  }
}
