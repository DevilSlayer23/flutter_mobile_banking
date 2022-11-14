import 'package:sahakari/models/merchant.dart';
import 'package:sahakari/services/API/api_helper.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/services/screen_size.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:sahakari/views/screens/transaction/pay_bill_confirm.dart';
import 'package:sahakari/views/utils/app_const.dart';
import 'package:flutter/material.dart';

class BillPayment extends StatefulWidget {
  final String type;
  const BillPayment({Key? key, required this.type}) : super(key: key);

  @override
  _BillPaymentState createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  late List<Merchant> merchants = [
    Merchant(
      id: 1,
      orgName: "Nepal Electricity Authority",
      photo: "assets/img/logo.png",
      balance: 105000,
      merchantType: 'ELEC',
      tradeLic: 'license',
      user: '1',
    ),
    Merchant(
      id: 2,
      orgName: "Nepal Telecom",
      photo: "assets/img/logo.png",
      balance: 105000,
      merchantType: 'TEL',
      tradeLic: 'license',
      user: '1',
    ),
    Merchant(
      id: 3,
      orgName: "Ncell",
      photo: "assets/img/logo.png",
      balance: 105000,
      merchantType: 'TEL',
      tradeLic: 'license',
      user: '1',
    ),
    Merchant(
      id: 4,
      orgName: "Nepal Water Authority",
      photo: "assets/img/logo.png",
      balance: 105000,
      merchantType: 'WAT',
      tradeLic: 'license',
      user: '1',
    ),
  ];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    get_merchant_data();
  }

  Future<void> get_merchant_data() async {
    // APIService api = APIService();
    // var data = await api.getMerchantData(filter: widget.type);
    // merchants = merchantFromJson(data.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${getFullName(widget.type)} Bill Payment".toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            "Choose Your Provider",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
          SizedBox(
            height: 30,
          ),
          !isLoading
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: merchants.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PayBillConfirm(
                              mechant: merchants[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: Responsive.getWidth(context),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      Image.network(merchants[index].photo!)),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    merchants[index].orgName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    getFullName(merchants[index].merchantType),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w300,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(height: 400, child: Center(child: blue_loading))
        ],
      ),
    );
  }
}
