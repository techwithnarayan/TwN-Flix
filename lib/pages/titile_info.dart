import 'dart:ui';

import 'package:flix/model/data_model.dart';
import 'package:flix/pages/download_page.dart';
import 'package:flix/pages/playnow_page.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TitleInfo extends StatelessWidget {
  final Posts info;
  const TitleInfo({super.key, required this.info});

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
        child: Column(
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
                  color: Colors.red, // Change this to your desired color
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
                              image: NetworkImage(info.poster),
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
                    info.title,
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DownloadPage(dlUrl: info.download, dltitle: info.title,)));
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> PlayNowPage(playurl: info.view, dataSourceType: DataSourceType.network,)));
                            },
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                  Text("PLOT", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                  Divider(color: Colors.white,),
                  Text(info.plot, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),),
                 const  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
      // body: CustomScrollView(
      //   physics: const BouncingScrollPhysics(),
      //   slivers: [
      //     SliverAppBar(
      //       elevation: 0,
      //       //floating: true,
      //       pinned: true,
      //       leading: InkWell(
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         child: Container(
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(15),
      //               color: Colors.grey.shade900),
      //           child: const Icon(Icons.arrow_back_ios_new_rounded),
      //         ),
      //       ),
      //       expandedHeight: 200,
      //       backgroundColor: Colors.transparent,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Image.network(
      //           info.poster,
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      // SliverToBoxAdapter(
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(10),
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20),
      //       child: Column(
      //         children: [
      //           Text(
      //             "Download ${info.title}",
      //             style: const TextStyle(fontSize: 30),
      //           ),

      //           const SizedBox(
      //             height: 20,
      //           ),
      //           const Text("Info"),
      //           Row(
      //             children: [
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text("IMDB Rating: ${info.ratings}"),
      //                   Text("Language: ${info.language}"),
      //                   Text("Released: ${info.released}"),
      //                   Text("Genre: ${info.genre}"),
      //                 ],
      //               )
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           const Text("Plot"),
      //           const Divider(
      //             color: Colors.white,
      //             thickness: 1,
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           Text(info.plot),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           const Text("Actors"),
      //           const Divider(
      //             color: Colors.white,
      //             thickness: 1,
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           Text(info.actors),
      //           const SizedBox(
      //             height: 50,
      //           ),
      //           const Text(
      //             "SubPics",
      //             style: TextStyle(fontSize: 25),
      //           ),
      //           const Divider(
      //             color: Colors.white,
      //             thickness: 1,
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),

      //           Container(
      //             height: 220,
      //             width: double.infinity,
      //             color: Colors.grey.shade700,
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           Container(
      //             height: 220,
      //             width: double.infinity,
      //             color: Colors.grey.shade700,
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           Container(
      //             height: 220,
      //             width: double.infinity,
      //             color: Colors.grey.shade700,
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           Container(
      //             height: 220,
      //             width: double.infinity,
      //             color: Colors.grey.shade700,
      //           ),
      //           const SizedBox(
      //             height: 50,
      //           ),
      //           const Text(
      //             "SubTitle",
      //             style: TextStyle(fontSize: 25),
      //           ),
      //           const Divider(
      //             color: Colors.white,
      //             thickness: 1,
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           InkWell(
      //             //   onTap: ()async {
      //             //   try {
      //             //     showDialog(context: context, builder: (context){
      //             //       return Center(child: Container(
      //             //         height: 100,
      //             //         width: 100,

      //             //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      //             //         child: Center(child: CircularProgressIndicator(),),));
      //             //     });
      //             //     Future.delayed(Duration(milliseconds: 500));
      //             //  await canLaunchUrl(Uri.parse(url));
      //             //  await launchUrl(Uri.parse(url));
      //             //    Navigator.pop(context);
      //             //   }catch (e){
      //             //     print( e);

      //             //   }},
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(15),
      //                   color: Colors.teal),
      //               height: 60,
      //               child: const Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.play_arrow_rounded,
      //                     size: 40,
      //                     color: Colors.white,
      //                   ),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Text(
      //                     "Play",
      //                     style: TextStyle(
      //                         fontSize: 30, fontWeight: FontWeight.w500),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           InkWell(
      //             onTap: () {
      //               // Navigator.push(
      //               //     context,
      //               //     MaterialPageRoute(
      //               //         builder: (context) => const PermissionScreen()));
      //             //   Navigator.push(
      //             //       context,
      //             //       MaterialPageRoute(
      //             //           builder: (context) =>  DownloadScreen(dlUrl: info.download, dltitle: info.title,)));
      //             },
      //             //onTap: dlFile,
      //             child: Container(
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(15),
      //                   color: Colors.teal),
      //               height: 60,
      //               child: const Row(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.download_rounded,
      //                     size: 30,
      //                     color: Colors.white,
      //                   ),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Text(
      //                     "Download",
      //                     style: TextStyle(
      //                         fontSize: 30, fontWeight: FontWeight.w500),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           const SizedBox(
      //             height: 100,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // )

      //   SliverToBoxAdapter(
      //     child: Column(
      //       children: [
      //         SizedBox(height: 20,),
      //         //HalfBlurredContainer(),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Container(
      //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
      //               width: 180,
      //               alignment: Alignment.center,
      //                 height: 50, child: Text("PLAY", style: TextStyle(fontSize: 30),)),
      //                 //SizedBox(width: 20,),
      //             Container(
      //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
      //               width: 180,
      //               alignment: Alignment.center,
      //                 height: 50, child: Text("DOWNLOAD", style: TextStyle(fontSize: 30),))
      //           ],
      //         )
      //       ],
      //     ),
      //   )
      // ],
      //),
    );
  }
}



// class HalfBlurredContainer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Solid color container
//         Container(
//           height: 200,
//           color: Colors.blue, // Change this to your desired color
//         ),
//         // Blurred container
//         Positioned.fill(
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity as needed
//             child: Container(

//               color: Colors.red, // Make the container transparent
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

