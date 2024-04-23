import { WeatherNowData, Weather24HData } from './WeatherData'

@Observed
export default class RefreshViewModel {
  /**
   * 当前天气
   */
  public weatherNowData: WeatherNowData = null
  /**
   * 24小时天气
   */
  public weather24HData: Weather24HData = null
}