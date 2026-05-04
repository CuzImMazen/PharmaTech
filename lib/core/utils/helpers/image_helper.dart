import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ImageType { network, asset }

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

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageType.network:
        return _buildNetwork();
      case ImageType.asset:
        return _buildAsset();
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

  Widget _placeholder() => const Center(child: CircularProgressIndicator());

  Widget _errorWidget() => const Icon(Icons.broken_image);
}
