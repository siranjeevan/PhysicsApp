import SwiftUI

struct Space: View {
    @State private var angle: Double = 0.0 // Rotation angle for orbit and spin

    var body: some View {
        ZStack {
            // 🔭 Background Image - Space scene
            Image("space")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                // ☀️ Sun at center
                Image("sun")
                    .resizable()
                    .rotationEffect(Angle(degrees: angle)) // Sun rotation effect
                    .frame(width: 110, height: 65)
                
                // 🌑 Mercury Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 150, height: 80)
                
                // 🌑 Mercury Button
                Button {
                    
                } label: {
                    VStack(spacing: 4) {
                        Text("Mercury") // Label
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down") // Down arrow
                            .foregroundColor(.white)
                        Image("Mercury") // Planet image
                            .resizable()
                            .frame(width: 20, height: 20)
                            .rotationEffect(.degrees(angle)) // Mercury spin
                    }
                }
                .offset(
                    x: CGFloat(73 * cos((angle + 240) * .pi / 180)),
                    y: CGFloat(40 * sin((angle + 240) * .pi / 180))
                )
                .offset(y: -20)
                .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                                angle += 1
                                if angle >= 360 {
                                    angle = 0
                                    }
                        }
                }
                // 🟤 Venus Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 230, height: 120)
                
                // 🟤 Venus Button
                Button {
                    
                } label: {
                    VStack(spacing: 4) {
                        Text("Venus")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down")
                            .foregroundColor(.white)
                        Image("venus")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .rotationEffect(.degrees(angle * 0.8)) // Slower spin
                    }
                }
                .offset(
                    x: CGFloat(110 * cos((angle + 80) * .pi / 180)),
                    y: CGFloat(60 * sin((angle + 80) * .pi / 180))
                )
                .offset(y: -19)
                
                // 🌍 Earth Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 330, height: 160)
                
                // 🌍 Earth Button
                Button {
                    
                } label: {
                    VStack(spacing: 4) {
                        Text("Earth")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down")
                            .foregroundColor(.white)
                        Image("earth")
                            .resizable()
                            .frame(width: 60, height: 35)
                            .rotationEffect(.degrees(angle)) // Earth spins
                    }
                }
                .offset(
                    x: CGFloat(160 * cos((angle + 180) * .pi / 180)),
                    y: CGFloat(80 * sin((angle + 180) * .pi / 180))
                )
                .offset(y: -19)
                
                // 🔴 Mars Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 450, height: 200)
                
                // 🔴 Mars Button
                Button {
                    
                } label: {
                    VStack(spacing: 4) {
                        Text("Mars")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down")
                            .foregroundColor(.white)
                        Image("mars")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .rotationEffect(.degrees(angle)) // Mars spins
                    }
                }
                .offset(
                    x: CGFloat(220 * cos(angle * .pi / 180)),
                    y: CGFloat(100 * sin(angle * .pi / 180))
                )
                .offset(y: -19)
                
                // 🟠 Jupiter Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 550, height: 250)
                
                // 🟠 Jupiter Button
                Button {
                    
                } label: {
                    VStack(spacing: 4) {
                        Text("Jupiter")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down")
                            .foregroundColor(.white)
                        Image("jupiter")
                            .resizable()
                            .frame(width: 50, height: 43)
                            .rotationEffect(.degrees(angle)) // Jupiter spins
                    }
                }
                .offset(
                    x: CGFloat(270 * cos((angle + 100) * .pi / 180)),
                    y: CGFloat(130 * sin((angle + 100) * .pi / 180))
                )
                .offset(y: -23)
                
                // 🪐 Saturn Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 650, height: 300)
                
                // 🪐 Saturn Button
                Button {
                    
                } label: {
                    VStack(spacing: 4) {
                        Text("Saturn")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down")
                            .foregroundColor(.white)
                        Image("Saturn")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(angle)) // Saturn spins
                    }
                }
                .offset(
                    x: CGFloat(320 * cos((angle + 170) * .pi / 180)),
                    y: CGFloat(150 * sin((angle + 170) * .pi / 180))
                )
                .offset(y: -23)
                
                // 🔵 Uranus Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 750, height: 350)
                
                // 🔵 Uranus Button
                Button {
                    
                } label: {
                    VStack(spacing: 4) {
                        Text("Uranus")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.down")
                            .foregroundColor(.white)
                        Image("Uranus")
                            .resizable()
                            .frame(width: 60, height: 43)
                            .rotationEffect(.degrees(angle)) // Uranus spins
                    }
                }
                .offset(
                    x: CGFloat(370 * cos((angle + 130) * .pi / 180)),
                    y: CGFloat(175 * sin((angle + 130) * .pi / 180))
                )
                .offset(y: -23)
                
                // 🔵 Neptune Orbit
                Ellipse()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: 860, height: 400)
                
                // 🔵 Neptune Button
                Button {
                    
                } label: {
                    VStack(spacing: 0) {
                        Text("Neptune")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image("Neptune")
                            .resizable()
                            .frame(width: 45, height: 43)
                            .rotationEffect(.degrees(angle)) // Neptune spins
                    }
                }
                .offset(
                    x: CGFloat(440 * cos((angle + 0) * .pi / 180)),
                    y: CGFloat(200 * sin((angle + 0) * .pi / 180))
                )
                .offset(y: -2)
            }
            .offset(y: 15) // Offset to center the whole solar system view
        }
    }
}

#Preview {
    Space()
}
