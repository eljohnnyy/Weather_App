import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristproject/pages/models/weather_model.dart';
import 'package:fristproject/services/weather_services.dart';
import 'package:fristproject/weather_cubit/weather_states.dart';

class CubitWeather extends Cubit<WeatherState>{
  CubitWeather(this.weatherservices):super(WeatherStart());
Weatherservices weatherservices;
WeatherModel? weathermodel;
String? cityname;
void getweather({required String cityname})async{
emit(WeatherLoading());
try {
  weathermodel=await weatherservices.getweather(CityName: cityname);
  emit(WeatherSuccess());

}on Exception catch(e){
  emit(WeatherFailure());
}


}
}