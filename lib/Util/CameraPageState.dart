import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/VisitPlanCheckIn.dart';

import 'Util.dart';

class CameraPageState extends StatefulWidget {
  @override
  _CameraPageStateState createState() => _CameraPageStateState();
}

class _CameraPageStateState extends State<CameraPageState> {
  CameraController controller;

  Future<void> initializeCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    await controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<File> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/ImageCheck-In';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      await controller.takePicture(filePath);
    } catch (e) {
      return null;
    }

    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: initializeCamera(),
            builder: (_, snapshot) =>
                (snapshot.connectionState == ConnectionState.done)
                    ? Stack(children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height -
                                  200 / controller.value.aspectRatio,
                              child: CameraPreview(controller),
                            ),
                            Container(
                              width: 200,
                              height: 200,
                              margin: EdgeInsets.only(top: 50),
                              child: IconButton(
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: colorRedFigma,
                                  size: 75,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return VisitPlanCheckIn();
                                  }));
                                },
                              ),
                            )
                          ],
                        )
                      ])
                    : Center(
                        child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ))));
  }
}

// Container(
//               child: ListView(children: [
//                 ListTile(
//                   title: Container(
//                     margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
//                     height: 30,
//                     width: size.width,
//                     child: Title(
//                       color: Colors.black,
//                       child: Text(
//                         'Address',
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     "xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxx ",
//                     maxLines: 3,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.bodyText1.copyWith(
//                         color: Colors.black38, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   title: Container(
//                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     height: 30,
//                     width: size.width,
//                     child: Title(
//                       color: Colors.black,
//                       child: Text(
//                         'Tipe',
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     "Tunai ",
//                     maxLines: 3,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.bodyText1.copyWith(
//                         color: Colors.black38, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   title: Container(
//                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     height: 30,
//                     width: size.width,
//                     child: Title(
//                       color: Colors.black,
//                       child: Text(
//                         'Provinsi',
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     "xxxxxxxxxxxxxxxxxxxxx ",
//                     maxLines: 3,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.bodyText1.copyWith(
//                         color: Colors.black38, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   title: Container(
//                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     height: 30,
//                     width: size.width,
//                     child: Title(
//                       color: Colors.black,
//                       child: Text(
//                         'Kecamatan',
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     "xxxxxxxxxxxxxxxxxxxxx",
//                     maxLines: 3,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.bodyText1.copyWith(
//                         color: Colors.black38, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   title: Container(
//                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     height: 30,
//                     width: size.width,
//                     child: Title(
//                       color: Colors.black,
//                       child: Text(
//                         'Kelurahan',
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     "xxxxxxxxxxxxxxxxxxxxx",
//                     maxLines: 3,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.bodyText1.copyWith(
//                         color: Colors.black38, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   title: Container(
//                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     height: 30,
//                     width: size.width,
//                     child: Title(
//                       color: Colors.black,
//                       child: Text(
//                         'Kota',
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     "xxxxxxxxxxxxxxxxxxxxx ",
//                     maxLines: 3,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.bodyText1.copyWith(
//                         color: Colors.black38, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   title: Container(
//                     margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                     height: 30,
//                     width: size.width,
//                     child: Title(
//                       color: Colors.black,
//                       child: Text(
//                         'Kode Pos',
//                         style: Theme.of(context).textTheme.headline6.copyWith(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ),
//                   ),
//                   subtitle: Text(
//                     "xxxxxxxxxxxxxxxxxxxxx ",
//                     maxLines: 3,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.bodyText1.copyWith(
//                         color: Colors.black38, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ]),
//             ),
