import 'dart:math' as math;

extension StringFormatter on String {
  int hexColor() {
    var newColor = '0xff$this';
    newColor = newColor.replaceAll('#', '');

    return int.parse(newColor);
  }

  String limitCharacters({required int numberOfCharacters}) {
    var maxNumberOfCharacters = math.min(length, numberOfCharacters);

    return substring(0, maxNumberOfCharacters);
  }
}
