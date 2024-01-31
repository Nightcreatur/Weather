import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weathers/bloc/bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget getWeatherIcon(int code) {
  switch (code) {
    case > 200 && <= 300:
      return Image.asset('assets/1.png');
    case >= 300 && < 400:
      return Image.asset('assets/2.png');
    case >= 500 && < 600:
      return Image.asset('assets/3.png');
    case >= 600 && < 700:
      return Image.asset('assets/4.png');
    case >= 700 && < 800:
      return Image.asset('assets/5.png');
    case == 800:
      return Image.asset('assets/6.png');
    case > 800 && <= 805:
      return Image.asset('assets/8.png');

    default:
  }
  return Image.asset('assets/7.png');
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: BlocBuilder<BlocBloc, BlocState>(
          builder: (context, state) {
            if (state is BlocSucess) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-3, 0),
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 229, 54, 241)),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(3, 0),
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 189, 41, 172)),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, -1.2),
                      child: Container(
                        height: 300,
                        width: 600,
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 76, 52, 184)),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 120),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '📍 ${state.weather.areaName} ',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Good Morning',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 55),
                            ),
                          ),
                          Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '${(DateFormat.MMMMd().format(
                                    state.weather.date!,
                                  ))} ',
                                  style:
                                      const TextStyle(color: Colors.white70)),
                              Text(
                                  (DateFormat('h:mm a').format(
                                    state.weather.date!,
                                  )),
                                  style:
                                      const TextStyle(color: Colors.white70)),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/6.png',
                                height: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sunrise',
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('h:mm a')
                                        .format(state.weather.sunrise!),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/12.png',
                                height: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Sunset',
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('h:mm a')
                                        .format(state.weather.sunset!),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              color: Colors.white30,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/14.png',
                                height: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Temp Min',
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    '${state.weather.tempMin!.celsius!.round()}°C',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/13.png',
                                height: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Temp Max',
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    '${state.weather.tempMax!.celsius!.round()}°C',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
