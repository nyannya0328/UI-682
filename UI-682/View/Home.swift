//
//  Home.swift
//  UI-682
//
//  Created by nyannyan0328 on 2022/09/27.
//

import SwiftUI

struct Home: View {
    @StateObject var model : MotionManeger = .init()
    var body: some View {
        VStack{
            
            HStack{
                
                Button {
                    
                } label: {
                    
                  Image(systemName: "line.horizontal.3")
                        .font(.title)
                        
                }
                
                Spacer()
                
                
                Button {
                    
                } label: {
                    
                  Image(systemName: "person")
                        .font(.title)
                        
                }
            }
            .foregroundColor(.white)
            
            
            Text("Exclusive tips just for you")
                .font(.custom("GabrielaStencilW00-Lightit", size: 25))
                .foregroundColor(.white)
                .font(.title.bold())
                .padding(.top,13)
            
            
            ParallaxCard()
            
            
            TabBar()
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
         
            Color("BG").ignoresSafeArea()
        }
    }
    @ViewBuilder
    func TabBar ()->some View{
     
        HStack{
            
            ForEach(["house.fill","suit.heart","magnifyingglass"] ,id:\.self){name in
                
                Image(systemName: name)
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.5))
                    .frame(maxWidth: .infinity,alignment: .center)
            }
            
            
        }
        .padding(.top,20)
        
    }
    @ViewBuilder
    func ParallaxCard ()->some View{
        
        TabView(selection: $model.currentSlider) {
            
            ForEach(sample_places){place in
                
                GeometryReader{proxy in
                    
                    let size = proxy.size
                 
                    ZStack{
                        Image(place.bgName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width,height: size.height)
                            .clipped()
                        
                        Image(place.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width,height: size.height)
                            .clipped()
                        
                        VStack(alignment:.center,spacing: 10){
                            
                            
                            Text("Featurs")
                                .font(.custom("Gabriela stencil", size: 20))
                            
                            Text(place.placeName)
                                .font(.custom("Gabriela stencil", size: 50))
                            
                            
                            Button {
                                
                            } label: {
                            
                                Text("EXPLORE")
                                    .font(.callout)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background{
                                     
                                        Rectangle()
                                            .fill(.red.opacity(0.5).gradient)
                                    }
                                
                            }
                            
                            
                          
                            
                            
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
                        .padding(.top,15)
                        
                    }
                }
                .tag(place)
            }
        
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
     
    
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
