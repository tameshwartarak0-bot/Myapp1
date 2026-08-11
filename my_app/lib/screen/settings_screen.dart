import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _beautyOn = false; // beauty on/off
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[1], ResolutionPreset.high); // 1 = front camera
    await _controller!.initialize();
    setState(() => _isInitialized = true);
  }

  Future<void> _takePicture() async {
    if (!_controller!.value.isInitialized) return;
    final image = await _controller!.takePicture();
    
    // Yaha beauty filter apply hoga
    if(_beautyOn) {
      // Simple bright + smooth filter
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Beauty filter wali photo li!'))
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Normal photo li!'))
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(_controller!),
          
          // Upar wale button
          Positioned(
            top: 50,
            right: 20,
            child: Column(
              children: [
                // Beauty Button
                IconButton(
                  icon: Icon(Icons.face_retouching_natural, 
                  color: _beautyOn? Colors.pink : Colors.white, size: 30),
                  onPressed: () => setState(() => _beautyOn =!_beautyOn),
                ),
                const Text("Beauty", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          // Neeche Capture Button
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: _takePicture,
                child: const Icon(Icons.camera, color: Colors.black, size: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
    );
  }
}