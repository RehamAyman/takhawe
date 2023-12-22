

import SwiftUI

struct CardItemView: View {
    
    var colors: [Color]
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Image ( "visa-pay-logo")
                        .resizable()
                        .scaledToFit()
                        .frame( height: 40 )
                    
                    Spacer()
                }
            
                Spacer()
                Text("•••• •••• ••• 8574")
                    .foregroundColor(.white)
                Spacer()
                HStack {
                    VStack {
                        Text ( "Card holder")
                        Text ( "KELLY OLIVER")
                    }.font(.system(size: 12))
                        .foregroundColor(.white)
                    Spacer()
                    VStack {
                        Text ( "Expires")
                        Text ( "08/21")
                    }
                    .font(.system(size: 12))
                    .foregroundColor(.white)
                }
                
//                
//                HStack {
//                   
//                   // Text(" •••• •••• •••• 8574 ")
//                    //Spacer()
////                    Image("mirLogo")
////                        .resizable()
////                        .scaledToFill()
////                        .frame(width: 60, height: 30)
//                }
            }
            .padding()
        }
        .frame(width: 242, height: 153)
        .background(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
        .cornerRadius(15)
        .shadow(color: .accentColor.opacity(0.2), radius: 5, x: 4, y: 4)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardItemView(colors: [Color(Colors.lightBlue), Color(Colors.lightIndigo)])
    }
}
