import HomeViewModel from '../viewmodel/HomeViewModel'

@Component
export struct Home {
  @State message: string = 'Home'

  aboutToAppear() {
    HomeViewModel.getWeatherNow('101010100')
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}