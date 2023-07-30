import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kanji_app/data/mapper/user_mapper.dart';
import 'package:kanji_app/data/source/remote/firebase/collection_name.dart';
import '../../../../domain/model/user/user_model.dart';
import '../../../../firebase_options.dart';
import '../user_remote_data_source.dart';

@Singleton(as: UserRemoteDataSource)
class FirebaseRemoteDataSource implements UserRemoteDataSource {
  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final signIn = await googleSignIn.signIn();
      final googleAuth = await signIn?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;

      if (user == null) {
        throw FirebaseAuthException(
          message: 'user not found',
          code: '_',
        );
      }
      return UserMapper.firebaseAuthToModel(user);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<bool> logoutGoogleAuth() async {
    try {
      final googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  @override
  Future<bool> isLoggedGoogleAuth() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;
    return true;
  }

  @override
  Future<UserModel?> getAccount() {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  CollectionReference get userCollection =>
      FirebaseFirestore.instance.collection(CollectionName.users);

  @override
  Future<bool> insertAccount(UserModel user) async {
    try {
      final docRef = userCollection.where('id', isEqualTo: user.id);
      final snapshot = await docRef.get();
      final mUser = snapshot.docs.firstOrNull;

      if (mUser == null) {
        await userCollection.add(user.toJson());
        return true;
      }

      final previousUser = UserMapper.mapToModel(
        mUser.data() as Map<String, dynamic>,
      );

      if (previousUser.name == user.name) return false;

      for (var e in snapshot.docs) {
        await e.reference.delete();
      }

      await userCollection.add(user.copyWith(
        createdAt: previousUser.createdAt,
      ));
      return true;
    } on FirebaseException {
      rethrow;
    }
  }

  @override
  Future<bool> removeAccount(String userId) {
    // TODO: implement removeAccount
    throw UnimplementedError();
  }
}
