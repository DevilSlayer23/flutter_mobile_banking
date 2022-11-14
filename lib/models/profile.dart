// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.activeBalance,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    this.email = "",
    required this.accountNumber,
    required this.accountType,
    required this.interestRate,
    // required this.transactions,
    required this.accuredInterest,
  });

  int id;
  double activeBalance;
  String firstName;
  String lastName;
  String mobile;
  String email;
  String accountNumber;
  String accountType;
  double interestRate;
  // List<Transaction> transactions;
  double accuredInterest;
  




  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        activeBalance: json["active_balance"].toDouble(),
        firstName: json["first_name"],
        lastName: json["last_name"],
        mobile: json["mobile"],
        email: json["email"],
        accountNumber: json["account_number"],
        accountType: json["account_type"],
        interestRate: json["interest_rate"].toDouble(),
        // transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
        accuredInterest: json["accured_interest"].toDouble(),
        

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active_balance": activeBalance,
        "first_name": firstName,
        "last_name": lastName,
        "mobile": mobile,
        "email": email,
        "account_number": accountNumber,
        "account_type": accountType,
        "interest_rate": interestRate,
        // "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
        "accured_interest": accuredInterest,

        
      };
}
