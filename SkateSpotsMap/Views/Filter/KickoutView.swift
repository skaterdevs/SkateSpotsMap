//
//  KickoutView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI

struct KickoutView: View {
    var body: some View {
        HStack{
            Button{
                
            }
            label:{
                Text("Low")
            }
            .background(.green)
            .foregroundColor(.black)
            .buttonStyle(.bordered)
            .cornerRadius(8)
            
            Button{
                
            }
            label:{
                Text("Medium")
            }
            .background(.yellow)
            .foregroundColor(.black)
            .buttonStyle(.bordered)
            .cornerRadius(8)
            
            Button{
                
            }
            label:{
                Text("High")
            }
            .background(.red)
            .foregroundColor(.black)
            .buttonStyle(.bordered)
            .cornerRadius(8)
            
        }
    }
}

//struct KickoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        KickoutView()
//    }
//}
