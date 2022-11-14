import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sahakari/models/profile.dart';
import 'package:sahakari/services/API/api_helper.dart';
import 'package:sahakari/common/routes/routes.dart';
import 'package:sahakari/services/screen_size.dart';
import 'package:sahakari/views/components/custom_scaffold.dart';
import 'package:sahakari/views/components/reuseable_widgets.dart';
import 'package:sahakari/views/screens/qr_scanner/qr_scanner_latest.dart';
import 'package:sahakari/common/constant.dart';
import 'package:sahakari/views/components/pie_chart.dart';
import 'package:sahakari/views/screens/transaction/add_money_screen.dart';
import 'package:sahakari/views/screens/transaction/bill_payment_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Profile profile;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  Future<void> getdata() async {
    profile = dummyProfile;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldNew(
      leadingWidget: [
        Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Morning,",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      // fontSize: 12,
                    ),
              ),
              Text(
                "${profile.firstName} ${profile.lastName}",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      // fontSize: 16,
                    ),
              )
            ])
      ],
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.sms_outlined,
              color: Theme.of(context).colorScheme.primary),
        ),
      ],
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              // padding: EdgeInsets.all(8),

              // alignment: Alignment.topRight,
              // color: Color(0xFF005CEE),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  Row(
                    children: [
                      isLoading
                          ? loading
                          : Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${profile.accountNumber}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall),
                                      Text("${profile.accountType}")
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      // ElevatedButton(
                      //   child: Text(' + Add Money',
                      //       style: Theme.of(context).textTheme.bodyLarge),
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20)),
                      //     // backgroundColor: Colors.white,
                      //   ),
                      //   onPressed: () async {
                      //     await getdata();
                      //     setState(() {});
                      //     context.pushNamed(Routes.addMoney);
                      //   },
                      // ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 40,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                "4.5 %",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: lightBackgroundColor,
                                        fontSize: 12),
                              ),
                            ),
                            Text(
                              "Interest Rate",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 14,
                                  ),
                            ),
                          ],
                        ),
                      )
                      // ClipOval(
                      //   child: Material(
                      //     color: Colors
                      //         .transparent, //To let the Container background be displayed
                      //     child: IconButton(
                      //         icon: Icon(
                      //           Icons.notifications,
                      //           color: Theme.of(context).colorScheme.onPrimary,
                      //         ),
                      //         onPressed: () {}),
                      //   ),
                      // ),
                      // ClipOval(
                      //   child: Material(
                      //     color: Colors
                      //         .transparent, //To let the Container background be displayed
                      //     child: IconButton(
                      //         icon: Icon(
                      //           Icons.account_circle_rounded,
                      //           color: Theme.of(context).colorScheme.onPrimary,
                      //         ),
                      //         onPressed: () {}),
                      //   ),
                      // ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                                "Rs. ${profile.activeBalance.toStringAsFixed(2)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: 20,
                                    )),
                            Text("active balance".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: 14)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: IconButton(
                            icon: Icon(Icons.visibility_off),
                            onPressed: () {},
                          ),
                        ),
                        Spacer(),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                  "${profile.accuredInterest.toStringAsFixed(2)} Rs.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: 20,
                                      )),
                              Text("accured interest".toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 14)),
                            ])
                      ],
                    ),
                  )
                  // SizedBox(height: 50),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       DashBoardMainItemCard(
                  //         asset: "assets/svg/Sendmoney.svg",
                  //         title: "SEND MONEY",
                  //         onTap: () {
                  //           debugPrint("[profile id] ${profile.id}");
                  //           context.pushNamed(Routes.sendMoney, params: {
                  //             'id': profile.id.toString(),
                  //           });
                  //         },
                  //       ),
                  //       DashBoardMainItemCard(
                  //           asset: "assets/svg/Cashout.svg",
                  //           title: "CASH OUT",
                  //           onTap: () {
                  //             context.push("/home/cash-out");
                  //           }),
                  //       DashBoardMainItemCard(
                  //         asset: "assets/svg/Recharge.svg",
                  //         title: "RECHARGE",
                  //         onTap: () {
                  //           context.goNamed(Routes.recharge);
                  //         },
                  //       ),
                  //       DashBoardMainItemCard(
                  //           asset: "assets/svg/Scan.svg",
                  //           title: "PAY NOW",
                  //           onTap: () {
                  //             context.push('/scan');
                  //           }),
                  //     ])
                ],
              ),
            ),
            SizedBox(),
            Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 30),
                decoration: BoxDecoration(
                    color: Color(0xFFEEF2F8),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "Pay Bills".toUpperCase(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black87.withOpacity(0.8)),
                          ),
                          Spacer(),
                          ClipOval(
                            child: Material(
                              color: Colors
                                  .transparent, //To let the Container background be displayed
                              child: IconButton(
                                  icon: Icon(Icons.arrow_forward_ios_rounded,
                                      color: Colors.black87, size: 20),
                                  onPressed: () {}),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillPayment(
                                  type: 'ELEC',
                                ),
                              ),
                            );
                          },
                          child: PayBillsItem(
                              asset: "assets/img/electricity.png",
                              title: "Electricity"),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BillPayment(
                                    type: 'GAS',
                                  ),
                                ),
                              );
                            },
                            child: PayBillsItem(
                                asset: "assets/img/gas.png", title: "Gas")),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BillPayment(
                                    type: 'WAT',
                                  ),
                                ),
                              );
                            },
                            child: PayBillsItem(
                                asset: "assets/img/water.png", title: "Water")),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillPayment(
                                  type: 'EDU',
                                ),
                              ),
                            );
                          },
                          child: PayBillsItem(
                              asset: "assets/img/education.png",
                              title: "Education"),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillPayment(
                                  type: 'NET',
                                ),
                              ),
                            );
                          },
                          child: PayBillsItem(
                              asset: "assets/img/internet.png",
                              title: "Internet"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillPayment(
                                  type: 'CARD',
                                ),
                              ),
                            );
                          },
                          child: PayBillsItem(
                              asset: "assets/img/credit-card.png",
                              title: "Credit Card"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BillPayment(
                                  type: 'TEL',
                                ),
                              ),
                            );
                          },
                          child: PayBillsItem(
                              asset: "assets/img/telephone.png",
                              title: "Telephone"),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BillPayment(
                                    type: 'TV',
                                  ),
                                ),
                              );
                            },
                            child: PayBillsItem(
                                asset: "assets/img/tv.png", title: "TV"))
                      ],
                    )
                  ],
                )),
            SizedBox(height: 10),
            ExpenseWidget()
          ]),
    );
  }
}
