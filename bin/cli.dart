import 'dart:io';

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

void getWeather(String? location) {
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
  print('The weather in $inputLocation is sunny!');
}