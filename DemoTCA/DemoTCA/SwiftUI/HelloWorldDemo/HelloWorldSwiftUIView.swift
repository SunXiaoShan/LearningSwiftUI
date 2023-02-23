import ComposableArchitecture
import SwiftUI

struct CellModule:Equatable,Identifiable {
    var id:Int
    var count:Int
    var name:String
}

struct HelloWorldState: Equatable {
    var cells: [CellModule] = []
    var isLoading: Bool = false
}

enum HelloWorldAction {
    case loadData
    case loadRecipesDone(TaskResult<[RecipeModel]>)
    case rowTap(selectId: Int)
}

struct HelloWorldEnvironment {}

extension HelloWorldEnvironment {
    static var live = Self()
}

func convertRecipe2CellModule(_ reciptList:[RecipeModel]) -> [CellModule] {
    var res: [CellModule] = []
    reciptList.forEach { recipt in
        let cell:CellModule = CellModule(id: recipt.id, count: recipt.count, name: recipt.name)
        res.append(cell)
    }
    return res
}

private enum CancelID {}
let helloWorldReducer = AnyReducer<
    HelloWorldState,
    HelloWorldAction,
    HelloWorldEnvironment
> { state, action, environment in
    switch action {
    case .loadData:
        state.isLoading = true
        NSLog("reducer -> loadData")
        return .task {
            await .loadRecipesDone(TaskResult { await LoadRecipeRequest.loadAllData() })
        }

    case .loadRecipesDone(result: let result):
        state.isLoading = false
        NSLog("reducer -> loadRecipesDone")
        do {
            let v = try result.value
            state.cells = convertRecipe2CellModule( v)
        } catch {
        }
        return .none

    case .rowTap(selectId: let selectId):
        NSLog("reducer -> rowTap:\(selectId)")
        return .none
    }
}

struct HelloWorldView: View {
    typealias ViewStoreType = ViewStore<HelloWorldState, HelloWorldAction>
    let store: Store<HelloWorldState, HelloWorldAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                if viewStore.isLoading {
                    Text("isLoading")
                } else {
                    Text("HelloWorld")
                }

                Button {
                    NSLog("send loadData event")
                    print("tttt")
                    viewStore.send(.loadData)
                } label: {
                    Text("Button")
                }
            }
        }
    }
}

#if DEBUG
struct HelloWorldView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HelloWorldView(store: .init(
                initialState: .init(),
                reducer: helloWorldReducer,
                environment: .live
            ))
        }
    }
}
#endif

