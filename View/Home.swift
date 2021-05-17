//
//  Home.swift
//  UI-192
//
//  Created by にゃんにゃん丸 on 2021/05/17.
//

import SwiftUI

struct Home: View {
    @State var current : Int = 1
    
    var body: some View {
        VStack{
            let small = UIScreen.main.bounds.height < 750
            
            TabView(selection:$current){
                
                
                
                ForEach(1...3,id:\.self){index in
                    
                  
                    
                    GeometryReader{proxy ->AnyView in
                        
                        let mix = proxy.frame(in:.global).minX
                        
                        let width = UIScreen.main.bounds.width
                        
                        let progress = -mix / (width * 2)
                        
                        var scale = progress > 0 ? 1 - progress : 1 + progress
                        
                        scale = scale < 0.7 ? 0.7 : scale
                        
                        return AnyView(
                        
                        
                            
                            VStack{
                                Image("pic\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.horizontal,20)
                                    .frame(maxHeight: .infinity)
                                
                                Text("Pet Adoption")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                
                                Text("Pet is life Partner")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.top,10)
                            }
                            .padding(.top,small ? 10 : 0)
                            .frame(maxHeight: .infinity)
                            .scaleEffect(scale)
                            
                        )
                        
                       
                    }
                
                    
                    
               .tag(index)
                    
                    
                }
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
            CustomIndicator(count: 3, current: $current)
               
                .padding(.vertical,small ? 10 : 15)
            
            
            VStack(spacing:15){
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        
                        
                        
                        Image(systemName: "applelogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(.white)
                        
                        
                        Text("Sign With Apple       ")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal)
                    .background(
                    
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                            .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white)
                            )
                    )
                    
                        
                        
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        
                        
                        
                        Image("google-symbol")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                           
                        
                        
                        Text("Sign With Google   ")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal)
                    .background(
                    
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                            .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red)
                            )
                    )
                    
                        
                        
                })
               
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack{
                        
                        
                        
                        Image("email")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                           
                        
                        
                        Text("Sigin  With  Email   ")
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal)
                    .background(
                    
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                            .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue,lineWidth: 3)
                            )
                    )
                    
                        
                        
                })
               
                
                
                HStack{
                    
                    Text("Already have an account?")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    
                    Text("Login")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .underline(true, color: Color.primary)
                    
                }
                .padding(.top,10)
                
                
            }
            
            .padding()
           
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("c1").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct CustomIndicator  : View{
    var count : Int
    @Binding var current : Int
    
    var body: some View{
        
        
        HStack{
            
            
            ForEach(0..<count,id:\.self){index in
                
                ZStack{
                    
                    
                    if (current - 1) == index{
                        
                        
                        Circle()
                            .fill(Color.primary)
                        
                        
                    }
                    
                    else{
                        
                        Capsule()
                            .fill(Color.white)
                            .overlay(
                            
                            Circle()
                                .stroke(Color.gray,lineWidth: 1)
                            
                            )
                        
                    }
                }
                .frame(width: 10, height: 10)
                
                
            }
        }
        
    }
}
