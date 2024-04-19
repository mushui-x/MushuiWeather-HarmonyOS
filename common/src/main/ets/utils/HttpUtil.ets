import http from '@ohos.net.http';
import ResponseResult from '../viewmodel/ResponseResult'
import HttpConstants, { ContentType } from './HttpConstants';
import Logger from './Logger'

export function httpRequestGet(url: string) {
  return httpRequest(url, http.RequestMethod.GET)
}

export function httpRequestPost(url: string) {
  return httpRequest(url, http.RequestMethod.POST)
}

function httpRequest(url: string, method: http.RequestMethod): Promise<ResponseResult> {
  let httpRequest = http.createHttp()
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: HttpConstants.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': ContentType.JSON
    },
    connectTimeout: HttpConstants.HTTP_CONNECT_TIMEOUT
  })
  Logger.info("----------httpRequest----------", `=====> method:${method} url:${url}`)
  let serverData = new ResponseResult()
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === HttpConstants.HTTP_CODE_200) {
      let result = `${value.result}`
      let resultJson: ResponseResult = JSON.parse(result)
      if (resultJson.code === HttpConstants.SERVER_CODE_SUCCESS) {
        serverData = resultJson
      }
      Logger.info("----------httpRequest success----------", `=====>data: ${JSON.stringify(serverData)}`)
    } else {
      serverData.msg = `${$r('app.string.http_error_message')}&${value.responseCode}}`
      Logger.error("----------httpRequest failed----------", `=====>data: ${JSON.stringify(serverData)}`)
    }
    return serverData
  }).catch(() => {
    serverData.msg = `$r('app.string.http_error_message')`
    Logger.error("----------httpRequest error----------", `=====>data: ${JSON.stringify(serverData)}`)
    return serverData
  })
}

