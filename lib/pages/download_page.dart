import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadPage extends StatefulWidget {
  final String dlUrl;
  final String dltitle;
  const DownloadPage({super.key, required this.dlUrl, required this.dltitle});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  bool isDownloading = false;
  bool isDownloadingComplete = false;
  double _dlPercentage = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: isDownloading
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${(_dlPercentage * 100).toInt()}%",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                    child: LinearProgressIndicator(
                      value: _dlPercentage,
                      color: Colors.teal,
                      backgroundColor: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ))
            : Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () async {
                        setState(() {
                          isDownloading = true;
                        });

                        var dir = await getExternalStorageDirectory();
                        var dlLink = widget.dlUrl;
                        var filename = widget.dltitle;
                        Dio dio = Dio();
                        await dio.download(
                          dlLink,
                          '${dir?.path}/$filename.mkv',
                          onReceiveProgress: (done, pending) {
                            var percentage = done / pending;
                            setState(() {
                              _dlPercentage = percentage;
                            });

                            if (_dlPercentage >= 0.99) {
                              setState(() {
                                isDownloadingComplete = true;
                              });
                            }
                          },
                        );
                      },
                      child: Container(child: Text("Download Now")))
                ],
              )));
  }
}









//  final String dlUrl;
//   final String dltitle;
//   const DownloadScreen({super.key, required this.dlUrl, required this.dltitle});

//   @override
//   State<DownloadScreen> createState() => _DownloadScreenState();
// }

// class _DownloadScreenState extends State<DownloadScreen> {
//   double _dlPercentage = 0;
//   bool isDownloading = false;
//   bool isDownloadComplete = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade900,
//       appBar: AppBar(
//         title: const Text("Download"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             isDownloading
//                 ? SizedBox(
//                     height: MediaQuery.of(context).size.width * 0.7,
//                     child: Stack(
//                       children: <Widget>[
//                         Center(
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.7,
//                             height: MediaQuery.of(context).size.width * 0.7,
//                             child: CircularProgressIndicator(
//                               backgroundColor: Colors.blueGrey,
//                               color: Colors.red,
//                               strokeWidth: 40,
//                               value: _dlPercentage,
//                             ),
//                           ),
//                         ),
//                         Center(
//                             child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             isDownloadComplete
//                                 ? const SizedBox()
//                                 : Text(
//                                     "${(_dlPercentage * 100).toInt()}%",
//                                     style: const TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             isDownloadComplete
//                                 ? const Text(
//                                     "Download Complete",
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w600),
//                                   )
//                                 : const Text(
//                                     "Downloading...",
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                           ],
//                         )),
//                       ],
//                     ),
//                   )
//                 : InkWell(
//                     onTap: () async {
//                       var status = await Permission.storage.status;
//                       if (status.isDenied) {
//                         await Permission.storage.request();
//                         SmartDialog.showToast('Please Grant Permission');
//                         //openAppSettings();
//                       } else if (status.isPermanentlyDenied) {
//                         await openAppSettings();
//                       } else {
//                         {
//                           setState(() {
//                             isDownloading = !isDownloading;
//                           });
//                         }
//                         var dir = await getExternalStorageDirectory();
//                         var dlLink = widget.dlUrl;
//                         var filename = widget.dltitle;
//                         Dio dio = Dio();
//                         await dio.download(
//                           dlLink,
//                           '${dir?.path}/$filename.mkv',
//                           onReceiveProgress: (done, pending) {
//                             var percentage = done / pending;
//                             setState(() {
//                               _dlPercentage = percentage;
//                             });

//                             if (_dlPercentage >= 0.99) {
//                               setState(() {
//                                 isDownloadComplete = true;
//                               });
//                             }
//                           },
//                         );
//                       }
//                     },
//                     child: Container(
//                       height: 60,
//                       width: MediaQuery.of(context).size.width * 0.7,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.blueGrey),
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.download,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             "DOWNLOAD",
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 letterSpacing: 1.0),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//             const SizedBox(
//               height: 40,
//             ),
//             Text(
//               widget.dltitle,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
//             )
//             // SizedBox(

//             //   width: MediaQuery.of(context).size.width*0.7,
//             //   height: MediaQuery.of(context).size.width*0.7,
//             //   child: CircularProgressIndicator(
//             //     backgroundColor: Colors.grey,
//             //     color: Colors.red,
//             //     value: _dlPercentage,
//             //     strokeWidth: 40,
//             //   ),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }