import 'package:rickandmorty_app/data/models/character/character.dart';
import 'package:rickandmorty_app/data/repository/characters_repo.dart';
import 'package:rickandmorty_app/data/services/api.dart';

class CharactersRepoImpl implements CharactersRepo {
  final ApiServices apiServices;

  CharactersRepoImpl(this.apiServices);
  
  Future<List<CharacterModel>> fetchAllCharacters() async {
    List<dynamic> characters = await apiServices.getAllCharacters();
    return characters.map((character) => CharacterModel.fromJson(character)).toList();
  }
}
