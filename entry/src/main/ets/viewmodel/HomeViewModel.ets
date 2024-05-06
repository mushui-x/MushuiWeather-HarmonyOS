import UrlConstants from '../constants/UrlConstants'
import { WeatherNowData, WeatherNHData, WeatherIndicesData } from './WeatherData'
import { httpRequestGet } from '@ohos/common'
import ResponseResult from '@ohos/common/src/main/ets/viewmodel/ResponseResult'
import HttpConstants from '@ohos/common/src/main/ets/utils/HttpConstants'
import { LocationListData } from './LocationData'

class HomeViewModel {
  /**
   * 城市查询
   * @param location (必选)需要查询地区的名称，支持文字、以英文逗号分隔的经度,纬度坐标（十进制，最多支持小数点后两位）、
   * LocationID或Adcode（仅限中国城市）。例如 location=北京 或 location=116.41,39.92
   * @returns
   */
  lookupCity(location: string): Promise<LocationListData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${UrlConstants.SERVER_GEO}${UrlConstants.CITY_LOOKUP}`
      url += `?location=${location}&key=${UrlConstants.PRIVATE_KEY}`
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === HttpConstants.SERVER_CODE_SUCCESS) {
          resolve(data)
        } else {
          reject(data.msg)
        }
      }).catch((err: Error) => {
        reject(JSON.stringify(err))
      })
    })
  }

  /**
   * 获取当前天气
   * @param location 需要查询地区的LocationID或以英文逗号分隔的经度,纬度坐标（十进制，最多支持小数点后两位）
   */
  getWeatherNow(location: string): Promise<WeatherNowData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${UrlConstants.SERVER_WEATHER}${UrlConstants.WEATHER_NOW}`
      url += `?location=${location}&key=${UrlConstants.PRIVATE_KEY}`
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === HttpConstants.SERVER_CODE_SUCCESS) {
          resolve(data)
        } else {
          reject(data.msg)
        }
      }).catch((err: Error) => {
        reject(JSON.stringify(err))
      })
    })
  }

  /**
   * 获取24小时天气
   * @param location 需要查询地区的LocationID或以英文逗号分隔的经度,纬度坐标（十进制，最多支持小数点后两位）
   * @returns
   */
  getWeather24H(location: string): Promise<WeatherNHData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${UrlConstants.SERVER_WEATHER}${UrlConstants.WEATHER_24H}`
      url += `?location=${location}&key=${UrlConstants.PRIVATE_KEY}`
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === HttpConstants.SERVER_CODE_SUCCESS) {
          resolve(data)
        } else {
          reject(data.msg)
        }
      }).catch((err: Error) => {
        reject(JSON.stringify(err))
      })
    })
  }

  /**
   * 获取1天天气指数
   * @param location 需要查询地区的LocationID或以英文逗号分隔的经度,纬度坐标（十进制，最多支持小数点后两位）
   * @returns
   */
  getWeatherIndices(location: string): Promise<WeatherIndicesData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${UrlConstants.SERVER_WEATHER}${UrlConstants.WEATHER_INDICES}`
      url += `?type=0&location=${location}&key=${UrlConstants.PRIVATE_KEY}`
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === HttpConstants.SERVER_CODE_SUCCESS) {
          resolve(data)
        } else {
          reject(data.msg)
        }
      }).catch((err: Error) => {
        reject(JSON.stringify(err))
      })
    })
  }
}

let homeViewModel = new HomeViewModel()

export default homeViewModel as HomeViewModel