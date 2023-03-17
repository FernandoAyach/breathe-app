import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../../objectbox.g.dart';
import '../../support/utils/constants.dart';
import 'model/entity_session.dart';

class DatabaseProvider {

  static Store? _database;
  static Box? sessionTable;

  Future<Store> _createDatabase() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final database = await openStore(directory: join(docsDir.path, Constants.databaseName));
    return database;
  }

  Future<Store> getInstance() async {
    return _database ??= await _createDatabase();
  }

  Future<Box> getSessionTable() async {
    final databaseInstance = await getInstance();
    return databaseInstance.box<EntitySession>();
  }

}