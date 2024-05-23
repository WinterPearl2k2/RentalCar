import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/application/utils/popup_utils.dart';

import '../../../../application/utils/colors_utils.dart';

class ItemAddResumeWidget extends StatelessWidget {
  final String url;
  final void Function()? selectCamera;
  final void Function()? selectGallery;
  final String path;

  const ItemAddResumeWidget({
    super.key,
    required this.url,
    this.selectCamera,
    this.selectGallery,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => PopupUtils.showBottomSheetAddImageDialog(
        context: context,
        onSelectPressedCamera: selectCamera,
        onSelectPressedGallery: selectGallery,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: ColorUtils.blueMiddleColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: ColorUtils.primaryColor,
                width: 1,
                strokeAlign: 3,
              ),
            ),
            child: path.isNotEmpty
                ? Image.file(
                    File(path),
                    width: 320,
                    height: 200,
                    fit: BoxFit.fitWidth,
                  )
                : SvgPicture.network(
                    url,
                  ),
          ),
          Visibility(
            visible: path.isEmpty,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: ColorUtils.textColor.withOpacity(.5),
                      shape: BoxShape.circle),
                  child: const Icon(Icons.add),
                ),
                Text(
                  'Provide the front side of the ID card.',
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
