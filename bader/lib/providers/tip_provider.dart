import 'package:bader/models/tip.dart';
import 'package:bader/services/tip_service.dart';
import 'package:flutter/material.dart';

class TipProvider extends ChangeNotifier {
  List<Tip> tips = [];

  Future<void> getTips() async {
    tips = await TipService().getTips();
    print("i'm in provider: $tips");
    notifyListeners();
  }

  Future<void> addTip({required Tip tip}) async {
    Tip newTip = await TipService().addTip(tip: tip);
    tips.add(newTip);
    notifyListeners();
  }
}
