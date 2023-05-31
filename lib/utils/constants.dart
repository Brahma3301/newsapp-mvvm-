

class Constants{
  static String TOP_HEADLINES_URL="https://newsapi.org/v2/top-headlines?country=us&apiKey=18ff5ed87f66457d839e0af4317edbf5";
  static String headlinesfor(String keyword){
return "https://newsapi.org/v2/everything?q=$keyword&apiKey=18ff5ed87f66457d839e0af4317edbf5";
  }
}