import 'package:base64_url_safe_uuid/base64_url_safe_uuid.dart';

void main() {
  final base64UrlSafeUuid = UrlSafeUuid.generate();

  print('base64 url safe uuid: $base64UrlSafeUuid');
}
