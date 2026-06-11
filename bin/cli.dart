import 'dart:io';

// const name = 'Michael';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'greet') {
    // use 2nd arg or default as name
    // print(arguments.sublist(1).first);
    final String? fName = arguments.length > 1 ? arguments[1] : null;
    greetPerson(fName);
  } else {
    printUsage();
  }
}

void printUsage() {
  print("Usage: reply with 'help', or 'greet {name}'");
}

void greetPerson(String? name) {
  final String inputName;

  if (name == null) {
    print("Please input a name:");
    inputName = stdin.readLineSync() ?? '';

    if (inputName.isEmpty) {
      greetPerson(null);
      return;
    }
  } else {
    inputName = name;
  }

  print('Hello: $inputName!');
}