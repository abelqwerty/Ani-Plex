import 'package:flutter/cupertino.dart';
import 'package:jikan/jikan.dart';

void main() async{
  Jikan jikan = Jikan();

  Anime anime = await jikan.getAnime(id: 36474);

  print(anime.title);

  jikan.getSchedule().then((schedule) => print(schedule.friday));

}