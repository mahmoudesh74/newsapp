import 'package:flutter/material.dart';
import 'package:project/app/app_consts.dart';

class ImagePreviewer extends StatefulWidget {
  String path;
  num height;
  num width;

  ImagePreviewer(
      {super.key,
      required this.path,
      required this.height,
      required this.width});

  @override
  State<ImagePreviewer> createState() => _ImagePreviewerState();
}

class _ImagePreviewerState extends State<ImagePreviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.download,
                size: 30,
                color: Colors.white,
              )),
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            AppConsts.imageBaseUrl + widget.path,
            height: double.parse(widget.height.toString()),
            width: double.parse(widget.width.toString()),
          ),
        ],
      ),
    );
  }
}
