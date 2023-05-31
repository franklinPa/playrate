import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/game/game.dart';

class GamesSlideshow extends StatelessWidget {

  final List<Game> games;

  const GamesSlideshow({
    super.key, required this.games
  });

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
          child: SizedBox(
            height: size.height * 0.04 ,            
            child: Text(
              'Upcoming',
              style: TextStyle(
                fontSize: size.height / 35,
                fontFamily: 'roboto_medium',
              ),
            )
          ),
        ),
        SizedBox(
          height: size.height * 0.01 , 
        ),
        SizedBox(
          height: size.height * 0.25,
          width: double.infinity,
          child: Swiper(
            viewportFraction: 0.8,
            scale: 0.9,
            pagination: SwiperPagination(
              margin: const EdgeInsets.only(top: 0),
              builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary,
                color: colors.secondary
              )
            ),
            autoplay: true,
            itemCount: games.length,
            itemBuilder: (context, index) {
      
              final game = games[index];
              return _Slide(game: game,);
            }, 
          ),
        ),
      ] 
    );
  }
}

class _Slide extends StatelessWidget {
  final Game game;
  const _Slide({
    required this.game
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.black26
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Stack(
        children: [
        
          DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                height: size.height * 1,
                game.backgroundImage,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black12) 
                    );
                  }
                  return FadeIn(child: child);
                },
              )
            ),
          ),
          Positioned(
            top: 0,
            right: 15,
            child: IconButton(
              onPressed: () {
                
              }, 
              icon: const Icon(
                Icons.favorite_outline,
                size: 30,
                color: Colors.redAccent,
              )
            )
          ),
          Positioned(
            top: 120,
            left: 15,
            child: SizedBox(
              width: size.width * 0.7,
              child: Text(
                game.name,
                maxLines: 1,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'roboto_bold',
                  fontSize: size.height / 40,
                  overflow: TextOverflow.ellipsis
                ),
              ),
            )
          ),
        ],
      )
    );
  }
}