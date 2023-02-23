import ComposableArchitecture
import SwiftUI

struct <#Name#>State: Equatable {}

enum <#Name#>Action: Equatable {}

struct <#Name#>Environment {}

extension <#Name#>Environment {
  static var live = Self()
}

let <#Name#>Reducer = Reducer<
  <#Name#>State,
  <#Name#>Action,
  <#Name#>Environment
> { state, action, environment in
  .none
}

struct <#Name#>View: View {
  typealias ViewStoreType = ViewStore<<#Name#>State, <#Name#>Action>
  let store: Store<<#Name#>State, <#Name#>Action>

  var body: some View {
    WithViewStore(store) { viewStore in
    }
  }
}

#if DEBUG
  struct <#Name#>View_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        <#Name#>View(store: .init(
          initialState: .init(),
          reducer: <#Name#>Reducer,
          environment: .live
        ))
      }
    }
  }
#endif