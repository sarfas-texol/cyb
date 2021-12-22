import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  Article({
    this.message,
    this.error,
    this.data,
  });

  String? message;
  bool? error;
  Data? data;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    message: json["message"],
    error: json["error"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.popupBanner,
    this.bookmarkCount,
    this.banner,
    this.articles,
    this.healthVideos,
    this.category,
    this.liveUpdates,
  });

  PopupBanner? popupBanner;
  int? bookmarkCount;
  List<Banner>? banner;
  List<ArticleElement>? articles;
  List<ArticleElement>? healthVideos;
  List<Category>? category;
  LiveUpdates? liveUpdates;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    popupBanner: PopupBanner.fromJson(json["PopupBanner"]),
    bookmarkCount: json["bookmark_count"],
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
    articles: List<ArticleElement>.from(json["articles"].map((x) => ArticleElement.fromJson(x))),
    healthVideos: List<ArticleElement>.from(json["health_videos"].map((x) => ArticleElement.fromJson(x))),
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    liveUpdates: LiveUpdates.fromJson(json["live_updates"]),
  );

  Map<String, dynamic> toJson() => {
    "PopupBanner": popupBanner!.toJson(),
    "bookmark_count": bookmarkCount,
    "banner": List<dynamic>.from(banner!.map((x) => x.toJson())),
    "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
    "health_videos": List<dynamic>.from(healthVideos!.map((x) => x.toJson())),
    "category": List<dynamic>.from(category!.map((x) => x.toJson())),
    "live_updates": liveUpdates!.toJson(),
  };
}

class ArticleElement {
  ArticleElement({
    this.id,
    this.name,
    this.maincategoryId,
    this.maincategoryName,
    this.articleList,
    this.videosList,
  });

  String? id;
  String? name;
  String? maincategoryId;
  String? maincategoryName;
  List<ArticleList>? articleList;
  List<VideosList>? videosList;

  factory ArticleElement.fromJson(Map<String, dynamic> json) => ArticleElement(
    id: json["_id"],
    name: json["name"],
    maincategoryId: json["maincategory_id"],
    maincategoryName: json["maincategory_name"],
    articleList: json["article_list"] == null ? null : List<ArticleList>.from(json["article_list"].map((x) => ArticleList.fromJson(x))),
    videosList: json["videos_list"] == null ? null : List<VideosList>.from(json["videos_list"].map((x) => VideosList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "maincategory_id": maincategoryId,
    "maincategory_name": maincategoryName,
    "article_list": articleList == null ? null : List<dynamic>.from(articleList!.map((x) => x.toJson())),
    "videos_list": videosList == null ? null : List<dynamic>.from(videosList!.map((x) => x.toJson())),
  };
}

class ArticleList {
  ArticleList({
    this.id,
    this.readTime,
    this.image,
    this.createdAt,
    this.likeCount,
    this.isSaved,
    this.isLiked,
    this.title,
    this.type,
  });

  String? id;
  String? readTime;
  String? image;
  String? createdAt;
  int? likeCount;
  int? isSaved;
  int? isLiked;
  String? title;
  String? type;

  factory ArticleList.fromJson(Map<String, dynamic> json) => ArticleList(
    id: json["_id"],
    readTime: json["readTime"],
    image: json["image"],
    createdAt: json["createdAt"],
    likeCount: json["like_count"],
    isSaved: json["is_saved"],
    isLiked: json["is_liked"],
    title: json["title"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "readTime": readTime,
    "image": image,
    "createdAt": createdAt,
    "like_count": likeCount,
    "is_saved": isSaved,
    "is_liked": isLiked,
    "title": title,
    "type": type,
  };
}

class VideosList {
  VideosList({
    this.id,
    this.video,
    this.thumbnail,
    this.duration,
    this.createdAt,
    this.likeCount,
    this.isSaved,
    this.isLiked,
    this.type,
    this.title,
  });

  String? id;
  String? video;
  String? thumbnail;
  String? duration;
  String? createdAt;
  int? likeCount;
  int? isSaved;
  int? isLiked;
  String? type;
  String? title;

  factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
    id: json["_id"],
    video: json["video"],
    thumbnail: json["thumbnail"],
    duration: json["duration"],
    createdAt: json["createdAt"],
    likeCount: json["like_count"],
    isSaved: json["is_saved"],
    isLiked: json["is_liked"],
    type: json["type"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "video": video,
    "thumbnail": thumbnail,
    "duration": duration,
    "createdAt": createdAt,
    "like_count": likeCount,
    "is_saved": isSaved,
    "is_liked": isLiked,
    "type": type,
    "title": title,
  };
}

class Banner {
  Banner({
    this.id,
    this.redirectType,
    this.image,
  });

  String? id;
  String? redirectType;
  String? image;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["_id"],
    redirectType: json["redirect_type"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "redirect_type": redirectType,
    "image": image,
  };
}

class Category {
  Category({
    this.image,
    this.name,
  });

  String? image;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
  };
}

class LiveUpdates {
  LiveUpdates({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory LiveUpdates.fromJson(Map<String, dynamic> json) => LiveUpdates(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

class PopupBanner {
  PopupBanner({
    this.img,
    this.status,
  });

  String? img;
  bool? status;

  factory PopupBanner.fromJson(Map<String, dynamic> json) => PopupBanner(
    img: json["img"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "status": status,
  };
}






HealthTips healthTipsFromJson(String str) => HealthTips.fromJson(json.decode(str));

String healthTipsToJson(HealthTips data) => json.encode(data.toJson());

class HealthTips {
  HealthTips({
    this.error,
    this.message,
    this.data,
  });

  bool? error;
  String? message;
  List<HealthTipsData>? data;

  factory HealthTips.fromJson(Map<String, dynamic> json) => HealthTips(
    error: json["error"],
    message: json["message"],
    data: List<HealthTipsData>.from(json["data"].map((x) => HealthTipsData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class HealthTipsData {
  HealthTipsData({
    this.itemName,
    this.tips,
  });

  String? itemName;
  List<Tip>? tips;

  factory HealthTipsData.fromJson(Map<String, dynamic> json) => HealthTipsData(
    itemName: json["item_name"],
    tips: List<Tip>.from(json["tips"].map((x) => Tip.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "item_name": itemName,
    "tips": List<dynamic>.from(tips!.map((x) => x.toJson())),
  };
}

class Tip {
  Tip({
    this.id,
    this.description,
    this.image,
    this.title,
    this.postedOn,
    this.readTime,
    this.likeCount,
    this.isLiked,
    this.type,
    this.tipId,
    this.name,
    this.healthTips,
  });

  String? id;
  String? description;
  String? image;
  String? title;
  PostedOn? postedOn;
  ReadTime? readTime;
  int? likeCount;
  int? isLiked;
  Type? type;
  String? tipId;
  String? name;
  List<Tip>? healthTips;

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
    id: json["_id"] == null ? null : json["_id"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : json["image"],
    title: json["title"] == null ? null : json["title"],
    postedOn: json["posted_on"] == null ? null : postedOnValues.map![json["posted_on"]],
    readTime: json["read_time"] == null ? null : readTimeValues.map![json["read_time"]],
    likeCount: json["like_count"] == null ? null : json["like_count"],
    isLiked: json["is_liked"] == null ? null : json["is_liked"],
    type: json["type"] == null ? null : typeValues.map![json["type"]],
    tipId: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    healthTips: json["health_tips"] == null ? null : List<Tip>.from(json["health_tips"].map((x) => Tip.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "description": description == null ? null : description,
    "image": image == null ? null : image,
    "title": title == null ? null : title,
    "posted_on": postedOn == null ? null : postedOnValues.reverse![postedOn],
    "read_time": readTime == null ? null : readTimeValues.reverse![readTime],
    "like_count": likeCount == null ? null : likeCount,
    "is_liked": isLiked == null ? null : isLiked,
    "type": type == null ? null : typeValues.reverse![type],
    "id": tipId == null ? null : tipId,
    "name": name == null ? null : name,
    "health_tips": healthTips == null ? null : List<dynamic>.from(healthTips!.map((x) => x.toJson())),
  };
}

enum PostedOn { THE_3_MONTHS_AGO }

final postedOnValues = EnumValues({
  "3 months ago": PostedOn.THE_3_MONTHS_AGO
});

enum ReadTime { THE_10_MIN_READ, THE_12_MIN_READ, THE_10_MIN, THE_20_MIN_READ }

final readTimeValues = EnumValues({
  "10 min": ReadTime.THE_10_MIN,
  "10 min read": ReadTime.THE_10_MIN_READ,
  "12 min read": ReadTime.THE_12_MIN_READ,
  "20 min read": ReadTime.THE_20_MIN_READ
});

enum Type { HEALTH_TIP }

final typeValues = EnumValues({
  "healthTip": Type.HEALTH_TIP
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
