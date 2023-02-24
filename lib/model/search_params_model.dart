

class SearchParams {
  SearchParams({required this.keyword, required this.highlight ,required this.page, required this.pageSize});

  late String keyword;
  late bool highlight;
  late int page;
  late int pageSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["kw"] = keyword;
    map["highlight"] = highlight ? 'yes' : 'no';
    map["page"] = page;
    map["page_size"] = pageSize;
    return map;
  }
}