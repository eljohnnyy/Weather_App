import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fristproject/pages/search_page.dart';
import 'package:fristproject/provider/weather_provider.dart';
import 'package:fristproject/weather_cubit/cubit.dart';
import 'package:fristproject/weather_cubit/weather_states.dart';
import 'package:provider/provider.dart';

import 'models/weather_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
WeatherModel? weatherdata;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Search();
                }));
              },
              icon: Icon(Icons.search)),
        ],
        title: Text('Weather App'),
      ),
      body: BlocBuilder<CubitWeather,WeatherState>(builder:(context,state){
if(state is WeatherLoading){
return Center(
  child: CircularProgressIndicator(),
);
}
else if(state is WeatherSuccess){
  weatherdata=BlocProvider.of<CubitWeather>(context).weathermodel;
  return  Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [weatherdata!.getcolor(),weatherdata!.getcolor()[300]!,weatherdata!.getcolor()[100]!],begin: Alignment.topCenter,end: Alignment.bottomCenter),
                
                
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                  BlocProvider.of<CubitWeather>(context).cityname! ,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'updated at: ${weatherdata!.date}',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherdata!.getimage()),
                      Text(
                       '${weatherdata!.temp.toInt()}',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('MaxTemp: ${weatherdata!.maxtemp.toInt()}'),
                          Text('MinTemp: ${weatherdata!.mintem.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                   weatherdata!.weatherstate,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
}
else if(state is WeatherFailure){
  return  Center(child: Text('something went wrong please try again'),);
  
  
  
}
else{
  return  Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
}

      })

    );
  }
}
