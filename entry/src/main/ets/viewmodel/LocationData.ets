import ResponseResult from '@ohos/common/src/main/ets/viewmodel/ResponseResult'

/**
 * 城市搜索列表
 */
export class LocationListData extends ResponseResult {
  location: Location[] = []
}

/**
 "name":"北京",
 "id":"101010100",
 "lat":"39.90499",
 "lon":"116.40529",
 "adm2":"北京",
 "adm1":"北京市",
 "country":"中国",
 "tz":"Asia/Shanghai",
 "utcOffset":"+08:00",
 "isDst":"0",
 "type":"city",
 "rank":"10",
 "fxLink":"https://www.qweather.com/weather/beijing-101010100.html"
 */
export class Location {
  /**
   * 地区/城市名称
   */
  name: string = ''
  /**
   * 地区/城市ID
   */
  id: string = ''
  /**
   * 地区/城市纬度
   */
  lat: string = ''
  /**
   * 地区/城市经度
   */
  lon: string = ''
  /**
   * 地区/城市的上级行政区划名称
   */
  adm2: string = ''
  /**
   * 地区/城市所属一级行政区域
   */
  adm1: string = ''
  /**
   * 地区/城市所属国家名称
   */
  country: string = ''
  /**
   * 地区/城市所在时区
   */
  tz: string = ''
  /**
   * 地区/城市目前与UTC时间偏移的小时数
   */
  utcOffset: string = ''
  /**
   * 地区/城市是否当前处于夏令时。1 表示当前处于夏令时，0 表示当前不是夏令时。
   */
  isDst: string = ''
  /**
   * 地区/城市的属性
   */
  type: string = ''
  /**
   * 地区评分
   */
  rank: string = ''
}