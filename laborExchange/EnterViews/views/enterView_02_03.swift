
import SwiftUI

struct enterView_02_03: View {
    var addProgress:()-> Void
    
    @Binding public var email:String
    @Binding public var password:String
    @Binding public var userAgreement:Bool
    @Binding public var userMailingAccess:Bool 

    
    var body: some View {
        GeometryReader{geometry in
            VStack{
                Text("Личные данные")
                    .frame(width: geometry.size.width-20)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                    .padding(.top)
           
                
                TextField("Почта*", text: $email)
                    .padding()
                    .frame(width: geometry.size.width-50, height: 46)
                
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal)
                
                TextField("Пароль*", text: $password)
                    .padding()
                    .frame(width: geometry.size.width-50, height: 46)
                
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal)
                
                TextField("Повторить пароль*", text: $password)
                    .padding()
                    .frame(width: geometry.size.width-50, height: 46)
                
                    .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                    .padding(.horizontal)
           
                Group{
                    Button{
                        if userMailingAccess {
                            withAnimation {
                                userMailingAccess = false
                            }
                        }else{
                            withAnimation {
                                userMailingAccess = true
                            }
                        }
                    } label: {
                        HStack{
                            Image(systemName: self.userMailingAccess ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(.black)
//                            Spacer() // Add Spacer here
                            Text("Я согласен(-а) на получение рассылки на e-mail")
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                                .font(.system(size: 15))
                            Spacer()
                        }
                    }
                    .foregroundColor(.black)

                    Button{
                        if userAgreement {
                            withAnimation {
                                userAgreement = false
                            }
                        }else{
                            withAnimation {
                                userAgreement = true
                            }
                        }
                    } label: {
                        HStack{
                            Image(systemName: self.userAgreement ? "largecircle.fill.circle" : "circle")
                                .clipShape(Circle())
                                .foregroundColor(.black)
                            
                            Text("Я согласен(-а) с пользовательским соглашения")
                                .lineLimit(2)
                                .font(.system(size: 15))
                                .multilineTextAlignment(.leading)
                            Spacer()
                               
                        }
                    }
                    .foregroundColor(.black)

                }
                .frame(width: geometry.size.width-50, height: 46)

                
                    
                
                
                
                Button(action: {
                    withAnimation {
                        addProgress()
                    }
                }) {
                    Text("Далее")
                        .frame(width: geometry.size.width-50, height: 46)
                        .background(Color.black)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)
                
            }
            .background(.white, in: RoundedRectangle(cornerRadius: 25, style: .continuous))
        }
    }
}


//
//struct enterView_02_03_Previews: PreviewProvider {
//    static var previews: some View {
//        enterView_02_03()
//    }
//}
