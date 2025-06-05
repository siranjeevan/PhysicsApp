//
//  Animation.swift
//  Phy
//
//  Created by IOS on 5/15/25.
//

import SwiftUI
import PhysicsAppPagkage

struct Animation: View {
    @State var BallAngle : Double = 0
    @State var ManPositionX: CGFloat = -300
    @State var BallPositionX: CGFloat = 0
    @State var ManShow : Bool = false
    @State var ShowDefination : Bool = false
    @State var defination : [String] = ["1 . An object at rest stays at rest unless an external force acts on it." , " 2 . An object in motion continues moving with the same speed and in the same direction." , "3.Any change in motion happens only when an external force is applied (this is called inertia)." ]
    @State var DefinationPoint : Int = 0
    var body: some View {
        ZStack{
            //Newton’s First Law of Motion
           // Newton's first law of motion, also known as the law of inertia, states that an object at rest will remain at rest, and an object in motion will remain in motion with the same speed and in the same direction unless acted upon by an external force."
            
            Image("EarthLand").resizable().scaleEffect(x: -1, y: 1)
                .edgesIgnoringSafeArea(.all)
            if ShowDefination
            {
            Image("ball").resizable().frame(width: 50, height: 50)
                    .rotationEffect(.degrees(BallAngle))
                .offset(x: BallPositionX , y: 70)
                .onAppear {
                        withAnimation(.linear(duration: 2)) {
                            self.BallPositionX = 0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                            self.ManShow = true
                        }
                    }
                    
                }
            
            if !ShowDefination
            {
                VStack {
                    
                    Text("Newton's First Law of Motion")
                        .foregroundColor(.yellow)
                        .underline(true, color: .yellow)
                    
                    SimpleTypewriter(text: "Newton's first law of motion, also known as the law of inertia, states that an object at rest will remain at rest, and an object in motion will remain in motion with the same speed and in the same direction unless acted upon by an external force." )
                        .font(.footnote)
                        .padding()
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 2 , repeats: false){ _ in
                                self.ShowDefination = true
                                DefinationPoint = 1
                                
                            }
//                            soundManager.playSound(audio: "First_law")
                            
                        }
                }
                        .fontWeight(.black)
                        .frame(width: 400)
                        .padding()
                        .multilineTextAlignment(.center)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .offset(y : 30)
                
            }
            
            
            if DefinationPoint == 1
            {
                Defination(Defination: defination[0])
                    .onAppear{
//                        soundManager.playSound(audio: "FirstPoint")
                    }
            }
            else if DefinationPoint == 2
            {
                Defination(Defination: defination[1])
                    .onAppear{
//                        soundManager.playSound(audio: "SecondPoint")
                    }
            }
            else if DefinationPoint == 3
            {
                Defination(Defination: defination[2])
                    .onAppear{
//                        soundManager.playSound(audio: "Third")
                    }
                VStack {
                    
                    Text("External Force")
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(.bottom , -20)
                    Image("run2")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(x: -1, y: 1)
                        .frame(width: 150, height: 150)
                }
                .offset(x: 130)
               
            }
            
            if ManShow
            {
                MovingAnimation(name: "run", duration: 0.1, totalFrames: 5)
                    .offset(x: ManPositionX, y: 0)
                    .onAppear{
                        if DefinationPoint == 1
                        {
                            DefinationPoint = 2
                            Timer.scheduledTimer(withTimeInterval: 10 , repeats: false){_ in
                                ManPositionX = -300
                                ManShow = true
                            }
                        }
                        
                        else if DefinationPoint == 2
                        {
                            DefinationPoint = 3
                            Timer.scheduledTimer(withTimeInterval: 10 , repeats: false){_ in
                                ManPositionX = -300
                                ManShow = true
                            }
                        }
                        else if DefinationPoint == 3
                        {
                            DefinationPoint = 2
                        }
                        BallPositionX = -150
                        
                        withAnimation(.linear(duration: 1)) {
                            ManPositionX = -200
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.linear(duration: 3)) {
                                if DefinationPoint == 3
                                {
                                    BallPositionX = 100
                                    
                                }
                                else
                                {
                                    BallPositionX = 300
                                }
                                withAnimation(.linear(duration: 3))
                                {
                                    BallAngle = 1500
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                                
                            }
                            ManShow = false
                        }
                    }
            }
            
        }
    }
}

struct Defination : View {
    var Defination : String
    var body: some View {
        VStack {
            Text("Newton's First Law of Motion")
                .font(.system(size: 13))
                .foregroundColor(.yellow)
                .underline(true, color: .yellow)
                .fontWeight(.black)
                .padding(.bottom , 5)
            
            SimpleTypewriter(text: Defination)
                .font(.system(size: 10))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: 300)
        .multilineTextAlignment(.center)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .offset(x : 240 , y: -130)
    }
}

#Preview {
    Animation()
}
