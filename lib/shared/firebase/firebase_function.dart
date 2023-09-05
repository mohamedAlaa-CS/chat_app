import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/models/message_model.dart';

class FirebaseFunction {
  static CollectionReference<MessageModel> getCollection() {
    return FirebaseFirestore.instance
        .collection(MessageModel.collectionName)
        .withConverter<MessageModel>(
            fromFirestore: (snapshot, _) =>
                MessageModel.fromFirestore(snapshot.data()!),
            toFirestore: (messageModel, option) => messageModel.tofirestore());
  }

  static Future<void> addmessage(MessageModel messageModel) {
    var collection = getCollection();
    var doc = collection.doc();
    return doc.set(messageModel);
  }

  static Future<QuerySnapshot<MessageModel>> getMessage() {
    return getCollection().orderBy('createdAt').get();
  }
}
