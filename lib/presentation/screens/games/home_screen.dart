import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: _HomeView(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(upcomingProvider.notifier).loadNextPage();
    ref.read(bestRatedGamesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    final slideShowGames = ref.watch(gamesSlideshowProvider);
    final upcomingGames = ref.watch(upcomingProvider);
    final bestRatedGames = ref.watch(bestRatedGamesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  // const CustomAppbar(),
                  GamesSlideshow(
                    games: slideShowGames
                  ),
            
                  // GameHorizontalListView(
                  //   games: upcomingGames,
                  //   title: 'Popular',
                  //   subTitle: '',
                  //   loadNextPageSize: () {
                  //     ref.read(upcomingProvider.notifier).loadNextPageSize();
                  //   },
                  // ),
            
                  GameHorizontalListView(
                    games: bestRatedGames,
                    title: 'Top rated',
                    subTitle: 'See all',
                    loadNextPage: () {
                      ref.read(bestRatedGamesProvider.notifier).loadNextPage();
                    },
                  ),
            
                  GameHorizontalListView(
                    games: upcomingGames,
                    title: 'Most commented',
                    subTitle: 'See all',
                    loadNextPage: () {
                      ref.read(upcomingProvider.notifier).loadNextPage();
                    },
                  ),
                ],
              );
            },

            childCount: 1
          )  
        ),

      ]
    );
  }
}
