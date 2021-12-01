import 'dart:io';

void main() async {
  List<int> measurements = await getMeasurementsFromInput();

  final int firstPartAnswer = getMeasurementIncreasedCounter(measurements);
  print('First part answer : $firstPartAnswer'); // 1665

  final int secondPartAnswer = getMeasurementIncreasedCounterByWindow(measurements);
  print('Second part answer : $secondPartAnswer');
}

// ANCHOR Methods

Future<List<int>> getMeasurementsFromInput() async {
  File file = new File('./input.txt');
  String fileContent = await file.readAsString();

  return fileContent.split('\n').map((e) => int.parse(e)).toList();
}

int getMeasurementIncreasedCounter(List<int> measurements) {
  int counter = 0;

  for (int i = 1; i < measurements.length; i++) {
    if (measurements[i] > measurements[i - 1]) {
      counter++;
    }
  }
  return counter;
}

int getMeasurementIncreasedCounterByWindow(List<int> measurements) {
  List<List<int>> windows = [];

  // Create windows
  for (int i = 2; i < measurements.length; i++) {
    windows.add([
      measurements[i - 2],
      measurements[i - 1],
      measurements[i],
    ]);
  }

  // Reduce windows by sum
  List<int> reducedWindowsBySum =
      windows.map((e) => e.fold(0, (int previousValue, int element) => previousValue + element)).toList();

  return getMeasurementIncreasedCounter(reducedWindowsBySum);
}
