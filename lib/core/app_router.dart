import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/business_logic/character_cubit/character_cubit.dart';
import 'package:rickandmorty_app/core/constants/string.dart';
import 'package:rickandmorty_app/data/repository/characters_repo_impl.dart';
import 'package:rickandmorty_app/data/services/api.dart';
import 'package:rickandmorty_app/presentation/views/characters_view.dart';

class AppRouter {
  late CharactersRepoImpl charactersRepoImpl;
  late CharacterCubit characterCubit;

  AppRouter() {
    charactersRepoImpl = CharactersRepoImpl(ApiServices());
    characterCubit = CharacterCubit(charactersRepoImpl);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kCharactersView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => characterCubit,
            child: const CharactersView(),
          ),
        );
      // case "/characterDetailsView":
      // return MaterialPageRoute(builder: (_) => const CharacterDetailsView());
    }
  }
}
