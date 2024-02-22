import 'package:bola_zone/src/core/data/helper_data.dart';
import 'package:bola_zone/gen/assets.gen.dart';
import 'package:bola_zone/src/routes/router.dart';

List<ServiceModel> services() {
  return [
    ServiceModel(
      name: 'Standings',
      route: Routes.standings,
      icon: Assets.icons.trophy.path,
      color: 0xFFfcdb48,
      image: "https://images.unsplash.com/photo-1527871369852-eb58cb2b54e2",
    ),
    ServiceModel(
      name: 'Matches',
      route: Routes.matches,
      icon: Assets.icons.soccerField.path,
      color: 0xFF308e3e,
      image: "https://images.unsplash.com/photo-1575361204480-aadea25e6e68",
    ),
    ServiceModel(
      name: 'Statistics',
      route: Routes.statistics,
      icon: Assets.icons.shoes.path,
      color: 0xFF5a5a5a,
      image: "https://images.unsplash.com/photo-1522778119026-d647f0596c20",
    ),
    ServiceModel(
      name: 'Highlights',
      //route: Routes.news,
      route: 'development',
      icon: Assets.icons.goal.path,
      color: 0xFFfd4655,
      image: "https://images.unsplash.com/photo-1579532536935-619928decd08",
    ),
  ];
}
