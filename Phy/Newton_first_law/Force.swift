//
//  Force.swift
//  Phy
//
//  Created by IOSTEAM   on 5/12/25.
//

import SwiftUI
import PhysicsAppPagkage


struct Force: View {
    @State var ManPositionX: CGFloat = -400
    @State var ballPositionX: CGFloat = 10
    @State var ballPositionY: CGFloat = 60
    @State var defferent : Bool = false
    @State var Run: Bool  = false
    @State var IsBallOnGround: Bool = false
    @State var Fastkick: Bool = false
    @State var ballRotation: Double = 0
    @State var explainFinish : Bool = false
    @State var nextPage : Bool = false
    @State var preview : Bool = false
    var body: some View {
        ZStack{
            Image("ground").resizable().edgesIgnoringSafeArea(.all)
//                .onAppear{
//                    soundManager.playSound(audio: "Force")
//                }
            GlowingText(text: "Force")
                .font(.system(size: 50))
                .fontWeight(.black)
                .offset(y : -60)
            
            Image("ball").resizable().frame(width: 50, height: 50)
                .rotationEffect(.degrees(ballRotation))
                .offset(x: ballPositionX, y: ballPositionY)
                .onAppear {
                    withAnimation(.easeInOut(duration: 3)){
                        ballPositionX = 10
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                        IsBallOnGround = true
                    }
                }
            if IsBallOnGround {
                if !Run {
                    MovingAnimation(name: "run", duration: !Fastkick ? 0.1 : 0.05 , totalFrames: 5)
                        .offset(x : ManPositionX)
                        .onAppear{
                            withAnimation(.easeIn(duration: !Fastkick ? 3 : 2)) {
                                ManPositionX = -30
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + (3.1)) {
                                Run = true
                            }
                        }
                }
                else
                {
                    Image("run2").resizable()
                        .scaledToFit()
                        .frame(width: 150 , height: 150)
                        .offset(x : -20)
                        .onAppear{
                            withAnimation(.linear(duration: !Fastkick ? 5 : 2)){
                                ballRotation += 1500
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + (!Fastkick ? 5 : 3)) {
                                withAnimation(.linear(duration: !Fastkick ? 5 : 3  )){
                                    if explainFinish {
                                        ballPositionX = 10
                                        withAnimation(.linear(duration: 2)){
                                            ballPositionY = -300
                                            ballPositionX = 300
                                            Fastkick = false
                                        }
                                    }
                                    else{
                                        ballPositionX = 600
                                        ballRotation += 700
                                    }
                                    
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() +  5){
                                    if Fastkick {
                                        if explainFinish {
                                            explainFinish = false
                                        }
                                        else
                                        {
                                            explainFinish = true
                                        }
                                        ballPositionX = 10
                                    }
                                    if !Fastkick
                                    {
                                        Fastkick = true
                                        ballPositionX = 10
                                    }
                                    Run = false
                                    ManPositionX = -400

                                }
                            }
                        }
                }
            }
            HStack {
                Button {
                    preview = true
                    soundManager.stopSound()
                } label: {
                    HStack {
                        Image(systemName: "arrowshape.left.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .foregroundColor(.white)
                        Text("Preview")
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(.white)
                        
                    }
                    .frame(width: 70, height: 30)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(30)
                }
                .offset(x : -330)
                
                Button {
                    soundManager.stopSound()
                    Run = false
                    IsBallOnGround = false
                    explainFinish = false
                    Fastkick = false
                    soundManager.playSound(audio: "Force")
                } label: {
                    HStack {
                        Text("Replay")
                            .font(.system(size: 10, weight: .black))
                            .foregroundColor(.white)
                        
                        Image(systemName: "arrow.trianglehead.clockwise.rotate.90")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(width: 70, height: 30)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(30)
                }

                
                Button {
                    nextPage = true
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
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(30)
                }
                .offset(x : 330)
                
                
            }
            .offset(y : 200)
                .fullScreenCover(isPresented: $preview) {
                    definition()
                }
            

        }
    }
}

#Preview {
    Force()
}
