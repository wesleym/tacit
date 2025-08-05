import 'package:dart_console/dart_console.dart';
import 'package:lambda_cli/src/kvprinter.dart';

class AdaptPrinter {
  final List<String> _headers = [];
  final List<List<String?>> _rows = [];
  final _console = Console();

  void addHeader(String header) => _headers.add(header);
  void addHeaders(Iterable<String> headers) => _headers.addAll(headers);

  void addRow(List<String?> row) => _rows.add(row);
  void addRows(Iterable<List<String?>> rows) => _rows.addAll(rows);

  String _renderWidely() {
    final table = Table()
      ..headerColor = ConsoleColor.magenta
      ..headerStyle = FontStyle.bold;
    for (final header in _headers) {
      table.insertColumn(header: header);
    }
    table.insertRows(_rows
        .map((r) => r.map<Object>((c) => c ?? '--').toList(growable: false))
        .toList(growable: false));

    return table.render();
  }

  String _renderTallly() {
    final buf = StringBuffer();
    var first = true;

    for (final row in _rows) {
      if (first) {
        first = false;
      } else {
        buf.writeln('---');
      }

      final kvs = <Kv>[];
      for (var i = 0; i < _headers.length; i++) {
        kvs.add(Kv(_headers[i], row[i]));
      }

      buf.write(renderKvs(kvs));
    }
    return buf.toString();
  }

  String render() {
    final rendered = _renderWidely();

    // This isn't an exact check, since ANSI escape codes don't take up a
    // column but are counted in the character count.
    if (_console.windowWidth > rendered.indexOf('\n')) {
      return rendered;
    } else {
      return _renderTallly();
    }
  }
}
