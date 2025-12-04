import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_zone/data/favourites/models/watchlist_model.dart';

abstract class WatchlistRemoteDataSource {
  Future<void> addwatchlist(WatchlistModel fav);
  Future<void> removewatchlist(String movieId);
  Future<bool> iswatchlist(String movieId);
  Future<List<WatchlistModel>> getAllwatchlist();
  Stream<List<WatchlistModel>> watchwatchlist();
}

class WatchlistRemoteDataSourceImpl extends WatchlistRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  WatchlistRemoteDataSourceImpl({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  }) : firestore = firestore ?? FirebaseFirestore.instance,
       auth = auth ?? FirebaseAuth.instance;

  String _userId() {
    final u = auth.currentUser;
    if (u == null) throw Exception('User not authenticated');
    return u.uid;
  }

  CollectionReference<Map<String, dynamic>> _favsCollection() {
    final uid = _userId();
    // ignore: unnecessary_cast
    return firestore.collection('users').doc(uid).collection('watchlist')
        as CollectionReference<Map<String, dynamic>>;
  }

  /// Add / update a watchlist
  @override
  Future<void> addwatchlist(WatchlistModel fav) async {
    final docRef = _favsCollection().doc(fav.movieId);
    await docRef.set(fav.toMap());
  }

  /// Remove a watchlist
  @override
  Future<void> removewatchlist(String movieId) async {
    final docRef = _favsCollection().doc(movieId);
    await docRef.delete();
  }

  /// Check if movie is watchlist
  @override
  Future<bool> iswatchlist(String movieId) async {
    final doc = await _favsCollection().doc(movieId).get();
    return doc.exists;
  }

  /// Get all watchlist for current user
  @override
  Future<List<WatchlistModel>> getAllwatchlist() async {
    final snapshot = await _favsCollection()
        .orderBy('addedAt', descending: true)
        .get();
    return snapshot.docs.map((d) => WatchlistModel.fromMap(d.data())).toList();
  }

  /// Stream of watchlist (useful for UI updates)
  @override
  Stream<List<WatchlistModel>> watchwatchlist() {
    return _favsCollection()
        .orderBy('addedAt', descending: true)
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((d) => WatchlistModel.fromMap(d.data())).toList(),
        );
  }
}
