import { BreakpointSystem, BreakPointType, StyleConstants } from '@ohos/common'
import router from '@ohos.router'
import { PageConstants } from '../constants/PageConstants'
import hilog from '@ohos.hilog'

@Entry
@Component
struct SplashPage {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'
  private breakpointSystem = new BreakpointSystem()
  private timeoutId: number = 0

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      alignContent: FlexAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Image($r('app.media.startIcon')).width(new BreakPointType({
        sm: $r('app.float.splash_image_size'),
        md: $r('app.float.splash_image_size'),
        lg: $r('app.float.splash_image_size_lg')
      }).getValue(this.currentBreakpoint))
        .aspectRatio(PageConstants.IMAGE_ASPECT_RATIO)
        .objectFit(ImageFit.Contain)
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.page_background'))
  }

  aboutToAppear() {
    this.breakpointSystem.register()
    this.timeoutId = setTimeout(() => {
      router.replaceUrl({ url: PageConstants.MAIN_PAGE_URL }).catch((err: Error) => {
        hilog.error(0x00, "SplashPage", JSON.stringify(err))
      })
    }, PageConstants.DELAY_TIME)
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister()
    clearTimeout(this.timeoutId)
  }
}