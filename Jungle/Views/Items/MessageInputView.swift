
import SwiftUI


struct MessageInputView: View {
    
    @Binding var inputText: String
    
    var action: () -> Void
    
    var body: some View {
        
        VStack {
            
            
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
                .padding(.bottom, 8)

            
            HStack {
                
                TextField("Message...", text: $inputText)
                    .frame(minHeight: 35)
                    .autocapitalization(.none)
                             
                                        .overlay(
                                            Capsule()
                                                .stroke(lineWidth: 3)
                                                .frame(width: 320, height: 35)
                                                .foregroundColor(.yellow)
                                        
                                        
                                        
                                        
                                        )

                                            
                                        
                Button(action: action) {
                   Image(systemName: "arrow.up.circle.fill")
                        .foregroundColor(.yellow)
                        
                }
                
                
            }
        }.padding(.bottom, 8)
         .padding(.horizontal)
         

    }
}
