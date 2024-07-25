import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

///*********************************************
/// Created by ukietux on 03/11/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class CircleImage extends StatelessWidget {
  final String url;
  final double? size;

  const CircleImage({super.key, required this.url, this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(360),

      /// 360 degree circle
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: size,
        height: size,
        fadeInDuration: const Duration(milliseconds: 300),
        imageUrl: url,
        placeholder: (context, url) => SizedBox(
          width: Dimens.space46,
          height: Dimens.space46,
          child: const Loading(showMessage: false),
        ),
        // errorWidget: (context, url, error) =>
        //     new SvgPicture.asset(Images.icEmpty),
      ),
    );
  }
}
