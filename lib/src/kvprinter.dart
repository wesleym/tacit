import 'dart:io';

import 'package:colorize/colorize.dart';

class Kv {
  final String key;
  final String? value;

  const Kv(this.key, this.value);
}

String renderKvs(List<Kv> items) {
  final buf = StringBuffer();

  for (final kv in items) {
    buf
      ..writeln(Colorize(kv.key).magenta().bold())
      ..writeln('  ${kv.value ?? '--'}');
  }

  return buf.toString();
}

void printKvs(List<Kv> items) => stdout.writeln(renderKvs(items));
