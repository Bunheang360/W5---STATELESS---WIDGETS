import 'package:flutter/material.dart';

enum WeatherType { cloudy, sunny, sunnyCloudy, veryCloudy }

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(240, 223, 223, 223),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text('Weather App'),
          actions: const [Icon(Icons.menu, color: Colors.white)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(4),
          child: ListView(
            children: const [
              WeatherCard(
                city: "Phnom Penh",
                weatherType: WeatherType.cloudy,
                minTemp: 10.0,
                maxTemp: 30.0,
                currentTemp: 12.2,
              ),
              SizedBox(height: 10),
              WeatherCard(
                city: "Paris",
                weatherType: WeatherType.sunnyCloudy,
                minTemp: 12.0,
                maxTemp: 32.0,
                currentTemp: 15.0,
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              SizedBox(height: 10),
              WeatherCard(
                city: "Rome",
                weatherType: WeatherType.sunny,
                minTemp: 14.0,
                maxTemp: 35.0,
                currentTemp: 20.0,
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.amber],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              SizedBox(height: 10),
              WeatherCard(
                city: "Toulouse",
                weatherType: WeatherType.veryCloudy,
                minTemp: 8.0,
                maxTemp: 28.0,
                currentTemp: 10.0,
                gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.grey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String city;
  final WeatherType weatherType;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final LinearGradient gradient;

  const WeatherCard({
    super.key,
    required this.city,
    required this.weatherType,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFB565D8), Color(0xFF9B59B6)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  });

  String get weatherImage {
    switch (weatherType) {
      case WeatherType.cloudy:
        return "lib/Assets/Week-5-Assets/ex4/cloudy.png";
      case WeatherType.sunny:
        return "lib/Assets/Week-5-Assets/ex4/sunny.png";
      case WeatherType.sunnyCloudy:
        return "lib/Assets/Week-5-Assets/ex4/sunnyCloudy.png";
      case WeatherType.veryCloudy:
        return "lib/Assets/Week-5-Assets/ex4/veryCloudy.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset(weatherImage, width: 40, height: 40),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Min: ${minTemp.toStringAsFixed(1)}°C',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    'Max: ${maxTemp.toStringAsFixed(1)}°C',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              '${currentTemp.toStringAsFixed(1)}°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
