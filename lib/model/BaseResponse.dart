

// To parse this JSON data, do
//
//     final tBaseResponse = tBaseResponseFromJson(jsonString);



class TBaseResponse {
  TBaseResponse({
    this.pagination,
    required this.currencies,
  });

  Pagination? pagination;
  List<TCurrency> currencies;

  factory TBaseResponse.fromJson(Map<String, dynamic> json) => TBaseResponse(
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    currencies: List<TCurrency>.from(json["currencies"].map((x) => TCurrency.fromJson(x))),
  );


}

class TCurrency {
  TCurrency({
    required this.pkIId,
    required this.sCode,
    required this.sName,
    required this.dValue,
    required this.dTrading,
    required this.sIcon,
    required this.bEnabled,
    required this.dtDeletedDate,
  });

  int pkIId;
  String sCode;
  String sName;
  String dValue;
  String dTrading;
  String sIcon;
  bool bEnabled;
  dynamic dtDeletedDate;

  factory TCurrency.fromJson(Map<String, dynamic> json) => TCurrency(
    pkIId: json["pk_i_id"] == null ? null : json["pk_i_id"],
    sCode: json["s_code"] == null ? null : json["s_code"],
    sName: json["s_name"] == null ? null : json["s_name"],
    dValue: json["d_value"] == null ? null : json["d_value"],
    dTrading: json["d_trading"] == null ? null : json["d_trading"],
    sIcon: json["s_icon"] == null ? null : json["s_icon"],
    bEnabled: json["b_enabled"] == null ? null : json["b_enabled"],
    dtDeletedDate: json["dt_deleted_date"],
  );


}

class Pagination {
  Pagination({
    this.iTotalObjects,
    this.iItemsOnPage,
    this.iPerPages,
    this.iCurrentPage,
    this.iTotalPages,
  });

  int? iTotalObjects;
  int? iItemsOnPage;
  int? iPerPages;
  int? iCurrentPage;
  int? iTotalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    iTotalObjects: json["i_total_objects"] == null ? null : json["i_total_objects"],
    iItemsOnPage: json["i_items_on_page"] == null ? null : json["i_items_on_page"],
    iPerPages: json["i_per_pages"] == null ? null : json["i_per_pages"],
    iCurrentPage: json["i_current_page"] == null ? null : json["i_current_page"],
    iTotalPages: json["i_total_pages"] == null ? null : json["i_total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "i_total_objects": iTotalObjects == null ? null : iTotalObjects,
    "i_items_on_page": iItemsOnPage == null ? null : iItemsOnPage,
    "i_per_pages": iPerPages == null ? null : iPerPages,
    "i_current_page": iCurrentPage == null ? null : iCurrentPage,
    "i_total_pages": iTotalPages == null ? null : iTotalPages,
  };
}


