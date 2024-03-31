Future<dynamic> storage(Future<void> Function() computation) async {
  try {
    final data = await computation();
    return data;
  } catch (e) {
    throw Exception(e.toString());
  }
}
