//
//  ColorAnimationButtonSwiftUIView.swift
//  DemoSwiftUI
//
//  Created by huangphineas on 2023/2/10.
//

import SwiftUI

struct ColorAnimationButtonSwiftUIView: View {
    @State var selected: Bool = false
    var body: some View {
        Button(action: {
            self.selected.toggle()
        })
        {
            RoundedRectangle(cornerRadius: 10)
                .fill(selected ? Color.red : .green)
            .frame(width: selected ? 100 : 50, height: selected ? 100 : 50) }.animation(.default)
    }
}

struct ColorAnimationButtonSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ColorAnimationButtonSwiftUIView()
    }
}
