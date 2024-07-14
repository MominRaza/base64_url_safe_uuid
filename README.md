# Base64 Url Safe UUID

A library for generating v4 UUIDs and encoding them into 22 character base64 URL-safe slug representation (based on [RFC4648 sec5](https://datatracker.ietf.org/doc/html/rfc4648#section-5)).

## Features

- Generate a base64 url safe UUID
- Convert a UUID to a base64 url safe UUID
- Revert a base64 url safe UUID to a UUID

## Usage

```dart
final base64UrlSafeUuid = UrlSafeUuid.generate();
```
