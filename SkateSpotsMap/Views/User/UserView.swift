//
//  UserView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/5/23.
//

import SwiftUI

struct UserView: View {
    private var user : User
    var body: some View {
        VStack{
            Text(user.avatar)
            Text(user.username)
            Button{
                
            }
            label:{
                Text("Follow")
            }
            ClipsView()
//            SpotsView()
        }
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
