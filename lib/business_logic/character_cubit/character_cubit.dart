import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty_app/data/models/character/character.dart';
import 'package:rickandmorty_app/data/repository/characters_repo_impl.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit(this.charactersRepoImpl) : super(CharacterInitial());

  final CharactersRepoImpl charactersRepoImpl;
  late List<CharacterModel> characters;
  List<CharacterModel> getAllCharacters() {
    charactersRepoImpl.fetchAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }
}
