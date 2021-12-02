import 'dart:io';

void main() async {
  List<String> submarineCourse = await getSubmarineCourse();

  final firstAnswer = getSubmarineDepthMultHorizontal(submarineCourse);
  print('1st answer: $firstAnswer');

  final secondAnswer = getSubmarineDepthMultHorizontalWithAim(submarineCourse);
  print('2nd answer: $secondAnswer');
}

Future<List<String>> getSubmarineCourse() async {
  File file = new File('./input.txt');
  String fileContent = await file.readAsString();

  return fileContent.split('\n').toList();
}

int getSubmarineDepthMultHorizontal(List<String> submarineCourse) {
  int horizontalPosition = 0;
  int depthPosition = 0;

  for (String step in submarineCourse) {
    final String direction = step.split(' ')[0];
    final int count = int.parse(step.split(' ')[1]);

    switch (direction) {
      case 'forward':
        horizontalPosition += count;
        break;
      case 'up':
        depthPosition -= count;
        break;
      case 'down':
        depthPosition += count;
        break;
    }
  }

  return depthPosition * horizontalPosition;
}

int getSubmarineDepthMultHorizontalWithAim(List<String> submarineCourse) {
  int horizontalPosition = 0;
  int depthPosition = 0;
  int aim = 0;

  for (String step in submarineCourse) {
    final String direction = step.split(' ')[0];
    final int count = int.parse(step.split(' ')[1]);

    switch (direction) {
      case 'forward':
        horizontalPosition += count;
        depthPosition += aim * count;
        break;
      case 'up':
        aim -= count;
        break;
      case 'down':
        aim += count;
        break;
    }
  }

  return depthPosition * horizontalPosition;
}
