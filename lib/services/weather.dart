class WeatherModel{
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      
      return 'وقت بستنی خوردنه!';
    } else if (temp > 20) {
      return 'تشرت بپوش گرمت نشه!';
    } else if (temp < 10) {
      return 'شاید به شالگردن و دستکش احتیاج پیدا کنی';
    } else {
      return 'یه کت ببر بیرون شاید لازمت شد!';
    }
  }
}