import 'package:appwrite/appwrite.dart';
import 'package:devnexus/constants/appwrite_constants.dart';
import 'package:devnexus/core/core.dart';
import 'package:devnexus/core/providers.dart';
import 'package:devnexus/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final userAPIProvider = Provider((ref){
  final user = ref.watch(appWriteDatabaseProvider);
  return UserAPI(db : user);
});

abstract class IUserAPI {
  FutureEitherVoid saveUserData(UserModel userModel);
}

class UserAPI implements IUserAPI {
  final Databases _db;
  UserAPI({required Databases db}) : _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel userModel) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.userCollection,
        documentId: ID.unique(),
        data: userModel.toMap(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(e.message??'Some unexpected error Occured', st,)
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st),);
    }
  }
}
