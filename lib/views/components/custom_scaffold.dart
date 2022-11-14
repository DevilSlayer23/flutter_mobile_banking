import 'package:flutter/material.dart';
import 'package:sahakari/services/screen_size.dart';
import 'package:sahakari/views/components/custom_shape.dart';
import 'package:sahakari/views/components/sliver_appbar.dart';

class CustomScaffoldNew extends StatefulWidget {
  final Widget body;
  final List<Widget>? leadingWidget;
  final Widget? titleWidget;
  final List<Widget>? actions;
  // final Widget? bottomNavigationBar;
  // final Widget? floatingActionButton;

  const CustomScaffoldNew(
      {Key? key,
      required this.body,
      this.leadingWidget,
      this.actions,
      this.titleWidget})
      : super(key: key);

  @override
  State<CustomScaffoldNew> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffoldNew> {
  @override
  Widget build(BuildContext context) {
    return _sliverScaffold(body: widget.body);
  }

  Widget _sliverScaffold({required Widget body}) => SafeArea(
        child: Scaffold(
          body: CustomScrollView(slivers: [
            CustomSliverAppbar(
              leadingWidget: widget.leadingWidget,
              trailingWidget: widget.actions,
            ),
            SliverToBoxAdapter(
              child: Container(
                height: Responsive.getHeight(context),
                width: Responsive.getWidth(context) * 0.9,
                decoration: BoxDecoration(
                  color: Color(0xffEEEEFF),
                ),
                child: Stack(
                  children: [
                    // Container(
                    //   height: 32,
                    //   width: _deviceWidth,
                    //   decoration: BoxDecoration(
                    //     color: Theme.of(context).primaryColor,
                    //     borderRadius: const BorderRadius.only(
                    //       topLeft: Radius.circular(32),
                    //       topRight: Radius.circular(32),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   height: _deviceHeight,
                    //   width: _deviceWidth,
                    //   child: Image.asset("assets/img/bck_r.png"),
                    // ),

                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: 50,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Positioned(top: 10, left: 10, right: 10, child: body),
                  ],
                ),
              ),
            )
          ]),
        ),
      );

  // Widget _scaffold() => Scaffold(
  //       backgroundColor: Theme.of(context).colorScheme.background,
  //       appBar: AppBar(
  //         toolbarHeight: 80,
  //         flexibleSpace: FlexibleSpaceBar(
  //           title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
  //             (widget.leadingIcon != null)
  //                 ? Icon(
  //                     widget.leadingIcon,
  //                     color: Theme.of(context).colorScheme.primary,
  //                   )
  //                 : SizedBox(),
  //             SizedBox(
  //               width: 10,
  //             ),
  //             Text(
  //               widget.title ?? "",
  //               style: Theme.of(context).textTheme.bodyText1,
  //             )
  //           ]),
  //           background: Container(
  //             // height: MediaQuery.of(context).size.height * 0.2,
  //             decoration: BoxDecoration(
  //               color: Theme.of(context).primaryColor,
  //             ),
  //           ),
  //         ),
  //       ),
  //       // backgroundColor: Colors.white,
  //       body: SingleChildScrollView(
  //         child: Container(
  //           height: Responsive.getHeight(context),
  //           width: Responsive.getWidth(context),
  //           decoration: BoxDecoration(
  //             color: Color(0xffEEEEFF),
  //           ),
  //           child: Stack(
  //             children: [
  //               // Container(
  //               //   height: 32,
  //               //   width: _deviceWidth,
  //               //   decoration: BoxDecoration(
  //               //     color: Theme.of(context).primaryColor,
  //               //     borderRadius: const BorderRadius.only(
  //               //       topLeft: Radius.circular(32),
  //               //       topRight: Radius.circular(32),
  //               //     ),
  //               //   ),
  //               // ),
  //               // Container(
  //               //   height: _deviceHeight,
  //               //   width: _deviceWidth,
  //               //   child: Image.asset("assets/img/bck_r.png"),
  //               // ),

  //               ClipPath(
  //                 clipper: CustomShape(),
  //                 child: Container(
  //                   height: 50,
  //                   color: Theme.of(context).primaryColor,
  //                 ),
  //               ),
  //               // Expanded(
  //               //   child: widget.body ?? Container(),
  //               // )
  //               Positioned(
  //                 top: 10,
  //                 left: 10,
  //                 right: 10,
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.end,
  //                   children: [
  //                     Expanded(
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           color: Colors.transparent,
  //                           borderRadius: BorderRadius.circular(10),
  //                         ),
  //                         width: Responsive.getWidth(context) * 0.8,
  //                         child: widget.body,
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
}
