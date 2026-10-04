import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CircleImage extends StatelessWidget {
  final String url;
  final double? size;

  const CircleImage({required this.url, super.key, this.size});

  @override
  Widget build(BuildContext context) => ClipOval(
    child: CachedNetworkImage(
      fit: BoxFit.cover,
      width: size,
      height: size,
      fadeInDuration: Motion.medium,
      imageUrl: url,
      errorWidget: (_, _, _) => SizedBox.square(
        dimension: size,
        child: ColoredBox(
          color: ColorScheme.of(context).primaryContainer,
          child: Icon(
            Icons.person_rounded,
            size: (size ?? Dimens.space46) * 0.5,
            color: ColorScheme.of(context).onPrimaryContainer,
          ),
        ),
      ),
      placeholder: (_, _) =>
          Skeletonizer(child: Bone.circle(size: size ?? Dimens.space46)),
    ),
  );
}
