import SwiftUI
import PlaygroundSupport

struct CurtainView: View {
    
    @State private var isStraightened = false
    @State private var timer: Timer?

    var body: some View {
        HStack {
            curtain
            curtain
                .scaleEffect(
                    x: -1,
                    y: 1,
                    anchor: .center
                )
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    var curtain: some View {
        MeshGradient(
            width: 3,
            height: 3,
            points: isStraightened ? straightenedPoints : originalPoints,
            colors: [
                .teal, .purple, .indigo,
                .purple, .blue, .pink,
                .purple, .red, .purple
            ]
        )
        .frame(width: 300, height: 500)
    }
    
    var originalPoints: [SIMD2<Float>] {
        [
            [0.0, 0.0], [0.25, 0.0], [0.5, 0.0],
            [0.25, 1.0], [0.35, 0.5], [0.5, 0.7],
            [0.0, 1.0], [0.0, 0.5], [0.0, 0.5]
        ]
    }

    var straightenedPoints: [SIMD2<Float>] {
        [
            [0.0, 0.0], [0.25, 0.0], [1, 0.0],
            [0.0, 0.5], [0.25, 0.5], [1, 0.5],
            [0.0, 1.0], [0.25, 1.0], [1, 1.0]
        ]
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                isStraightened.toggle()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

PlaygroundPage.current.setLiveView(CurtainView())
