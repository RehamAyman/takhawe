//
//  registerTabs.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import SwiftUI

struct registerTabs: View {
    @State private var tabSelection = 1
    var action: () -> Void
    var BackAction: () -> Void
    
    
    var body: some View {
        
        VStack (  alignment: .center, spacing: 12 ) {
            
            
            Button {
                // go back
                self.BackAction()
            } label: {
                HStack {
                    Image( "Group 25")
                        .resizable()
                        .frame(width: 30  , height : 30  )
                    Spacer()
                }.padding()
               
            }

            Text ("Signup")
                 .font(.custom(AppFont.Bold.rawValue, size: 30))
                 .foregroundColor(Color("MainColor"))
                 .padding(8)
           
                 
            Group {
                    Text("Please ")
                    .font(.custom(AppFont.Regular.rawValue, size: 17))
                +
                    Text("provide following details ")
                    .font(.custom(AppFont.Bold.rawValue, size: 17))
                +
                    Text("for your new account")
                    .font(.custom(AppFont.Regular.rawValue, size: 17))
                    
                       
                }.padding(8)
                .padding(.leading)
                .padding(.trailing)
             
            
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
                .padding(.leading , 20 )
                .padding(.trailing , 20 )
            
            Spacer()
            
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
                } else if tabSelection < 4 { // go next
                    withAnimation {
                        self.tabSelection += 1
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
                    .shadow(color: Color("MainColor").opacity(0.6), radius: 5 , x: 0 , y: 3)
            }
        }
          
            .background(Color("BackGroundColor"))
            
            
    }
}

struct registerTabs_Previews: PreviewProvider {
    static var previews: some View {
        registerTabs {
            
        } BackAction: {
            
        }
    }
}

