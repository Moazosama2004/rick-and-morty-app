part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class CharacterInitial extends CharacterState {}

final class CharacterLoaded extends CharacterState {
  final List<CharacterModel> characters;
  CharacterLoaded(
    this.characters
  );
}
