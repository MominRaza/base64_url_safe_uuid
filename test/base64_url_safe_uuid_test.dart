import 'package:base64_url_safe_uuid/base64_url_safe_uuid.dart';
import 'package:test/test.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('predefine uuids', () {
    List<Map<String, String>> uuids = [
      {
        'base16uuid': 'adb0e35a-5fc5-4ad9-a86f-1e0aa85d7206',
        'base64uuid': 'rbDjWl_FStmobx4KqF1yBg'
      },
      {
        'base16uuid': 'aecf9f65-8e0d-4dff-ba17-19bd6e2d8a27',
        'base64uuid': 'rs-fZY4NTf-6Fxm9bi2KJw'
      },
      {
        'base16uuid': 'c685d9ff-4e77-4024-97ab-ac1bb31be6b7',
        'base64uuid': 'xoXZ_053QCSXq6wbsxvmtw'
      },
      {
        'base16uuid': '743f2438-cf11-46de-a7c4-e2fc445e9060',
        'base64uuid': 'dD8kOM8RRt6nxOL8RF6QYA'
      },
      {
        'base16uuid': '53c48509-a5ec-446b-938d-41714424d64a',
        'base64uuid': 'U8SFCaXsRGuTjUFxRCTWSg'
      },
      {
        'base16uuid': 'f034ed7f-548f-43f0-a5f0-f2e132f822bb',
        'base64uuid': '8DTtf1SPQ_Cl8PLhMvgiuw'
      },
      {
        'base16uuid': '564a265f-3fa7-4e28-ae75-e4bc0767a0f6',
        'base64uuid': 'VkomXz-nTiiudeS8B2eg9g'
      },
      {
        'base16uuid': '5b68a01f-cc36-40ae-bb3c-10b1b6ff5f3b',
        'base64uuid': 'W2igH8w2QK67PBCxtv9fOw'
      },
      {
        'base16uuid': '1437b88f-32db-4ca9-8243-890b691ab301',
        'base64uuid': 'FDe4jzLbTKmCQ4kLaRqzAQ'
      },
      {
        'base16uuid': '3905655e-4182-4d69-9ce0-8bb6290a19bb',
        'base64uuid': 'OQVlXkGCTWmc4Iu2KQoZuw'
      }
    ];

    group('base16 uuid to base64 uuid', () {
      for (var uuid in uuids) {
        test('base16uuid ($uuid)', () {
          final output = UrlSafeUuid.convert(uuid['base16uuid']!);
          expect(output, equals(uuid['base64uuid']!));
        });
      }
    });

    group('base64 uuid to base16 uuid', () {
      for (var uuid in uuids) {
        test('base64uuid ($uuid)', () {
          final output = UrlSafeUuid.revert(uuid['base64uuid']!);
          expect(output, equals(uuid['base16uuid']!));
        });
      }
    });
  });

  group('runtime uuids', () {
    for (var i = 0; i < 100000; i++) {
      test('base16uuid to base64uuid to base16uuid ($i)', () {
        final String uuid = const Uuid().v4();
        final String output = UrlSafeUuid.convert(UrlSafeUuid.revert(uuid));
        expect(output, equals(uuid));
      });
    }
  });
}
