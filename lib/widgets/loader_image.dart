import 'package:flutter/material.dart';

class LoaderImage extends StatelessWidget {
  final String imageUrl;

  const LoaderImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      alignment: FractionalOffset.topCenter,
      fit: BoxFit.fitWidth,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return ConstrainedBox(
          constraints: BoxConstraints(minHeight: 120),
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
