import 'dart:io';
import 'dart:math';

import 'package:colorize/colorize.dart';

class Kv {
  final String key;
  final String? value;

  const Kv(this.key, this.value);
}

// TODO: parameterize stdout fd.
void printKvs(List<Kv> items) {
  final headerWidth = items.fold(
      0, (previousValue, element) => max(previousValue, element.key.length));

  for (final kv in items) {
    var header = Colorize(kv.key.padLeft(headerWidth)).red().bold();
    stdout.writeln('$header ${kv.value ?? ''}');
  }
}
