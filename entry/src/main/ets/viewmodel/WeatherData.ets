import ResponseResult from '@ohos/common/src/main/ets/viewmodel/ResponseResult'

/**
 * 实时天气
 */
export class WeatherNowData extends ResponseResult {
  now: Weather
}

/**
 * n小时天气
 */
export class WeatherNHData extends ResponseResult {
  hourly: Weather[] = []
}

/**
 * n天天气
 */
export class WeatherNDData extends ResponseResult {
  daily: Weather[] = []
}

export class Weather {
  /**
   * 数据观测时间
   */
  obsTime: string = ''
  /**
   * 预报时间
   */
  fxTime: string = ''
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
  /**
   * 日出时间，在高纬度地区可能为空
   */
  sunrise: string = ''
  /**
   * 日落时间，在高纬度地区可能为空
   */
  sunset: string = ''
  /**
   * 当天月升时间，可能为空
   */
  moonrise: string = ''
  /**
   * 当天月落时间，可能为空
   */
  moonset: string = ''
  /**
   * 月相名称
   */
  moonPhase: string = ''
  /**
   * 月相图标代码
   */
  moonPhaseIcon: string = ''
  /**
   * 预报当天最高温度
   */
  tempMax: string = ''
  /**
   * 预报当天最低温度
   */
  tempMin: string = ''
  /**
   * 预报白天天气状况的图标代码
   */
  iconDay: string = ''
  /**
   * 预报白天天气状况文字描述，包括阴晴雨雪等天气状态的描述
   */
  textDay: string = ''
  /**
   * 预报夜间天气状况的图标代码
   */
  iconNight: string = ''
  /**
   * 预报夜间天气状况文字描述，包括阴晴雨雪等天气状态的描述
   */
  textNight: string = ''
  /**
   * 预报白天风向360角度
   */
  wind360Day: string = ''
  /**
   * 预报白天风向
   */
  windDirDay: string = ''
  /**
   * 预报白天风力等级
   */
  windScaleDay: string = ''
  /**
   * 预报白天风速，公里/小时
   */
  windSpeedDay: string = ''
  /**
   * 预报夜间风向360角度
   */
  wind360Night: string = ''
  /**
   * 预报夜间风向
   */
  windDirNight: string = ''
  /**
   * 预报夜间风力等级
   */
  windScaleNight: string = ''
  /**
   * 预报夜间风速，公里/小时
   */
  windSpeedNight: string = ''
  /**
   * 紫外线强度指数
   */
  uvIndex: string = ''
}

/**
 * 天气指数
 */
export class WeatherIndicesData extends ResponseResult {
  daily: Indices[] = []
}

/**
 "date": "2021-12-16",
 "type": "1",
 "name": "运动指数",
 "level": "3",
 "category": "较不宜",
 "text": "天气较好，但考虑天气寒冷，风力较强，推荐您进行室内运动，若户外运动请注意保暖并做好准备活动。"
 */
export class Indices {
  /**
   * 预报日期
   */
  data: string = ''
  /**
   * 生活指数类型ID
   */
  type: string = ''
  /**
   * 生活指数类型的名称
   */
  name: string = ''
  /**
   *  生活指数预报等级
   */
  level: string = ''
  /**
   * 生活指数预报级别名称
   */
  category: string = ''
  /**
   * 生活指数预报的详细描述，可能为空
   */
  text: string = ''
}