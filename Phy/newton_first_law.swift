//
//  Force.swift
//  Phy
//
//  Created by IOSTEAM on 5/11/25.
//

import SwiftUI

struct Force: View {
    @State private var fade = false
    @State private var isPlaying = true

    var body: some View {
        ZStack {
            Color.yellow.opacity(0.6)
                .edgesIgnoringSafeArea(.all)

            Image("newton")
                .resizable()
                .frame(width: 400, height: 400)
                .offset(x: 280)
                .padding()

            VStack(spacing: 20) {

                glowing_text(text: "Newton's First Law", screen: Int(Screen_Width))
                    .font(.largeTitle)
                    .fontWeight(.black)

                Typewriter_Animation(text: "Newton's first law of motion, also known as the law of inertia, states that an object at rest will remain at rest, and an object in motion will remain in motion with the same speed and in the same direction unless acted upon by an external force.")
                    .frame(width: 500, height: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black.opacity(0.7))
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding(.top, -250)

                Button {
                    if isPlaying {
                        SoundManager.shared.stopSound()
                    } else {
                        SoundManager.shared.playSound(audio: "First_law")
                    }
                    isPlaying.toggle()
                } label: {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .onAppear{
                            isPlaying = false
                        }
                }
                .padding(.top, -100)
            }
            .offset(x: -200 , y: -40)
        }
        .onAppear {
            SoundManager.shared.playSound(audio: "First_law")
            isPlaying = true // ✅ Ensure animation runs at launch
        }
    }
}

#Preview {
    Force()
}
