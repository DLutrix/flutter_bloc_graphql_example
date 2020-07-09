import 'dart:convert';

import 'package:meta/meta.dart';

SeasonModel seasonModelFromJson(String str) =>
    SeasonModel.fromJson(json.decode(str));

String seasonModelToJson(SeasonModel data) => json.encode(data.toJson());

class SeasonModel {
  SeasonModel({
    @required this.page,
  });

  final Page page;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => SeasonModel(
        page: json["page"] == null ? null : Page.fromJson(json["page"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page.toJson(),
      };
}

class Page {
  Page({
    @required this.media,
  });

  final List<Media> media;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        media: json["media"] == null
            ? null
            : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "media": media == null
            ? null
            : List<dynamic>.from(media.map((x) => x.toJson())),
      };
}

class Media {
  Media({
    @required this.id,
    @required this.title,
    @required this.coverImage,
  });

  final int id;
  final Title title;
  final CoverImage coverImage;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : Title.fromJson(json["title"]),
        coverImage: json["coverImage"] == null
            ? null
            : CoverImage.fromJson(json["coverImage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title.toJson(),
        "coverImage": coverImage == null ? null : coverImage.toJson(),
      };
}

class CoverImage {
  CoverImage({
    @required this.extraLarge,
    @required this.large,
    @required this.medium,
    @required this.color,
  });

  final String extraLarge;
  final String large;
  final String medium;
  final String color;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        extraLarge: json["extraLarge"] == null ? null : json["extraLarge"],
        large: json["large"] == null ? null : json["large"],
        medium: json["medium"] == null ? null : json["medium"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "extraLarge": extraLarge == null ? null : extraLarge,
        "large": large == null ? null : large,
        "medium": medium == null ? null : medium,
        "color": color == null ? null : color,
      };
}

class Title {
  Title({
    @required this.userPreferred,
    @required this.native,
  });

  final String userPreferred;
  final String native;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        userPreferred:
            json["userPreferred"] == null ? null : json["userPreferred"],
        native: json["native"] == null ? null : json["native"],
      );

  Map<String, dynamic> toJson() => {
        "userPreferred": userPreferred == null ? null : userPreferred,
        "native": native == null ? null : native,
      };
}
