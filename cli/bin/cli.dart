import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:command_runner/command_runner.dart';

void main(List<String> arguments) async {
  var runner = CommandRunner();
  await runner.run(arguments);
}

// obsolete from here
void printUsage() {
  print("Usage: reply with 'help', or 'weather {location}'");
}

void getWeather(String? location) async {
  final String inputLocation;

  if (location == null) {
    print("Please input a location:");
    inputLocation = stdin.readLineSync() ?? '';

    if (inputLocation.isEmpty) {
      getWeather(null);
      return;
    }
  } else {
    inputLocation = location;
  }

  print('One sec. Getting weather data...');
  final res = await fetchWeatherData(inputLocation);
  print(res);
  // print('The weather in $inputLocation is sunny!');
}

Future<String> fetchWeatherData(String location) async {
  final response = await http.get(Uri.http(
    'api.weatherapi.com',
    '/v1/current.json',
    {'key': '', 'q': location},
  ));

  print("Wouldn't you like to know, weather boy 😂");

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception(
        'Failed to load weather data. Status code: ${response.statusCode}, ${response.body}');
  }
}
