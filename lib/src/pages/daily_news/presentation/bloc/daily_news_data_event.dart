abstract class DailyNewsDataEvent {
  const DailyNewsDataEvent();
}

class GetTopHeadlines extends DailyNewsDataEvent {
  const GetTopHeadlines({required this.apiKey, required this.country});
  final String apiKey;
  final String country;
}
