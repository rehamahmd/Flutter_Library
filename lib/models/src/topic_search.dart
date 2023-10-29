class TopicSearch {
  int? id;

  TopicSearch({
    this.id,
  });

  fromSearch(TopicSearch newSearch) {
    id = newSearch.id;
  }

  Map<String, String> toMap() {
    return <String, String>{};
  }

  String toSearchString() {
    String _searchQuery = "";
    return _searchQuery;
  }

  bool isSearching() {
    if (id != null) return true;
    return false;
  }
}
