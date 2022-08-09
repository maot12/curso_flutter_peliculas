import 'package:flutter/material.dart';

import 'package:curso_flutter_peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar luego por una instancia de movie
    final movie = ModalRoute.of(context)!.settings.arguments.toString();

    return Scaffold(
        body: CustomScrollView(
          slivers: [
            _CustomAppBar(),
            SliverList(
                delegate: SliverChildListDelegate([
                  _PosterAndTitle(),
                  _Overview(),
                  _Overview(),
                  _Overview(),
                  const CastingCards()

                ])
            )
          ],
        )
    );
  }
}


class _CustomAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only( bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: const Text(
           ' movie.title',
            style: TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          ),
        ),

        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://placehold.jp/3d4070/ffffff/150x150.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  //final Movie movie;

  //const _PosterAndTitle( this.movie );


  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://placehold.jp/3d4070/ffffff/150x150.png'),
              height: 150,
            ),
          ),

          const SizedBox( width: 20 ),

          ConstrainedBox(
            constraints: BoxConstraints( maxWidth: size.width - 190 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text( 'movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2 ),

                Text( 'movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),

                Row(
                  children: [
                    const Icon( Icons.star_outline, size: 15, color: Colors.grey ),
                    const SizedBox( width: 5 ),
                    Text( 'movie.voteAverage', style: textTheme.caption )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 10),
      child: Text(
        'Ut iriure reformidans constituam inciderint eam quidam mnesarchum praesent graeci. Sit solum noster errem fringilla dicit egestas. Augue luptatum legimus falli per docendi mus dissentiunt nec. Appetere vestibulum persecuti dictum mea pri. Dis ne dictumst quo sadipscing possit praesent tota. Conubia mea semper menandri possim ponderum vituperata dis vis. Audire posuere duo vocent atqui has comprehensam petentium parturient. Dicat maluisset audire posidonium dicam habitasse adhuc ac unum. Vestibulum disputationi verterem delenit cu vituperata sea eius finibus.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}



