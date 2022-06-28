import 'dart:convert';

List<MyPlans> myPlansFromJson(String str) => List<MyPlans>.from(json.decode(str).map((x) => MyPlans.fromJson(x)));


class MyPlans {
    MyPlans({
        this.id,
        this.price,
        this.description,
        this.title,
        this.visible,
        this.type,
        this.promotion,
    });

    var id;
    var price;
    var description;
    var title;
    var visible;
    var type;
    var promotion;

    factory MyPlans.fromJson(Map<String, dynamic> json) => MyPlans(
        id: json["id"],
        price: json["price"],
        description: json["description"],
        title: json["title"],
        visible: json["visible"],
        type: json["type"],
        promotion: Promotion.fromJson(json["promotion"]),
    );

}

class Promotion {
    Promotion({
        this.regular,
    });

    var regular;

    factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        regular: Regular.fromJson(json["regular"]),
    );

}

class Regular {
    Regular({
        this.featured,
        this.top,
        this.bumpUp,
    });

    var featured;
    var top;
    var bumpUp;

    factory Regular.fromJson(Map<String, dynamic> json) => Regular(
        featured: json["featured"],
        top: json["_top"],
        bumpUp: json["_bump_up"],
    );

    Map<String, dynamic> toJson() => {
        "featured": featured,
        "_top": top,
        "_bump_up": bumpUp,
    };
}
