import 'package:bounty/models/goal.dart';
import 'package:bounty/models/firebase_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class backend_services {
  // get user info
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(String id) {
    return FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: id)
        .snapshots();
  }

  // get prizes
  Stream<QuerySnapshot<Map<String, dynamic>>> getPrizes() {
    return FirebaseFirestore.instance.collection('prizes').snapshots();
  }

  // get all goals
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllGoals(String id) {
    return FirebaseFirestore.instance
        .collection('goals')
        .where('id', isEqualTo: id)
        .snapshots();
  }

  // get active goals
  Stream<QuerySnapshot<Map<String, dynamic>>> getActiveGoals(String id) {
    return FirebaseFirestore.instance
        .collection('goals')
        .where('id', isEqualTo: id)
        .where('is_active', isEqualTo: true)
        .snapshots();
  }

  // add goal
  Future addGoal(
      String id,
      double amount,
      DateTime start_date,
      DateTime end_date,
      double pay_month,
      bool is_active,
      String user_id) async {
    final new_goal = FirebaseFirestore.instance.collection('goals').doc();

    final g = goal(
        id: id,
        amount: amount,
        start_date: start_date,
        end_date: end_date,
        pay_month: pay_month,
        is_active: is_active,
        user_id: user_id);

    final json = g.toJson();

    await new_goal.set(json);
  }

  // get history
  Stream<QuerySnapshot<Map<String, dynamic>>> getHistory(String id) {
    return FirebaseFirestore.instance
        .collection('prizes')
        .where('id', isEqualTo: 'uK99XDwjppiavwwVOFho')
        .snapshots();
  }

  // deposit
  Future deposit(String id, String name, double wallet_amount, int points,
      double add_ammount) async {
    final new_goal = FirebaseFirestore.instance.collection('users').doc('2Ai3frjBnb0FF3Pr4yUm');

    final u = firebase_user(
        id: id,
        name: name,
        wallet_amount: (wallet_amount + add_ammount),
        points: points+15);

    final json = u.toJson();

    await new_goal.set(json);
  }

  // withdraw
  Future withdraw(String id, String name, double wallet_amount, int points,
      double remove_ammount) async {
    final new_goal = FirebaseFirestore.instance.collection('users').doc('2Ai3frjBnb0FF3Pr4yUm');

    var new_amount = wallet_amount;

    if(wallet_amount - remove_ammount > 0) {
      new_amount = wallet_amount - remove_ammount;
    }

    final u = firebase_user(
        id: id,
        name: name,
        wallet_amount: new_amount,
        points: points-50);

    final json = u.toJson();

    await new_goal.set(json);
  }

  Future redeem_points(String id, int points) async {
    FirebaseFirestore.instance
        .collection('2Ai3frjBnb0FF3Pr4yUm')
        .where('id', isEqualTo: 'uK99XDwjppiavwwVOFho')
        .snapshots();
  }
}
