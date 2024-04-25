import { WeatherNowData, WeatherNHData, WeatherNDData, WeatherIndicesData } from './WeatherData'

@Observed
export default class RefreshViewModel {
  /**
   * 当前天气
   */
  public weatherNowData: WeatherNowData = null
  /**
   * 24小时天气
   */
  public weather24HData: WeatherNHData = null
  /**
   * 7天天气
   */
  public weather7DData: WeatherNDData = null
  /**
   * 天气指数
   */
  public weatherIndicesData: WeatherIndicesData = null
}