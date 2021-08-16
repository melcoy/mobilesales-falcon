import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanCheckIn/bloc/visitplancheckinbloc_bloc.dart';
import 'package:salesappmobile/Model/VisitPlan/Dto/CheckInDto.dart';
import 'package:salesappmobile/Util/CloudinaryUpload.dart';
import 'package:salesappmobile/Util/CloudinaryUpload.dart';
import 'package:salesappmobile/View/Dashboard/Menu/VisitPlan/VisitPlanCheckIn/VisitPlanCheckIn.dart';

import 'CloudinaryUpload.dart';
import 'Util.dart';

class CameraPageState extends StatefulWidget {
  final CheckInDto model;
  const CameraPageState({Key key, this.model}) : super(key: key);

  @override
  _CameraPageStateState createState() => _CameraPageStateState(model);
}

class _CameraPageStateState extends State<CameraPageState> {
  CameraController controller;
  CheckInDto model;

  _CameraPageStateState(this.model);

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

  Future<String> takePicture() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/ImageCheck-In';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      await controller.takePicture(filePath);
    } catch (e) {
      return null;
    }

    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: initializeCamera(),
            builder: (_, snapshot) => (snapshot.connectionState ==
                    ConnectionState.done)
                ? Stack(children: <Widget>[
                    BlocListener<VisitplancheckinblocBloc,
                        VisitplancheckinblocState>(
                      listener: (context, state) {
                        if (state is VisitplancheckinblocSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 4),
                              content: Text(state.succMsg.toString())));
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return VisitPlanCheckIn(
                              model: model,
                            );
                          }));
                        }
                        if (state is VisitplancheckinblocFaillure) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 4),
                              content: Text(state.errMsg)));
                        }
                      },
                      child: BlocBuilder<VisitplancheckinblocBloc,
                          VisitplancheckinblocState>(
                        builder: (context, state) {
                          if (state is VisitplancheckinblocLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Column(
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
                                    onPressed: () async {
                                      if (!controller.value.isTakingPicture) {
                                        String path = await takePicture();
                                        // String url = await _cloudinaryUpload
                                        //     .uploadToCloudinary(path);
                                        BlocProvider.of<
                                                    VisitplancheckinblocBloc>(
                                                context)
                                            .add(
                                          VisitplancheckinblocEventCapture(
                                              path: path,
                                              visitId: model.idVisitPlan),
                                        );
                                      }
                                    },
                                  ),
                                )
                              ],
                            );
                          }
                        },
                      ),
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
