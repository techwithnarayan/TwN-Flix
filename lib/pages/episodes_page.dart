import 'package:flix/model/data_model.dart';
import 'package:flix/pages/playnow_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class EpisodesPage extends StatelessWidget {
  final Season season;

  const EpisodesPage({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: ListView.builder(
        itemCount: season.episodes.length,
        itemBuilder: (context, index) {
          final episode = season.episodes[index];
          return ListTile(
            title: Text(episode.episodeTitle),
            subtitle: Text("Episode ${episode.episodeNumber}"),
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=> PlayNowPage(playurl: episode.playLink, dataSourceType: DataSourceType.network,)));
              // Implement your episode details screen here
            },
          );
        },
      ),
    );
  }
}
