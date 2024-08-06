import 'package:rickandmorty_app/data/models/character/character.dart';

abstract class CharactersRepo {
  Future<List<CharacterModel>> fetchAllCharacters();
}
