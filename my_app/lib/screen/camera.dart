import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  _initCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.high);
      await controller!.initialize();
      setState(() { _isInitialized = true; });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("yuopni"),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Post ho gaya!"))
              );
            },
          )
        ],
      ),
      body: _isInitialized 
      ? CameraPreview(controller!) 
        : Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          final image = await controller!.takePicture();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Photo li!"))
          );
        },
      ),
    );
  }
}