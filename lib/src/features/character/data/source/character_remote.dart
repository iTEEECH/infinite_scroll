import 'dart:convert';
import 'dart:io';

import 'package:infinite_scroll/src/features/character/character.dart';
import 'package:http/http.dart' as http;

class CharacterRemote {
  static const _kBaseUrl = 'https://api.disneyapi.dev';

  const CharacterRemote();

  Future<List<CharacterModel>> fetchAll(int page, [int pageSize = 10]) async {
    // Path.
    final Uri url = Uri.parse(
      '$_kBaseUrl/character?page=$page&pageSize=$pageSize',
    );

    try {
      // Http call.
      final http.Response response = await http.get(url);

      // Result.
      if (response.statusCode == 200) {
        final body = Map<String, dynamic>.from(jsonDecode(response.body));
        final results = List<Map<String, dynamic>>.from(body['data']);
        if (results.isNotEmpty) {
          return results
              .map((result) => CharacterModel.fromMap(result))
              .toList(growable: false);
        }
      }
      return <CharacterModel>[];
    } on SocketException catch (err) {
      throw SocketException(err.message);
    } catch (err, stack) {
      Error.throwWithStackTrace(Exception(err), stack);
    }
  }
}
