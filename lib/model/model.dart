
import 'dart:convert';

import 'package:http/http.dart' as http;

Newsresponse newsresponseFromJson(String str) => Newsresponse.fromJson(json.decode(str));

String newsresponseToJson(Newsresponse data) => json.encode(data.toJson());

class Newsresponse {
    String? status;
    int? totalResults;
    List<Article>? articles;

    Newsresponse({
        this.status,
        this.totalResults,
        this.articles,
    });

    factory Newsresponse.fromJson(Map<String, dynamic> json) => Newsresponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: json["articles"] == null ? [] : List<Article>.from(json["articles"]!.map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": articles == null ? [] : List<dynamic>.from(articles!.map((x) => x.toJson())),
    };
}

class Article {
    Source? source;
    String? author;
    String? title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime? publishedAt;
    String? content;

    Article({
        this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source?.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt?.toIso8601String(),
        "content": content,
    };
}

class Source {
    String? id;
    String? name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}


Newsresponse? responsedata;

//data fetch from api
  Future<void>fetchdata() async {
    final url = Uri.parse("https://newsapi.org/v2/everything?q=Apple&apiKey=10b436cd71694fb990b7ab5b7444cc7c");
    //get
    var response = await http.get(url);
    print(response.statusCode);
    
    print(response.body);

    responsedata =Newsresponse.fromJson(jsonDecode(response.body));
  }





