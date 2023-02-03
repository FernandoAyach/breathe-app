import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../objectbox.g.dart';

class Database {

  static Store? _store;

  Future<Store> _createStore() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, "breathe_database"));
    return store;
  }

  Future<Store> getStore() async {
    return _store ??= await _createStore();
  }
}