import 'package:flix/model/data_model.dart';
import 'package:flutter/material.dart';

// class SeasonsPage extends StatelessWidget {
//   final Show show;
//   const SeasonsPage({super.key, required this.show});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${show.title} Seasons'),
//       ),
//       body: ListView.builder(
//         itemCount: show.seasons.length,
//         itemBuilder: (context, index) {
//           final season = show.seasons[index];
//           return ListTile(
//             title: Text("Season ${season.seasonNumber}"),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => EpisodesPage(season: season),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }


class SeasonsPage extends StatefulWidget {
  final Show show;

  const SeasonsPage({super.key, required this.show});

  @override
  _SeasonsPageState createState() => _SeasonsPageState();
}

class _SeasonsPageState extends State<SeasonsPage> {
  int selectedSeasonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.show.title} Seasons'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DropdownButton<int>(
              value: selectedSeasonIndex,
              onChanged: (index) {
                setState(() {
                  selectedSeasonIndex = index!;
                });
              },
              items: List.generate(
                widget.show.seasons!.length,
                (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Text('Season ${widget.show.seasons![index].seasonNumber}'),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.show.seasons![selectedSeasonIndex].episodes.length,
              itemBuilder: (context, index) {
                final episode = widget.show.seasons![selectedSeasonIndex].episodes[index];
                return ListTile(
                  title: Text(episode.episodeTitle),
                  subtitle: Text("Episode ${episode.episodeNumber}"),
                  onTap: () {
                    // Implement your episode details screen here
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
