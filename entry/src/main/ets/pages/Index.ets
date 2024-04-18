import { BreakpointSystem, BreakpointConstants, StyleConstants } from '@ohos/common'
import { TabButtonModel, tabButtons } from '../viewmodel/IndexData'
import { PageConstants } from '../constants/PageConstants'
import { Home } from '../components/Home'
import { Future } from '../components/Future'
import { Setting } from '../components/Setting'

@Entry
@Component
struct Index {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = 'sm'
  @StorageLink('IndexPage') currentPageIndex: number = 0
  private breakpointSystem = new BreakpointSystem()

  aboutToAppear() {
    this.breakpointSystem.register()
  }

  aboutToDisappear() {
    this.breakpointSystem.unregister()
  }

  build() {
    Column() {
      Tabs({
        barPosition: this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? BarPosition.Start : BarPosition.End,
        index: this.currentPageIndex
      }) {
        TabContent() {
          Home()
        }.tabBar(this.BottomNavigation(tabButtons[PageConstants.TAB_HOME_INDEX]))

        TabContent() {
          Future()
        }.tabBar(this.BottomNavigation(tabButtons[PageConstants.TAB_FUTURE_INDEX]))

        TabContent() {
          Setting()
        }.tabBar(this.BottomNavigation(tabButtons[PageConstants.TAB_SETTING_INDEX]))
      }
      .barWidth(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? $r('app.float.bar_width') : StyleConstants.FULL_HEIGHT)
      .barHeight(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG ? StyleConstants.SIXTY_HEIGHT : $r('app.float.vp_fifty_six'))
      .vertical(this.currentBreakpoint === BreakpointConstants.BREAKPOINT_LG)
      .scrollable(false)
      .onChange((index: number) => {
        this.currentPageIndex = index
      })
    }.backgroundColor($r('app.color.page_background'))
  }

  @Builder
  BottomNavigation(button: TabButtonModel) {
    Column({ space: PageConstants.BUTTON_SPACE }) {
      Image(this.currentPageIndex === button.index ? button.selectIcon : button.icon)
        .objectFit(ImageFit.Contain)
        .width($r('app.float.main_image_size'))
        .height($r('app.float.main_image_size'))
      Text(button.label)
        .fontColor(this.currentPageIndex === button.index ? $r('app.color.focus_color') : Color.Black)
        .opacity(this.currentPageIndex === button.index ? StyleConstants.FULL_OPACITY : StyleConstants.SIXTY_OPACITY)
        .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
        .textAlign(TextAlign.Center)
        .fontSize($r('app.float.micro_font_size'))
    }.width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}