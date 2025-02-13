import 'package:infinite_scroll/src/features/character/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> fetchAllCharacters(int page);
}