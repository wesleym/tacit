import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:tacit/src/secrets.dart';
import 'package:tacit/src/store.dart';

class ChatCommand extends Command<void> {
  final _conversation = Conversation('hermes-3-llama-3.1-405b-fp8')
    ..addMessage(Message(MessageType.system, systemPrompt));
  // var _inProgress = false;

  @override
  String get description => 'Start chatting with Lambda Chat';

  @override
  String get name => 'chat';

  @override
  String get category => 'Inference';

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
    stdout
      ..writeln('Lambda Chat')
      ..writeln('===========')
      ..writeln();

    while (true) {
      stdout.write('> ');
      final inMessage = stdin.readLineSync();
      stdout.writeln();
      if (inMessage == null) break;
      final responseChunkStream = _sendMessage(inMessage);
      await for (final chunk in responseChunkStream) {
        stdout.write(chunk);
      }
      stdout
        ..writeln()
        ..writeln();
    }
  }

  Stream<String> _sendMessage(String value) async* {
    if (value.trim().isEmpty) return;
    // _chatController.clear();

    _conversation.addMessage(Message(MessageType.user, value));

    // setState(() {
    //   _inProgress = true;
    // });

    // Disable debug printing from library. See <https://api.dart.dev/dart-async/Zone/print.html>.
    final sseStream = runZoned(
      () {
        return SSEClient.subscribeToSSE(
          method: SSERequestType.POST,
          url: 'https://api.lambda.ai/v1/chat/completions',
          header: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json; charset=utf-8',
          },
          body: _conversation.toJson(),
        );
      },
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          // Suppress SSE library logging.
        },
      ),
    );
    var role = MessageType.assistant;
    final chunkController = StreamController<String>.broadcast();
    final message = AppendableMessage(role, chunkController.stream);
    _conversation.addMessage(message);

    var first = true;
    await for (final event in sseStream) {
      if (first) {
        role = switch (json.decode(
          event.data!,
        )['choices'][0]['delta']['role']) {
          'system' => MessageType.system,
          'assistant' => MessageType.assistant,
          'user' => MessageType.user,
          _ => MessageType.assistant,
        };
        first = false;
      }

      if (event.data?.trim() == '[DONE]') {
        chunkController.close();
        break;
      }

      final chunkMap = json.decode(event.data!);
      var choices = chunkMap['choices'] as List;
      if (choices.isEmpty) {
        chunkController.close();
        break;
      }
      final choice = choices.first;
      // TODO: handle refusal
      final content = choice['delta']['content'] as String?;
      if (content != null) {
        chunkController.add(content);
        yield content;
      }
    }
  }
}
