import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../objectbox.g.dart';
import '../support/utils/constants.dart';

class Database {

  static Store? _database;

  Future<Store> _createDatabase() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final database = await openStore(directory: join(docsDir.path, Constants.databaseName));
    return database;
  }

  Future<Store> getInstance() async {
    return _database ??= await _createDatabase();
  }
}