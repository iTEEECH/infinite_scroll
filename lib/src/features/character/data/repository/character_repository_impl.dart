import 'package:infinite_scroll/src/features/character/character.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<List<Character>> fetchAllCharacters(int page) async {
    try {
      // Remote call.
      final CharacterRemote remote = CharacterRemote();
      final List<CharacterModel> characters = await remote.fetchAllCharacters(page);

      // Result.
      return characters.map((character) => character.toEntity()).toList();
    } catch (err) {
      throw Exception(err);
    }
  }
}