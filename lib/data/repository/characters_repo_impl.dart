import 'package:rickandmorty_app/data/models/character/character.dart';
import 'package:rickandmorty_app/data/repository/characters_repo.dart';
import 'package:rickandmorty_app/data/services/api.dart';

class CharactersRepoImpl implements CharactersRepo {
  final ApiServices apiServices;

  CharactersRepoImpl(this.apiServices);

  Future<List<CharacterModel>> fetchAllCharacters() async {
    Map<String, dynamic> characters = await apiServices.getAllCharacters();
    List<CharacterModel> charactersList = [];
    for (var character in characters['results']) {
      charactersList.add(CharacterModel.fromJson(character));
    }
    return charactersList;
  }
}
