import 'package:infinite_scroll/src/features/character/character.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  @override
  Future<List<Character>> fetchAll({required int page}) async {
    // Remote call.
    final CharacterRemote remote = CharacterRemote();
    final List<CharacterModel> characters = await remote.fetchAll(page);

    // Result.
    return characters.map((character) => character.toEntity()).toList();
  }
}
