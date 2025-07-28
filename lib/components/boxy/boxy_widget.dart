import 'package:boxy/boxy.dart';
import 'package:flutter/material.dart';
import 'package:json_app/components/icon/icon_widget.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductTile(
      seller: IconWidget(
        urlIcon: 'https://tcp.cs.simport.com.br/gallery/29/image-download',
      ),
      info: Container(
        decoration: BoxDecoration(
          color: const Color(0xff5148bd),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: const Text('Info'),
      ),
    );
  }
}

@immutable
class ProductTileStyle {
  /// How far to the left the seller is inset
  final double sellerInset;

  /// The size of the gap between the title and description
  final double gapHeight;

  const ProductTileStyle({this.sellerInset = 16.0, this.gapHeight = 8.0});

  @override
  bool operator ==(Object? other) =>
      identical(this, other) ||
      (other is ProductTileStyle &&
          other.sellerInset == sellerInset &&
          other.gapHeight == gapHeight);

  @override
  int get hashCode => Object.hash(sellerInset, gapHeight);
}

class ProductTile extends StatelessWidget {
  final Widget info;
  final Widget seller;
  final ProductTileStyle style;

  const ProductTile({
    super.key,

    required this.info,
    required this.seller,
    this.style = const ProductTileStyle(),
  });

  @override
  Widget build(context) {
    return CustomBoxy(
      delegate: ProductTileDelegate(style: style),
      children: [
        BoxyId(id: #info, child: info),
        BoxyId(id: #seller, child: seller),
      ],
    );
  }
}

class ProductTileDelegate extends BoxyDelegate {
  final ProductTileStyle style;

  ProductTileDelegate({required this.style});

  @override
  Size layout() {
    final seller = getChild(#seller);
    final info = getChild(#info);

    // Lay out the seller first so it can provide a minimum height to the title
    // and info
    final sellerSize = seller.layout(
      constraints.deflate(EdgeInsets.only(right: style.sellerInset)),
    );
    final infoSize = info.layout(constraints);
    info.position(Offset(0, infoSize.height + style.gapHeight));
    // Position the seller at the bottom right of the title, offset to the left
    // by sellerInset
    seller.position(
      Offset(
        style.sellerInset,
        (infoSize.height - sellerSize.height / 2) + style.gapHeight / 2,
      ),
    );

    // Lay out info to match the width of title and position it below the title

    return Size(infoSize.width, infoSize.height + style.gapHeight);
  }

  // Any BoxyDelegate with parameters should always implement shouldRelaout,
  // otherwise it won't update when its properties do.
  @override
  bool shouldRelayout(ProductTileDelegate oldDelegate) =>
      style != oldDelegate.style;
}
