class ListTruckDetailModel {
    ListTruckDetailModel({
        this.photos,
        this.bonus,
        this.stock,
        this.id,
        this.name,
        this.pembayaran,
        this.harga,
        this.deskripsi,
        this.discount,
        this.promo,
        this.type,
    });

    List<Photo> photos;
    List<Bonus> bonus;
    String stock;
    String id;
    String name;
    String pembayaran;
    String harga;
    String deskripsi;
    String discount;
    String promo;
    String type;

    factory ListTruckDetailModel.createList(Map<String, dynamic> json) => ListTruckDetailModel(
        photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        bonus: List<Bonus>.from(json["bonus"].map((x) => Bonus.fromJson(x))),
        stock: json["stock"].toString(),
        id: json["id"].toString(),
        name: json["name"].toString(),
        pembayaran: json["pembayaran"].toString(),
        harga: json["harga"].toString(),
        deskripsi: json["deskripsi"].toString(),
        discount: json["discount"].toString(),
        promo: json["promo"].toString(),
        type: json["type"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
        "bonus": List<dynamic>.from(bonus.map((x) => x.toJson())),
        "stock": stock,
        "id": id,
        "name": name,
        "pembayaran": pembayaran,
        "harga": harga,
        "deskripsi": deskripsi,
        "discount": discount,
        "promo": promo,
        "type": type,
    };
}

class Bonus {
    Bonus({
        this.name,
    });

    String name;

    factory Bonus.fromJson(Map<String, dynamic> json) => Bonus(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}

class Photo {
    Photo({
        this.url,
    });

    String url;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
    };
}