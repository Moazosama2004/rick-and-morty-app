// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rickandmorty_app/business_logic/character_cubit/character_cubit.dart';
// import 'package:rickandmorty_app/presentation/widgets/character_item.dart';

// class CharactersViewBody extends StatelessWidget {
//   const CharactersViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: GridView.builder(
//           physics: const BouncingScrollPhysics(),
//           padding: EdgeInsets.zero,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 2 / 3,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10),
//           itemBuilder: (ctx, index) {
//             return const CharacterItem(
//               characterModel: BlocProvider.of<CharacterCubit>(context).characters[index],
//             );
//           }),
//     );
//   }
// }
