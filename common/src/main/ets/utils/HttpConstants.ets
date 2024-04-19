export default class HttpConstants {
  /**
   * 网络请求超时时间
   */
  static readonly HTTP_READ_TIMEOUT = 10000
  /**
   * 网络连接超时
   */
  static readonly HTTP_CONNECT_TIMEOUT = 10000
  /**
   * 网络请求成功状态
   */
  static readonly HTTP_CODE_200 = 200
  /**
   * 接口请求成功状态
   */
  static readonly SERVER_CODE_SUCCESS = '200'
}

/**
 * 请求类型
 */
export const enum ContentType {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}

/**
 * 请求方式
 */
export const enum RequestMethod {
  POST = 'POST',
  GET = 'GET'
}