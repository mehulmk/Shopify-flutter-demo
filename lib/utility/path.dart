class Path {
  List<String> components = <String>[];

  ///
  /// The remainder type used to fix an issue which arises with Firestore. In Firestore
  /// there are documents and collections. But sometimes we want to reference information
  /// that type at a path within a document for example:
  /// chats/id/meta
  /// Here the id, type a document but if we generated a path from this, it would point to a
  /// collection. Therefore if the path we pass in to the ref doesn't point to the correct
  /// reference type, we truncate it by one and set the remainder
  ///
  String? remainder;

  Path(List<String> path) {
    for (var s in path) {
      components.add(s);
    }
  }

  Path.fromPath(String path) {
    Path(path.split("/").toList());
  }

  String first() {
    return components.first;
  }

  String last() {
    return components.last;
  }

  int size() {
    return components.length;
  }

  String? get(int index) {
    if (components.length > index) {
      return components.elementAt(index);
    }
    return null;
  }

  @override
  String toString() {
    String path = "/";
    for (var element in components) {
      path = path + element + "/";
    }
    return path.substring(0, path.length - 1) + ".json";
  }

  Path child(String child) {
    components.add(child);
    return this;
  }

  Path children(List<String> children) {
    components.addAll(children);
    return this;
  }

  Path removeLast() {
    if (components.isNotEmpty) {
      components.removeLast();
    }
    return this;
  }

  bool isDocument() {
    return size() % 2 == 0;
  }

  List<String> getComponents() {
    return components;
  }

  String? getRemainder() {
    return remainder;
  }

  void normalizeForDocument() {
    if (!isDocument()) {
      remainder = last();
      removeLast();
    }
  }

  void normalizeForCollection() {
    if (isDocument()) {
      remainder = last();
      removeLast();
    }
  }

  ///
  /// For Firestore to update nested fields on a document, you need to use a
  /// dot notation. This method returns the remainder if it exists plus a
  /// dotted path component
  /// @param component path to extend
  /// @return dotted components
  ///
  String dotPath(String component) {
    if (remainder == null) {
      return component;
    } else {
      return remainder! + "." + component;
    }
  }
}
