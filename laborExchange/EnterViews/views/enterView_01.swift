
import SwiftUI

struct enterView_01: View {
    @State private var logString:String = ""
    @State private var pasString:String = ""
    @Binding var enterView_01_path:NavigationPath
    var body: some View {
        
            VStack{
                HStack{
                    Text("Вход")
                        .font(.system(size: 34))
                        .fontWeight(.semibold)
                        .padding(.leading, 16)
                        .padding(.top, 20)
                    Spacer()
                }
                    
                Spacer()
                    .frame(height: 24)
                VStack{
                    Text("Личные данные")
                        .font(.system(size: 28))
                        .multilineTextAlignment(.center)
                        .padding(.top)
                        
                        
                    TextField("Логин", text: $logString)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                                .padding(.horizontal)
                    TextField("Пароль", text: $logString)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                                .padding(.horizontal)
                    Button{
                        enterView_01_path.append("Вход в приложение")
                    }label: {
                        Text("Вход")
                            
                            .frame(width: 323, height: 46)
                            .background(Color.black)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }.padding(.top)
                    
                    Button{
                        enterView_01_path.append("Вход")
                    }label: {
                        Text("Забыли пароль")
                            .foregroundColor(.gray)
                    }
                    Spacer().frame(height: 20)
                }
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .padding(.horizontal)
                
                Group{
                    Text("Войти с помощью:")
                        .padding(.top, 26)
                    Button{}label: {
                        Image("vk")
                            .resizable()
                            .frame(width: 31, height: 15)
                            .frame(width: 323, height: 46)

                            .cornerRadius(13)

                            
                    }.background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                }
                Spacer()
                    .navigationBarBackButtonHidden()
            }
           
            
                
//                .navigationDestination(for: String.self){view in
//                    if view == "Войти с помощью:"{
//                        MainViewOfStudent()
//                    }
//                }
        
    }
}

struct enterView_01_Previews: PreviewProvider {
    static var previews: some View {
        enterView_01(enterView_01_path: .constant(NavigationPath()))
    }
}
