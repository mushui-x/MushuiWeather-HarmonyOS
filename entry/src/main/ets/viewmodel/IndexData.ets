export class TabButtonModel {
  index: number = 0
  icon: Resource = $r('app.media.ic_home_normal')
  selectIcon: Resource = $r('app.media.ic_home_focus')
  label: Resource = $r('app.string.tab_home')
}

const tabButtons: TabButtonModel[] = [
  {
    index: 0,
    icon: $r('app.media.ic_home_normal'),
    selectIcon: $r('app.media.ic_home_focus'),
    label: $r('app.string.tab_home')
  },
  {
    index: 1,
    icon: $r('app.media.ic_feature_normal'),
    selectIcon: $r('app.media.ic_feature_focus'),
    label: $r("app.string.tab_future")
  },
  {
    index: 2,
    icon: $r('app.media.ic_setting_normal'),
    selectIcon: $r('app.media.ic_setting_focus'),
    label: $r('app.string.tab_setting')
  }
]

export { tabButtons }