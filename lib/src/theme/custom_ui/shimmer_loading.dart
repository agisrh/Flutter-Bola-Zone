import 'package:bola_zone/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShimmerImage extends StatelessWidget {
  final String? image;
  final BoxFit? fit;
  final double? width, height;
  const ShimmerImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Image.network(
    //   image!,
    //   // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
    //   // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
    //   fit: fit,
    //   width: width,
    //   height: height,
    // );

    return CachedNetworkImage(
      imageUrl: image!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white10,
        child: Container(
            decoration: const BoxDecoration(
          color: Colors.amberAccent,
        )),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error),
      ),
    );
  }
}

// Shimmer
class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  const ShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? size.height,
      width: width ?? size.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey.shade100,
        baseColor: Colors.grey.shade300,
        child: Container(
            decoration: const BoxDecoration(
          color: Colors.white,
        )),
      ),
    );
  }
}
