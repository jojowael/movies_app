/// page : 1
/// results : []
/// total_pages : 1
/// total_results : 0

class MovieResponse {
  MovieResponse(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.id,
      this.publishedAt,
      this.title,
      this.author,
      this.urlToImage,
      this.message,
      this.code});

  MovieResponse.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    page = json['page'];
    message = json['message'];
    code = json['code'];
    urlToImage = json['urlToImage'];
    author = json['author'];
    title = json['title'];
    publishedAt = json['publishedAt'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(MovieResponse.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<dynamic>? results;
  int? totalPages;
  int? totalResults;
  String? id;
  String? publishedAt;
  String? title;
  String? status;
  String? author;
  String? urlToImage;
  String? message;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['id'] = id;
    map['status'] = status;
    map['author'] = author;
    map['urlToImage'] = urlToImage;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
