import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fristproject/pages/home_page.dart';
import 'package:fristproject/provider/weather_provider.dart';
import 'package:fristproject/services/weather_services.dart';
import 'package:fristproject/weather_cubit/cubit.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
      return  CubitWeather(Weatherservices());
      },
    
    child:WeatherApp()));
    
    }


class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
     
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: BlocProvider.of<CubitWeather>(context).weathermodel==null?Colors.blue:BlocProvider.of<CubitWeather>(context).weathermodel!.getcolor()
        ),
       home: HomePage(),
      );
    
  }
}
