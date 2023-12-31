//
//  registerTabs.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI






struct registerTabs: View {
    @State private var tabSelection = 1
    @State var test : String = ""
    var action: () -> Void
    var BackAction: () -> Void
    
    
    var body: some View {
       
        
        VStack  {
            
            
          
                HStack {
                    Image( "Group 25")
                        .resizable()
                        .frame(width: 40  , height : 40  )
                        .onTapGesture {
                            self.BackAction()
                        }
                    Spacer()
                }.padding(.leading)
                .padding(.trailing)
                .padding(.top)

            Text ("Signup")
                
                .font(.custom(AppFont.Bold.rawValue, size: 33))
               
                 .foregroundColor(Color("MainColor"))
                 .padding(8)
                
           
        
            Group {
                    Text("Please ")
                    .font(.custom(AppFont.Regular.rawValue, size: 18))
                +
                    Text("provide following details ")
                    .font(.custom(AppFont.Bold.rawValue, size: 18))
                +
                    Text("for your new account")
                    .font(.custom(AppFont.Regular.rawValue, size: 18))
                    
                       
                }
                
                .fixedSize(horizontal: false, vertical: true)
             
                .frame( maxWidth: .infinity ,  alignment: .center)
                .padding(8)
                .padding(.horizontal)
                TabView (selection: $tabSelection) {
                    
                    tap1()
                       
                        .tag(1)
                    tap2()
                       
                        .tag(2)
                    tab3()
                        
                        .tag(3)
                    tab4()
                      
                        .tag(4)
                    
                    
                } .tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.leading , 25 )
                .padding(.trailing , 25 )
               
            //    .frame(height: UIScreen.main.bounds.size.height * 0.5)
               
            
            HStack ( spacing: 10) {
                ForEach((1...4), id: \.self) { item in
                    Circle()
                        .frame(width: 15 , height: 15 , alignment: .center)
                        .foregroundColor( item == tabSelection ?  Color("MainColor") : Color.gray.opacity(0.4))
                }
                
            }
            .padding()
           

            
            Button {
               
                if tabSelection == 4 { // push the next swift screen :)
                    self.action()
                } else {
                    
                    
                    // go next
                   
                        
                   
                    if tabSelection == 1 {
                        withAnimation {
                            self.tabSelection = 2
                        }
                         
           
                      
                    } else if tabSelection == 2 {
                        withAnimation {
                            self.tabSelection = 3
                        }
                           
                       
                      
                    } else if  tabSelection == 3 {
                        withAnimation {
                            self.tabSelection = 4
                        }
                      
                    }
                    
                    
                    
                }
            } label: {
                Text( "Next")
                    .font(.custom(AppFont.Bold.rawValue, size: 20))
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("MainColor"))
                    .cornerRadius(27.5)
                    .padding(25)
                    .shadow(color: Color("MainColor").opacity(0.6), radius: 3 , x: 0 , y: 3)
            }
           
        }
        
        .frame( maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color("BackGroundColor"))
        //.ignoresSafeArea(.keyboard, edges: .bottom)
        
          //  force app to be left just for now
        .environment(\.layoutDirection,   .leftToRight  )
        .ignoresSafeArea(.keyboard, edges: .bottom)
           
        
    }
}

struct registerTabs_Previews: PreviewProvider {
    static var previews: some View {
        registerTabs {
            
        } BackAction: {
            
        }
    }
}

