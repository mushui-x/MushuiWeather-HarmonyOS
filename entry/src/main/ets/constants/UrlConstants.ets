export default class UrlConstants {
  /**
   * host for weather
   */
  static readonly SERVER_WEATHER = 'https://devapi.qweather.com'
  /**
   * host for geo
   */
  static readonly SERVER_GEO = 'https://geoapi.qweather.com'
  /**
   * 城市查询
   */
  static readonly CITY_LOOKUP = '/v2/city/lookup'
  /**
   * 实时天气
   */
  static readonly WEATHER_NOW = '/v7/weather/now'
  /**
   * 7天天气
   */
  static readonly WEATHER_7D = '/v7/weather/7d'
  /**
   * 15天天气
   */
  static readonly WEATHER_15D = '/v7/weather/15d'
  /**
   * 24小时天气
   */
  static readonly WEATHER_24H = '/v7/weather/24h'
  /**
   * 1天天气指数
   */
  static readonly WEATHER_INDICES = '/v7/indices/1d'
  /**
   * key
   */
  static readonly PRIVATE_KEY = '852391803c4944869c8ae79d0b748d6d'
}