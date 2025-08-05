import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cli_table/cli_table.dart';
import 'package:openapi/api.dart';

class FirewallCommand extends Command<void> {
  @override
  String get description => 'Print firewall rules';

  @override
  String get name => 'describe-firewall';

  @override
  String get category => 'Firewall';

  @override
  List<String> get aliases => ['firewall'];

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    return parents.reversed.join(' ');
  }

  @override
  Future<void> run() async {
    final table = Table(
      header: [
        'Protocol',
        'Port range',
        'Source',
        'Description',
      ],
    );

    final FirewallRulesList200Response firewallRules;
    try {
      final maybeFirewallRules =
          await FirewallsApi(defaultApiClient).firewallRulesList();
      // This should never be null: an ApiException should have been thrown instead.
      firewallRules = maybeFirewallRules!;
    } on ApiException catch (e) {
      stderr.write('Failed to fetch firewall rules: ${e.message}');
      return;
    }

    final rows = firewallRules.data.map((fs) {
      final String portString;
      if (fs.portRange.length == 1 || fs.portRange[0] == fs.portRange[1]) {
        portString = fs.portRange[0].toString();
      } else {
        portString = '${fs.portRange[0]}–${fs.portRange[1]}';
      }

      return [
        fs.protocol.value,
        portString,
        fs.sourceNetwork,
        fs.description,
      ];
    });
    table.addAll(rows);
    stdout.writeln(table);
  }
}

class UpdateFirewallCommand extends Command<void> {
  @override
  String get description => 'Set firewall rules';

  @override
  String get name => 'replace-firewall';

  @override
  String get category => 'Firewall';

  @override
  List<String> get aliases => ['update-firewall'];

  @override
  String get invocation {
    var parents = [name];
    for (var command = parent; command != null; command = command.parent) {
      parents.add(command.name);
    }
    parents.add(runner!.executableName);

    return '${parents.reversed.join(' ')} protocol port-range source description [protocol port-range source description ...]';
  }

  @override
  Future<void> run() async {
    if (argResults!.rest.length % 4 != 0) {
      usageException(
          'Each rule must have a protocol, port range, source network, and description');
    }

    final table = Table(
      header: [
        'Protocol',
        'Port range',
        'Source',
        'Description',
      ],
    );

    final List<FirewallRule> rules = [];
    for (var i = 0; i < argResults!.rest.length; i += 4) {
      final protocolString = argResults!.rest[i];
      final portRangeString = argResults!.rest[i + 1];
      final sourceNetwork = argResults!.rest[i + 2];
      final description = argResults!.rest[i + 3];

      final protocol = NetworkProtocol.values.firstWhere(
          (p) => p.value == protocolString,
          orElse: () =>
              throw usageException('Invalid protocol: $protocolString'));

      final portRange = portRangeString.split('-');
      final int portRangeStart, portRangeEnd;
      if (portRange.length == 1) {
        portRangeStart = portRangeEnd = int.parse(portRange[0]);
      } else if (portRange.length == 2) {
        portRangeStart = int.parse(portRange[0]);
        portRangeEnd = int.parse(portRange[1]);
      } else {
        usageException('Invalid port range: $portRange');
      }

      rules.add(FirewallRule(
        protocol: protocol,
        portRange: [portRangeStart, portRangeEnd],
        sourceNetwork: sourceNetwork,
        description: description,
      ));
    }

    final FirewallRulesList200Response firewallRules;
    try {
      final maybeFirewallRules = await FirewallsApi(defaultApiClient)
          .firewallRulesSet(FirewallRulesPutRequest(data: rules));
      // This should never be null: an ApiException should have been thrown instead.
      firewallRules = maybeFirewallRules!;
    } on ApiException catch (e) {
      stderr.write('Failed to update firewall rules: ${e.message}');
      return;
    }

    final rows = firewallRules.data.map((fs) {
      final String portString;
      if (fs.portRange.length == 1 || fs.portRange[0] == fs.portRange[1]) {
        portString = fs.portRange[0].toString();
      } else {
        portString = '${fs.portRange[0]}–${fs.portRange[1]}';
      }

      return [
        fs.protocol.value,
        portString,
        fs.sourceNetwork,
        fs.description,
      ];
    });
    table.addAll(rows);
    stdout.writeln(table);
  }
}
