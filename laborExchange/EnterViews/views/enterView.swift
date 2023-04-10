
import SwiftUI

struct enterView: View {
    
    
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Group{
                    Text("Здравствуйте!")
                        .font(.system(size: 24))
                        .fontWeight(.medium)
                    Group{
                        Text("Биржа талантов - возможность")
                        Text(" получить любимую работу!")
                    }
                    .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                }
                
                Group{
                    Button{
                        path.append("Вход")
                    }label: {
                        Text("Вход")
                            .frame(width: 343, height: 46)
                            .background(Color.black)
                            .cornerRadius(13)
                            .foregroundColor(.white)    
                    }.padding(.top, 33)
                    Button{
                        path.append("Регистрация")
                    }label: {
                        Text("Регистрация")
                            .frame(width: 343, height: 46)
                            .background(Color.black)
                            .cornerRadius(13)
                            .foregroundColor(.white)
                    }
                }
                
            }
            .navigationDestination(for: String.self){view in
                if view == "Вход" {
                    enterView_01(enterView_01_path: $path)
                }else if view == "Регистрация" {
                    enterView_02(path_enterView_02: $path)
                }else if view == "Вход в приложение"{
                    MainViewOfSeller()
                }else if view == "studentInfoCorrecr" {
                    MainViewOfStudent()
                }
                else if view == "sellerinfoCorrect" {
                    MainViewOfSeller()
                }
                
            }
        }
        
        
    }
}

struct enterView_Previews: PreviewProvider {
    static var previews: some View {
        enterView()
    }
}
