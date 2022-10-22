

// To parse this JSON data, do
//
//     final tCurrency = tCurrencyFromJson(jsonString);

import 'dart:convert';

class TCurrency {
  
  int? pkIId;
  String? sCode;
  String? sName;
  String? dValue;
  String? dTrading;
  String? sIcon;
  bool? bEnabled;
  DateTime? dtCreatedDate;
  DateTime? dtModifiedDate;
  dynamic dtDeletedDate;

  TCurrency({
    this.pkIId,
    this.sCode,
    this.sName,
    this.dValue,
    this.dTrading,
    this.sIcon,
    this.bEnabled,
    this.dtCreatedDate,
    this.dtModifiedDate,
    this.dtDeletedDate,
  });

  
  factory TCurrency.fromJson(Map<String, dynamic> json) => TCurrency(
    pkIId: json["pk_i_id"] == null ? null : json["pk_i_id"],
    sCode: json["s_code"] == null ? null : json["s_code"],
    sName: json["s_name"] == null ? null : json["s_name"],
    dValue: json["d_value"] == null ? null : json["d_value"],
    dTrading: json["d_trading"] == null ? null : json["d_trading"],
    sIcon: json["s_icon"] == null ? null : json["s_icon"],
    bEnabled: json["b_enabled"] == null ? null : json["b_enabled"],
    dtCreatedDate: json["dt_created_date"] == null ? null : DateTime.parse(json["dt_created_date"]),
    dtModifiedDate: json["dt_modified_date"] == null ? null : DateTime.parse(json["dt_modified_date"]),
    dtDeletedDate: json["dt_deleted_date"],
  );

  

}
