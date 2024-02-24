import 'package:fancricsport/res/app_colors.dart';
import 'package:fancricsport/res/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';

Widget imageLoader({
  String url = "",
  double h = 0.0,
  double w = 0.0,
  double r = 40.0,
  String loaderImage = "",
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(r),
    child: url.isEmpty
        ? Image.asset(
            AssetsPath.loaderImage,
            fit: BoxFit.cover,
            height: h,
            width: w,
          )
        : ImageFade(
            image: NetworkImage(url),
            height: h,
            width: w,
            duration: const Duration(milliseconds: 500),
            syncDuration: const Duration(milliseconds: 150),
            alignment: Alignment.center,
            fit: BoxFit.cover,

            placeholder: Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AssetsPath.loaderImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // shows progress while loading an image:
            loadingBuilder: (context, progress, chunkEvent) => Center(
                child:
                    CircularProgressIndicator(value: progress, color: AppColor.appBarColor)),

            // displayed when an error occurs:
            errorBuilder: (context, error) => loaderImage.isNotEmpty
                ? Container(
                    height: h,
                    width: w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(loaderImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    color: const Color(0xFF6F6D6A),
                    alignment: Alignment.center,
                    child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
                  ),
          ),
  );
}
