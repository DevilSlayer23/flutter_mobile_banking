import 'package:sahakari/models/offer.dart';
import 'package:sahakari/services/API/api_helper.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/custom_scaffold.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  late List<Offer> offers = [
    Offer(
      id: 1,
      title: "Offer 1",
      details: "Offer 1 description",
      startDatetime: DateTime.utc(2022),
      endDatetime: DateTime.now(),
      location: "Kathmandu",
      photo: "assets/img/logo.png",
    ),
    Offer(
      id: 2,
      title: "Offer 2",
      details: "Offer 2 description",
      startDatetime: DateTime.utc(2022),
      endDatetime: DateTime.now(),
      location: "Kathmandu",
      photo: "assets/img/logo.png",
    ),
    Offer(
      id: 3,
      title: "Offer 3",
      details: "Offer 3 description",
      startDatetime: DateTime.utc(2022),
      endDatetime: DateTime.now(),
      location: "Kathmandu",
      photo: "assets/img/logo.png",
    ),
    Offer(
      id: 4,
      title: "Offer 4",
      details: "Offer 4 description",
      startDatetime: DateTime.utc(2022),
      endDatetime: DateTime.now(),
      location: "Kathmandu",
      photo: "assets/img/logo.png",
    ),
  ];
  bool isLoading = true;
  @override
  void initState() {
    getdata();
    super.initState();
  }

  Future<List<Offer>> getdata() async {
    // APIService api = APIService();
    // var data = await api.getOffers();
    // offers = offerFromJson(data);
    debugPrint("${offers.length}");
    setState(() {
      isLoading = false;
    });
    return offers;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldNew(
      leadingWidget: [Icon(Icons.card_giftcard)],
      actions: [Icon(Icons.search)],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 20,
          ),
          // !isLoading
          //     ? ListView.builder(
          //         itemCount: offers.length,
          //         shrinkWrap: true,
          //         itemBuilder: (context, index) {
          //           return OfferItemCard(
          //             title: offers[index].title,
          //             details: offers[index].details,
          //           );
          //         })
          //     : Padding(
          //         padding: const EdgeInsets.fromLTRB(0, 150, 0, 20),
          //         child: Center(child: blue_loading),
          //       )
          FutureBuilder<List<Offer>>(
              future: getdata(),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, index) {
                            return OfferItemCard(
                              offer: snapshot.data![index],
                            );
                          },
                        )
                      : Center(
                          child: blue_loading,
                        ))
        ],
      ),
    );
  }
}
