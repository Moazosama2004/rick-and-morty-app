import 'package:flutter/material.dart';
import 'package:rickandmorty_app/core/constants/colors.dart';
import 'package:rickandmorty_app/data/models/character/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.characterModel});

  final CharacterModel characterModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration:
          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        child: Container(
          color: kGrey,
          child: characterModel.image!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholderFit: BoxFit.cover,
                  placeholder: 'assets/images/loading.gif',
                  image: characterModel.image!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Image.asset(
                  'assets/images/download.png',
                  fit: BoxFit.cover,
                )),
        ),
        footer: Container(
          // width: double.infinity,
          padding:
              EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          // alignment: Alignment.bottomCenter,
          child: Text(
            characterModel.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              height: 1.3,
              fontSize: 16.0,
              color: kWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
    //   return Container(
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(16),
    //         image: DecorationImage(
    //           image: AssetImage(characterModel.image!),
    //         )),
    //   );
    // }
  }
}
