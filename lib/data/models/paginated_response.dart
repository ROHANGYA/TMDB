import 'dart:convert';

class PaginatedResponse {
  final int page;
  final List<dynamic> results;
  final int totalPages;
  final int totalResults;

  PaginatedResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PaginatedResponse.fromRawJson(String str) =>
      PaginatedResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaginatedResponse.fromJson(Map<String, dynamic> json) =>
      PaginatedResponse(
        page: json["page"],
        results: json["results"],
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results,
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
