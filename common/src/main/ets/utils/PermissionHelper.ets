import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import bundleManager from '@ohos.bundle.bundleManager';
import Logger from './Logger'

export async function checkAccessToken(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
  let atManager = abilityAccessCtrl.createAtManager()
  let grantStatus: abilityAccessCtrl.GrantStatus

  //获取应用程序的accessTokenID
  let tokenId: number
  try {
    let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION)
    let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo
    tokenId = appInfo.accessTokenId
  } catch (err) {
    Logger.error(`getBundleInfoForSelf failed, code is ${err.code}, message is ${err.message}`)
  }

  //校验是否已授权
  try {
    grantStatus = await atManager.checkAccessToken(tokenId, permission)
  } catch (err) {
    Logger.error(`checkAccessToken failed, code is ${err.code}, message is ${err.message}`)
  }
  return grantStatus
}

export function requestPermissionsFromUser(context: Context, permission: Array<Permissions>, success: Function, failure: Function) {

  let atManager = abilityAccessCtrl.createAtManager()
  atManager.requestPermissionsFromUser(context, permission).then((data) => {
    let grantStatus: Array<number> = data.authResults
    let length: number = grantStatus.length
    for (let i = 0; i < length; i++) {
      if (grantStatus[i] === 0) {
        //已授权
        success()
      } else {
        //未授权
        failure()
        return
      }
    }
  }).catch((err) => {
    failure()
    Logger.error(`requestPermissionsFromUser failed, code is ${err.code}, message is ${err.message}`);
  })
}
