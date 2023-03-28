// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v9.1.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, unnecessary_import
// ignore_for_file: avoid_relative_lib_imports
import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;
import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:file_selector_ios/src/messages.g.dart';

class _TestFileSelectorApiCodec extends StandardMessageCodec {
  const _TestFileSelectorApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is FileSelectorConfig) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return FileSelectorConfig.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class TestFileSelectorApi {
  static const MessageCodec<Object?> codec = _TestFileSelectorApiCodec();

  Future<List<String?>> openFile(FileSelectorConfig config);

  static void setup(TestFileSelectorApi? api,
      {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.FileSelectorApi.openFile', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMockMessageHandler(null);
      } else {
        channel.setMockMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.FileSelectorApi.openFile was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final FileSelectorConfig? arg_config =
              (args[0] as FileSelectorConfig?);
          assert(arg_config != null,
              'Argument for dev.flutter.pigeon.FileSelectorApi.openFile was null, expected non-null FileSelectorConfig.');
          final List<String?> output = await api.openFile(arg_config!);
          return <Object?>[output];
        });
      }
    }
  }
}
