import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ImageType { network, asset, svg }

class AppImage extends StatelessWidget {
  final String path;
  final ImageType type;
  final double? width;
  final double? height;
  final BoxFit fit;

  const AppImage.network(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : type = ImageType.network;

  const AppImage.asset(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  }) : type = ImageType.asset;

  const AppImage.svg(
    this.path, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : type = ImageType.svg;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageType.network:
        return _buildNetwork();
      case ImageType.asset:
        return _buildAsset();
      case ImageType.svg:
        return _buildSvg();
    }
  }

  Widget _buildNetwork() {
    if (path.isEmpty) return _errorWidget();

    return CachedNetworkImage(
      imageUrl: path,
      width: width,
      height: height,
      fit: fit,
      placeholder: (_, _) => _placeholder(),
      errorWidget: (_, _, _) => _errorWidget(),
    );
  }

  Widget _buildAsset() {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, _, _) => _errorWidget(),
    );
  }

  Widget _buildSvg() {
    if (path.isEmpty) return _errorWidget();

    return SvgPicture.asset(path, width: width, height: height, fit: fit);
  }

  Widget _placeholder() {
    return const Center(
      child: SizedBox(
        width: 16,
        height: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _errorWidget() {
    return const Icon(Icons.broken_image);
  }
}
