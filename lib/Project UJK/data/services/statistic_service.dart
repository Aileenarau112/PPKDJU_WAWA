import 'history_service.dart';

class StatisticService {
  Future<Map<String, dynamic>> getStatistic() async {
    final history = await HistoryService().getHistory();

    int hadir = 0;

    int izin = 0;

    for (var item in history) {
      if (item["status"] == "masuk") {
        hadir++;
      }

      if (item["status"] == "izin") {
        izin++;
      }
    }

    return {"total": history.length, "hadir": hadir, "izin": izin};
  }
}
