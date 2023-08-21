import 'dart:ui';

import 'package:flix/model/data_model.dart';

import 'package:flix/pages/playnow_page.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TitleInfo extends StatefulWidget {
  final Show info;
  const TitleInfo({super.key, required this.info});

  @override
  State<TitleInfo> createState() => _TitleInfoState();
}

class _TitleInfoState extends State<TitleInfo> {
  int selectedSeasonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: (widget.info.category == 'Web Series')
              ? Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    Center(
                        child: Stack(
                      children: [
                        // Solid color container
                        Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color:
                              Colors.red, // Change this to your desired color
                        ),
                        // Blurred container
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 9,
                                sigmaY: 9), // Adjust blur intensity as needed
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(widget.info.poster),
                                      fit: BoxFit.fitWidth),
                                  borderRadius: BorderRadius.circular(
                                      10)), // Make the container transparent
                            ),
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.grey.shade800),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 150, vertical: 10),
                              child: Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.info.title,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "PLOT",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Text(
                            widget.info.plot,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "INFO",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Text(
                            "Released:- ${widget.info.released}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Ratings:- ${widget.info.ratings}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Genre:- ${widget.info.genre}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "ACTORS",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Text(
                            widget.info.actors.toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          DropdownButton<int>(
                            dropdownColor: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                            value: selectedSeasonIndex,
                            onChanged: (index) {
                              setState(() {
                                selectedSeasonIndex = index!;
                              });
                            },
                            items: List.generate(
                              widget.info.seasons!.length,
                              (index) {
                                return DropdownMenuItem<int>(
                                  value: index,
                                  child: Text(
                                      'Season ${widget.info.seasons![index].seasonNumber}', style: const TextStyle(color: Colors.white),),
                                );
                              },
                            ),
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.info.seasons![selectedSeasonIndex]
                                .episodes.length,
                            itemBuilder: (context, index) {
                              final episode = widget
                                  .info
                                  .seasons![selectedSeasonIndex]
                                  .episodes[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.grey.shade700, borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    title: Text(episode.episodeTitle,style: const TextStyle(color: Colors.white),),
                                    subtitle:
                                        Text("Episode ${episode.episodeNumber}"),
                                    onTap: () {
                                      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Coming Soon")));
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayNowPage(playurl: episode.playLink, dataSourceType: DataSourceType.network)));
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    Center(
                        child: Stack(
                      children: [
                        // Solid color container
                        Container(
                          height: 400,
                          width: MediaQuery.of(context).size.width * 0.9,
                          color:
                              Colors.red, // Change this to your desired color
                        ),
                        // Blurred container
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 9,
                                sigmaY: 9), // Adjust blur intensity as needed
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(widget.info.poster),
                                      fit: BoxFit.fitWidth),
                                  borderRadius: BorderRadius.circular(
                                      10)), // Make the container transparent
                            ),
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.grey.shade800),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 150, vertical: 10),
                              child: Container(
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.info.title,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 90,
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 0,
                                  color: Colors.black,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    hoverColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                    onTap: () {
                                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Coming Soon")));
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             DownloadPage(
                                      //               dlUrl: widget.info.download,
                                      //               dltitle: widget.info.title,
                                      //             )));
                                    },
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.download_rounded,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        Text(
                                          "Download",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Material(
                                  borderRadius: BorderRadius.circular(40),
                                  elevation: 0,
                                  color: Colors.black,
                                  child: InkWell(
                                    splashColor: Colors.grey,
                                    hoverColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(40),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlayNowPage(
                                                    playurl: widget.info.view,
                                                    dataSourceType:
                                                        DataSourceType.network,
                                                  )));
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           SeasonsPage(show: widget.info),
                                      //     ));
                                    },
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Play Now",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "PLOT",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Text(
                            widget.info.plot,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "INFO",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Text(
                            "Released:- ${widget.info.released}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Ratings:- ${widget.info.ratings}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "Genre:- ${widget.info.genre}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "ACTORS",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          Text(
                            widget.info.actors.toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
    );
  }
}


/*
 final String title;
  final String released;
  final String genre;
  final String plot;
  final List<String> actors;
  final String ratings;
  final String view;
  final String download;
  final String poster;
  final String category;
  final List<String> images;
  final List<Season> seasons;
*/