import ResponseResult from '@ohos/common/src/main/ets/viewmodel/ResponseResult'

/**
 * 实时天气
 */
export class WeatherNowData extends ResponseResult {
  now: Now
}

export class Now {
  /**
   * 数据观测时间
   */
  obsTime: string = ''
  /**
   * 温度，默认单位：摄氏度
   */
  temp: string = ''
  /**
   * 体感温度，默认单位：摄氏度
   */
  feelsLike: string = ''
  /**
   * 天气状况的图标代码，另请参考天气图标项目 https://icons.qweather.com/
   */
  icon: string = ''
  /**
   * 天气状况的文字描述，包括阴晴雨雪等天气状态的描述
   */
  text: string = ''
  /**
   * 风向360角度
   */
  wind360: string = ''
  /**
   * 风向
   */
  windDir: string = ''
  /**
   * 风力等级
   */
  windScale: string = ''
  /**
   * 风速，公里/小时
   */
  windSpeed: string = ''
  /**
   * 相对湿度，百分比数值
   */
  humidity: string = ''
  /**
   * 当前小时累计降水量，默认单位：毫米
   */
  precip: string = ''
  /**
   * 大气压强，默认单位：百帕
   */
  pressure: string = ''
  /**
   * 能见度，默认单位：公里
   */
  vis: string = ''
  /**
   * 云量，百分比数值。可能为空
   */
  cloud: string = ''
  /**
   * 露点温度。可能为空
   */
  dew: string = ''
}