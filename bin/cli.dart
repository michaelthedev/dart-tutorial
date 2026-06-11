import 'dart:io';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'weather') {
    // use 2nd arg or default as name
    // print(arguments.sublist(1).first);
    final String? location = arguments.length > 1 ? arguments[1] : null;
    getWeather(location);
  } else {
    printUsage();
  }
}

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
  final response = await http.get(
      Uri.http(
        'api.weatherapi.com',
        '/v1/current.json',
        {'key': '', 'q': location},
      )
  );

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load weather data. Status code: ${response.statusCode}');
  }
}