import 'package:autopart/core/style/base_color.dart';
import 'package:autopart/data/http_helper/http_helper.dart';
import 'package:autopart/model/UploadImage/UploadImage.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class UploadPic extends StatefulWidget {
  final String phototag;

  UploadPic({this.phototag});

  @override
  UploadPicState createState() => UploadPicState();
}

class UploadPicState extends State<UploadPic> {
  File croppedFile;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  HttpHelper helper = HttpHelper();

  File image;
  List<String> images = [];
  List<int> ids = [];
  chooseImage() async {
    // ignore: deprecated_member_use
    final pickedfile = await ImagePicker.pickImage(source: ImageSource.gallery);
    // ignore: deprecated_member_use
    if (pickedfile != null) {
      image = File(pickedfile.path);
       croppedFile = await ImageCropper.cropImage(
          sourcePath: pickedfile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
    }

    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() async {
    // ignore: deprecated_member_use
    showMessageInScaffold("Uploading...");
    if (image != null) {
      UploadImage uploadImage =
          await helper.uploadimage(tag: widget.phototag, images: croppedFile.path);

      if (uploadImage != null) {
        // ignore: deprecated_member_use
        scaffoldKey.currentState.hideCurrentSnackBar();
        Fluttertoast.showToast(
            msg: "Uploaded successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: lightOrange,
            textColor: Colors.white,
            fontSize: 16.0);
        ids.add(uploadImage.id);
      } else {
        Fluttertoast.showToast(
            msg: "there was a problem while uploading",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: lightOrange,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "please choose image first",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: lightOrange,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    // setStatus('Uploading Image...');
    // if (null == tmpFile) {
    //   setStatus(errMessage);
    //   return;
  }

  Widget showImage() {
    return image != null
        ? Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(image: DecorationImage(image: FileImage(croppedFile))))
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: orange,
              title: Text("Upload your Image"),
            ),
            body: Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // ignore: deprecated_member_use
                  OutlineButton(
                    onPressed: chooseImage,
                    child: Text('Choose Image'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  showImage(),
                  SizedBox(
                    height: 20.0,
                  ),
                  // ignore: deprecated_member_use
                  OutlineButton(
                    onPressed: startUpload,
                    child: Text('Upload Image'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    status,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            )),
        onWillPop: onWillPop);
  }

  void showMessageInScaffold(String message) {
    try {
      // ignore: deprecated_member_use
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
        backgroundColor: orange,
      ));
    } on Exception catch (e, s) {
      print(s);
    }
  }

  Future<bool> onWillPop() async {
    Navigator.pop(context, ids);
    return true;
  }
}
