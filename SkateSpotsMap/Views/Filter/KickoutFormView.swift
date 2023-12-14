//
//  KickoutFormView.swift
//  SkateSpotsMap
//
//  Created by Dillon Shu on 12/13/23.
//

import SwiftUI

struct KickoutFormView: View {
    @EnvironmentObject var filterViewModel : FilterViewModel
    @State var inputKickout : String
    var body: some View {
        Picker(selection: $inputKickout, label: Text("Kickout Rating")){
            ForEach(Kickout.allKickout, id:\.self){inputKickout in
                Text(inputKickout).tag(inputKickout)
            }
        }
        .onChange(of: inputKickout){ newInput in
            var _ = print(inputKickout)
            filterViewModel.kickout = inputKickout
        }
    }
}

//struct KickoutFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        KickoutFormView()
//    }
//}
