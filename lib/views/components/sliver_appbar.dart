import 'package:flutter/material.dart';
import 'package:sahakari/services/screen_size.dart';

class CustomSliverAppbar extends StatefulWidget {
  final List<Widget>? leadingWidget;
  final List<Widget>? trailingWidget;

  const CustomSliverAppbar({Key? key, this.leadingWidget, this.trailingWidget})
      : super(key: key);

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      flexibleSpace: Container(
        width: Responsive.getWidth(context) * 0.8,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: widget.leadingWidget ?? [],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.trailingWidget ?? [],
            )
          ],
        ),
      ),
    );
  }
}
