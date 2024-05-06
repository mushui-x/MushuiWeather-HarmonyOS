export class TabButtonModel {
  index: number = 0
  icon: Resource = $r('app.media.ic_home_unselect')
  selectIcon: Resource = $r('app.media.ic_home_select')
  label: Resource = $r('app.string.tab_home')
}

const tabButtons: TabButtonModel[] = [
  {
    index: 0,
    icon: $r('app.media.ic_home_unselect'),
    selectIcon: $r('app.media.ic_home_select'),
    label: $r('app.string.tab_home')
  },
  {
    index: 1,
    icon: $r('app.media.ic_feature_unselect'),
    selectIcon: $r('app.media.ic_feature_select'),
    label: $r("app.string.tab_future")
  },
  {
    index: 2,
    icon: $r('app.media.ic_setting_unselect'),
    selectIcon: $r('app.media.ic_setting_select'),
    label: $r('app.string.tab_setting')
  }
]

export { tabButtons }