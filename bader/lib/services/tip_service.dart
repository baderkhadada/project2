import 'package:bader/models/tip.dart';
import 'package:bader/services/client.dart';

class TipService {
  // GET TIPS FUNCTION
  Future<List<Tip>> getTips() async {
    List<Tip> tips = [];
    try {
      var res = await ApiClient.dio.get("/tips");
      // print(res);
      tips = (res.data as List).map((tip) => Tip.fromJson(tip)).toList();
    } catch (e) {
      print(e);
    }
    return tips;
  }

  // adding new tips

  Future<Tip> addTip({required Tip tip}) async {
    late Tip newTip;
    try {
      var res = await ApiClient.dio.post('/tips', data: tip.toJson());
      newTip = Tip.fromJson(res.data);
    } catch (e) {
      print(e);
    }
    return newTip;
  }
}
