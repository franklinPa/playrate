import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:playrate/config/helpers/human_formats.dart';

import '../../../config/theme/font_theme.dart';
import '../../../domain/entities/game/game.dart';

class GameHorizontalListView extends StatefulWidget {

  final List<Game> games;
  final String? title;
  final String? subTitle;
  
  final VoidCallback? loadNextPage;

  const GameHorizontalListView({
    required this.games, 
    this.title, 
    this.subTitle,
    this.loadNextPage,
    super.key, 
  });

  @override
  State<GameHorizontalListView> createState() => _GameHorizontalListViewState();
}

class _GameHorizontalListViewState extends State<GameHorizontalListView> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 

      if ( widget.loadNextPage == null ) return;

      if ( (scrollController.position.pixels + 100 ) >= scrollController.position.maxScrollExtent ) {
        
        widget.loadNextPage!();
      }

    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.385,
      child: Column(
        children: [

          if(widget.title != null || widget.subTitle != null)
          _Title(
            title: widget.title,
            subTitle: widget.subTitle,
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.games.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeIn(
                  child: _Slide(
                    game: widget.games[index]
                  ),
                );
              },
            )
          ),
        ],
      ),
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
    TextTheme textTheme = CustomTextTheme(context, Colors.black,).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //image
          SizedBox(
            width: size.width * 0.35,
            height: size.height * 0.22,
            child: ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(8),
              child: Image.network(
                game.backgroundImage,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if( loadingProgress != null){
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ), 
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.01,
          ),

          // Title

          SizedBox(
            width: size.width * 0.35,
            child: Text(
              game.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelSmall,
            ),
          ),

          SizedBox(
            height: size.height * 0.005,
          ),

          // Rating

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.star_border_outlined,
                color: Colors.yellow.shade700,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '${game.rating}',
                style: TextStyle(
                  fontFamily: 'roboto_regular',
                  fontSize: 14,
                  color: Colors.yellow.shade700
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.favorite_border_rounded,
                color: Colors.redAccent,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                HumanFormats.number(110000),
                style: const TextStyle(
                  fontFamily: 'roboto_regular',
                  fontSize: 14,
                  color: Colors.redAccent
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({
    this.title, 
    this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextTheme textTheme = CustomTextTheme(context, Colors.black,).textTheme;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      child: Row(
        children: [
          if(title != null)
            Text(
              title!,
              style: textTheme.titleMedium
            ),
          const Spacer(),
          if(subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
              ),
              onPressed: () {
              
              }, 
              child:  Text(
                subTitle!,
                
              )
          )
        ],
      ),
    );
  }
}