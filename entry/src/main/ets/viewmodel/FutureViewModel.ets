import HttpConstants from '@ohos/common/src/main/ets/utils/HttpConstants'
import { httpRequestGet } from '@ohos/common/src/main/ets/utils/HttpUtil'
import ResponseResult from '@ohos/common/src/main/ets/viewmodel/ResponseResult'
import UrlConstants from '../constants/UrlConstants'
import { WeatherNDData } from './WeatherData'

class FutureViewModel {
  /**
   * 获取15天天气
   * @param location
   * @returns
   */
  getWeather7D(location: string): Promise<WeatherNDData> {
    return new Promise(async (resolve: Function, reject: Function) => {
      let url = `${UrlConstants.SERVER}${UrlConstants.WEATHER_7D}`
      url += `?location=${location}&key=${UrlConstants.PRIVATE_KEY}`
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === HttpConstants.SERVER_CODE_SUCCESS) {
          resolve(data)
        } else {
          reject(data)
        }
      }).catch((err: Error) => {
        reject(JSON.stringify(err))
      })
    })
  }
}

let featureViewModel = new FutureViewModel()

export default featureViewModel as FutureViewModel