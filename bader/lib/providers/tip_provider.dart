import 'package:bader/models/tip.dart';
import 'package:bader/services/tip_service.dart';
import 'package:flutter/material.dart';

class TipProvider extends ChangeNotifier {
  List<Tip> tips = [];
  List<Tip> myTipsList = [];
  List<Tip> filteredTipsList = [];

  final _tipsService = TipService();

  Future<void> getTips() async {
    tips = await TipService().getTips();
    print("i'm in provider: $tips");
    notifyListeners();
  }

  Future<void> myTips(String username) async {
    final List<Tip> allTips = await _tipsService.getTips();

    myTipsList = allTips.where((tip) => tip.author == username).toList();
    notifyListeners();
  }

  Future<void> addTip({required Tip tip}) async {
    Tip newTip = await TipService().addTip(tip: tip);
    tips.add(newTip);
    notifyListeners();
  }

  void searchTips(String query) {
    if (query.isEmpty) {
      filteredTipsList = tips;
    } else {
      filteredTipsList = tips
          .where((tip) =>
              tip.text!.toLowerCase().contains(query.toLowerCase()) ||
              tip.author!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
