import 'dart:convert';

StackModel stackModelFromJson(String str) =>
    StackModel.fromJson(json.decode(str));

String stackModelToJson(StackModel data) => json.encode(data.toJson());

class StackModel {
  StackModel({
    this.serverResponse,
  });

  ServerResponse serverResponse;

  factory StackModel.fromJson(Map<String, dynamic> json) => StackModel(
        serverResponse: ServerResponse.fromJson(json["serverResponse"]),
      );

  Map<String, dynamic> toJson() => {
        "serverResponse": serverResponse.toJson(),
      };
}

class ServerResponse {
  ServerResponse({
    this.code,
    this.body,
  });

  Code code;
  Body body;

  factory ServerResponse.fromJson(Map<String, dynamic> json) => ServerResponse(
        code: Code.fromJson(json["code"]),
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code.toJson(),
        "body": body.toJson(),
      };
}

class Body {
  Body({
    this.promo,
  });

  Promo promo;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        promo: Promo.fromJson(json["promo"]),
      );

  Map<String, dynamic> toJson() => {
        "promo": promo.toJson(),
      };
}

class Promo {
  Promo({
    this.list,
    this.page,
  });

  List<ListElement> list;
  Page page;

  factory Promo.fromJson(Map<String, dynamic> json) => Promo(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        page: Page.fromJson(json["page"]),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "page": page.toJson(),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.shop,
    this.shopId,
    this.name,
    this.description,
    this.imgThumb,
    this.imgFull,
    this.shopDescription,
  });

  int id;
  String shop;
  int shopId;
  String name;
  String description;
  String imgThumb;
  String imgFull;
  String shopDescription;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        shop: json["shop"],
        shopId: json["shop_id"],
        name: json["name"],
        description: json["description"],
        imgThumb: json["img_thumb"],
        imgFull: json["img_full"],
        shopDescription: json["shop_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop": shop,
        "shop_id": shopId,
        "name": name,
        "description": description,
        "img_thumb": imgThumb,
        "img_full": imgFull,
        "shop_description": shopDescription,
      };
}

class Page {
  Page({
    this.totalPageCount,
    this.requestedPage,
    this.totalItems,
    this.itemsPerPage,
  });

  int totalPageCount;
  int requestedPage;
  int totalItems;
  int itemsPerPage;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        totalPageCount: json["totalPageCount"],
        requestedPage: json["requestedPage"],
        totalItems: json["totalItems"],
        itemsPerPage: json["itemsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalPageCount": totalPageCount,
        "requestedPage": requestedPage,
        "totalItems": totalItems,
        "itemsPerPage": itemsPerPage,
      };
}

class Code {
  Code({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Code.fromJson(Map<String, dynamic> json) => Code(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
