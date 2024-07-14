import 'dart:convert';

import 'package:uuid/uuid.dart';

/// Generate or convert base64 url safe UUIDs
class UrlSafeUuid {
  /// Generates a base64 url safe UUID
  static String generate() {
    final uuid = Uuid().v4();
    return convert(uuid);
  }

  /// Converts a UUID to a base64 url safe UUID
  static String convert(String uuid) {
    final uuidWithoutDashes = uuid.replaceAll('-', '');
    final bytes = List<int>.generate(
      uuidWithoutDashes.length ~/ 2,
      (i) => int.parse(
        uuidWithoutDashes.substring(i * 2, i * 2 + 2),
        radix: 16,
      ),
    );
    return base64UrlEncode(bytes).replaceAll('=', '');
  }

  /// Converts a base64 url safe UUID to a UUID
  static String revert(String base64UrlSafeUuid) {
    final paddingNeeded = (4 - base64UrlSafeUuid.length % 4) % 4;
    final base64UrlSafeUuidPadded = base64UrlSafeUuid + '=' * paddingNeeded;

    final bytes = base64Url.decode(base64UrlSafeUuidPadded);
    final uuid =
        bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();

    return '${uuid.substring(0, 8)}-${uuid.substring(8, 12)}-${uuid.substring(12, 16)}-${uuid.substring(16, 20)}-${uuid.substring(20)}';
  }
}
