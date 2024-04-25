import UrlConstants from '../constants/UrlConstants'
import { WeatherNowData, WeatherNHData, WeatherIndicesData } from './WeatherData'
import { httpRequestGet } from '@ohos/common'
import ResponseResult from '@ohos/common/src/main/ets/viewmodel/ResponseResult'
import HttpConstants from '@ohos/common/src/main/ets/utils/HttpConstants'

class HomeViewModel {
  /**
   * 获取当前天气
   * @param location 需要查询地区的LocationID或以英文逗号分隔的经度,纬度坐标（十进制，最多支持小数点后两位）
   */
  getWeatherNow(location: string): Promise<WeatherNowData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${UrlConstants.SERVER}${UrlConstants.WEATHER_NOW}`
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
      let url = `${UrlConstants.SERVER}${UrlConstants.WEATHER_24H}`
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
      let url = `${UrlConstants.SERVER}${UrlConstants.WEATHER_INDICES}`
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