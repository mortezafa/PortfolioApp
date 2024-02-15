// ContentView.swift

import SwiftUI

struct ContentView: View {
    @State var fadeInVar: Double = 0.0
    var body: some View {

            VStack(alignment: .center) {
                Text("Hey! My names Morteza. Welcome to my app!")
                    .font(.title2)
                    .fontDesign(.monospaced)
                    .padding()
                    .multilineTextAlignment(.leading)

                PulsingButtonView()
                    .padding()
            }
            .opacity(fadeInVar)
            .onAppear {
                withAnimation(.easeIn(duration: 0.8)) {fadeInVar = 1.0}
            }
    }
}

#Preview {
    ContentView()
}


import SwiftUI

struct PulsingButtonView: View {
    @State private var isAnimating = false

    var body: some View {
        Button(action: {
            // Define the action for your button here
            print("Button tapped")
        })
        {
            Text("Take a Look :D")
                .padding()
                .foregroundStyle(.white)
        }
        .buttonStyle(.bordered)
        .clipShape(Capsule(), style: FillStyle())
        .tint(.white)
        .scaleEffect(isAnimating ? 1.05 : 1.0)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 0.8).repeatForever(autoreverses: true)) {
                isAnimating.toggle()
            }
        }

    }
}
