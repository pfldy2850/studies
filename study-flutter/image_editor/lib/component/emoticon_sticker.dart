import 'package:flutter/material.dart';

class EmoticonSticker extends StatefulWidget {
  final VoidCallback onTransform;
  final String imgPath;
  final bool isSelected;

  const EmoticonSticker({
    Key? key,
    required this.onTransform,
    required this.imgPath,
    required this.isSelected,
  }) : super(key: key);

  @override
  _EmoticonStickerState createState() => _EmoticonStickerState();
}

class _EmoticonStickerState extends State<EmoticonSticker> {
  double scale = 1;
  double hTransform = 0;
  double vTransform = 0;
  double actualScale = 1;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(hTransform, vTransform)
        ..scale(scale, scale),
      child: Container(
        decoration: widget.isSelected
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: Colors.blue,
                  width: 1.0,
                ),
              )
            : BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                ),
              ),
        child: GestureDetector(
          onTap: () {
            widget.onTransform();
          },
          onScaleUpdate: (details) {
            widget.onTransform();
            setState(() {
              scale = details.scale * actualScale;
              vTransform += details.focalPointDelta.dy;
              hTransform += details.focalPointDelta.dx;
            });
          },
          onScaleEnd: (details) {
            actualScale = scale;
          },
          child: Image.asset(widget.imgPath),
        ),
      ),
    );
  }
}
