import SwiftUI

struct TagView: View {
    var body: some View {
        HStack{
            ForEach(Tag.allTags, id: \.self){ tag in
                Button{
                    //same as feature
                    //tag.switchStates or something like that which in would address inclusion in filter
                    //tag.switchColors - keep a record of current colors, switch it to the other colors
                    //to indicate selection, could be grouped with switchStates
                }
                label:{
                    Text(tag)//need to switch to icons
                }
//                .background(.white)
//                .foregroundColor(.blue)
                //or
                .background(.blue)
                .foregroundColor(.white)
                .buttonStyle(.bordered)
                .cornerRadius(10) // 4

                
//                label:
//                {
//                    //could switch to image w/ background
//                    Text(tag)
//                        .backgroundColor(.blue)
//                }
            }
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
