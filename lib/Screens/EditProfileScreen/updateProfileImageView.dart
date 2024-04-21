import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';

import '../../Widgets/showImagePicker.dart';
import '../../Widgets/staggerdGridTile.dart';

class UpdateImageView extends StatefulWidget {
  const UpdateImageView({super.key});

  @override
  State<UpdateImageView> createState() => _UpdateImageViewState();
}

class _UpdateImageViewState extends State<UpdateImageView> {
  List<File> galleryImages = [];

  File? profileImage;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      File? croppedFile = File(pickedFile.path);
      // File? croppedFile = await _cropImage(File(pickedFile.path));
      setState(() {
        // addProfilePicture();
        profileImage = croppedFile;
      });
    }
  }

  Future<void> _getGalleryImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      File? croppedFile = File(pickedFile.path);
      // File? croppedFile = await _cropImage(File(pickedFile.path));
      setState(() {
        // addPictures();
        galleryImages.add(croppedFile);
      });
    }
  }

  // Future<File?> _cropImage(File imageFile) async {
  //   ImageCropper imageCropper = ImageCropper();
  //   File? croppedFile = await imageCropper.cropImage(
  //     sourcePath: imageFile.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //     ],
  //     compressQuality: 100,
  //     androidUiSettings: const AndroidUiSettings(
  //         toolbarTitle: 'Cropper',
  //         toolbarColor: Colors.deepOrange,
  //         toolbarWidgetColor: Colors.white,
  //         initAspectRatio: CropAspectRatioPreset.original,
  //         lockAspectRatio: false),
  //     iosUiSettings: const IOSUiSettings(
  //       minimumAspectRatio: 1.0,
  //     ),
  //   );
  //
  //   return croppedFile;
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: profileImage == null
                ? Container(
                    color: Colors.grey[350],
                    child: IconButton(
                      icon:
                          const Icon(Icons.add, size: 40, color: Colors.black),
                      onPressed: () {
                        showPicker(context, () {
                          _getImage(ImageSource.gallery);
                          Navigator.of(context).pop();
                        }, () {
                          _getImage(ImageSource.camera);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  )
                : InkWell(
                    onTap: () {
                      showPicker(context, () {
                        _getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }, () {
                        _getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(profileImage!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
          ),
          ..._buildGalleryTiles(),
        ],
      ),
    );
  }

  List<Widget> _buildGalleryTiles() {
    List<Widget> tiles = [];

    // Add 5 tiles initially
    for (int i = 0; i < 5; i++) {
      tiles.add(
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: i < galleryImages.length
              ? buildGalleryPhotoTile(i)
              : buildAddPhotoTile(),
        ),
      );
    }

    return tiles;
  }

  Widget buildAddPhotoTile() {
    return imageContainerInitial(context, () {
      showPicker(context, () {
        _getGalleryImage(ImageSource.gallery);
        Navigator.of(context).pop();
      }, () {
        _getGalleryImage(ImageSource.camera);
        Navigator.of(context).pop();
      });
    });
  }

  Widget buildGalleryPhotoTile(int index) {
    return imageContainerAfterSelected(
      context,
      () {
        showPicker(context, () {
          _getGalleryImage(ImageSource.gallery);
          Navigator.of(context).pop();
        }, () {
          _getGalleryImage(ImageSource.camera);
          Navigator.of(context).pop();
        });
      },
      galleryImages,
      index,
      () {
        setState(() {
          galleryImages.removeAt(index);
        });
      },
    );
  }
}
