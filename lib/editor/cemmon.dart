import 'package:demo/editor/shard_prefrance.dart';

class Cemmon {
    ShardPreferencesEditor shardPreferencesEditor = ShardPreferencesEditor();
   bool loginName =false;

  Future<bool> getLogin() async {
    loginName = await shardPreferencesEditor.getIsLogin();
    print(loginName);
    return loginName;
  }
}
