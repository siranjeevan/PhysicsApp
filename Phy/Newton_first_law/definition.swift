//
//  First_law.swift
//  Phy
//
//  Created by IOSTEAM on 5/11/25.
//

import SwiftUI
import PhysicsAppPagkage

let soundManager  = SoundManager()

struct definition: View {
    @State private var fade = false
    @State private var isPlaying = true
    @State private var navigateToForce: Bool = false


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
                GlowingText(text: "Newton's First Law")
                    .font(.largeTitle)
                    .fontWeight(.black)
    
                SimpleTypewriter(text: "Newton's first law of motion, also known as the law of inertia, states that an object at rest will remain at rest, and an object in motion will remain in motion with the same speed and in the same direction unless acted upon by an external force.")
                    .frame(width: 500, height: 200, alignment: .center)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black.opacity(0.7))
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding(.top, -250)

                Button {
                    if isPlaying {
                        soundManager.stopSound()
                    } else {
                        soundManager.playSound(audio: "First_law")
                    }
                    isPlaying.toggle()
                } label: {
                    Image(systemName: isPlaying ? "pause.circle.fill" : "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .onAppear {
                            isPlaying = false
                        }
                }
                .padding(.top, -100)
            }
            .offset(x: -200, y: -40)

            // 👉 Custom Navigation Button (No NavigationLink)
            Button {
                soundManager.stopSound()
                navigateToForce = true
            } label: {
                HStack {
                    Text("Next")
                        .font(.system(size: 10, weight: .black))
                        .foregroundColor(.white)
                    Image(systemName: "arrowshape.right.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.white)
                }
                .frame(width: 70, height: 30)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(30)
            }
            .offset(y: 150)
            // 👉 Full screen sheet to show Force page
            .fullScreenCover(isPresented: $navigateToForce) {
                Force()
            }
        }
        .onAppear {
            soundManager.playSound(audio: "First_law")
            isPlaying = true
        }
    }
}

#Preview {
    definition()
}
