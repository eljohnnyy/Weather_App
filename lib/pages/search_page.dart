import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fristproject/pages/home_page.dart';
import 'package:fristproject/provider/weather_provider.dart';

import 'package:fristproject/services/weather_services.dart';
import 'package:fristproject/weather_cubit/cubit.dart';
import 'package:provider/provider.dart';

import 'models/weather_model.dart';

class Search extends StatelessWidget {

String? cityname;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Search a City'),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              
              onChanged: (value) {
                cityname=value;
              },
              onSubmitted: (value) async{
                cityname=value;
              BlocProvider.of<CubitWeather>(context).getweather(cityname: cityname!);
              BlocProvider.of<CubitWeather>(context).cityname=cityname;
              Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                suffix: GestureDetector(
                  onTap: ()async {
                      BlocProvider.of<CubitWeather>(context).getweather(cityname: cityname!);
                       BlocProvider.of<CubitWeather>(context).cityname=cityname;
              Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
                label: Text('Search'),
                border: OutlineInputBorder(),
                hintText: 'Enter City Name',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
