
import SwiftUI




struct enterView_02: View {
    @Binding var path_enterView_02:NavigationPath
    @State private var student:studentInfo = studentInfo()
    @State private var progress:Int = 0
    
    @State private var lastName:String = ""
    @State private var firstName:String = ""
    @State private var patronimyc:String = ""
    @State private var gender: Bool = true
    @State private var city: String = ""
    @State private var course: Int = 1
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var phoneNumber:String = ""
    

    @State private var nameOfCompany:String = ""
    

    @State private var selectedCity = "Город*"
    @State private var selectedUnivercity = "Учебное заведение*"
    
    
    
    @State private var isMarkedStudent = true
    @State private var isMarkedOrganization = false
    
    @State private var userAgreement = false
    @State private var userMailingAccess = false

    var body: some View {

            
            ZStack{
                
                Color(.black)
                    .ignoresSafeArea()
                GeometryReader{ geometry in
                    
                    Text("Регистрация")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .position(y: 71)
                        .padding(.leading, 116)
                    
                    enterView_02_00(addProgress: addProgress, isMarkedStudent: self.$isMarkedStudent, isMarkedOrganization: self.$isMarkedOrganization)
                        .offset(x: progress == 0 ? 10 : geometry.size.width, y: 123)
                    
                    enterView_02_01(lastName: $lastName, firstName: $firstName, patronimyc: $patronimyc, gender: $gender, addProgress: addProgress, isMarkedStudent: $isMarkedStudent)
                        .offset(x: progress == 1 ? 10 : geometry.size.width, y: 123)
                    
                    enterView_02_02(addProgress: addProgress, selectedCity: $selectedCity, selectedUnivercity: $selectedUnivercity, phoneNumber: $phoneNumber, isMarkedStudent: $isMarkedStudent, nameOfCompany: $nameOfCompany)
                        .offset(x:progress == 2 ? 10: geometry.size.width, y: 123)
                    
                    enterView_02_03(addProgress: addProgress, email: $email, password: $password, userAgreement: $userAgreement, userMailingAccess: $userMailingAccess)
                        .offset(x:progress == 3 ? 10: geometry.size.width, y: 123)
                    
                }
                
                
                
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(for: String.self){view in
                if view == "studentInfoCorrecr" {
                    MainViewOfStudent()
                }
                else if view == "sellerinfoCorrect" {
                    MainViewOfSeller()
                }
                
            }
        
    }
    func addProgress(){
        guard progress < 3 else{
            if isMarkedStudent{
                checkStudentInfo()
            }else{
                checkSellerInfo()
            }
            return
        }
        progress += 1
    }
    func checkStudentInfo(){
        path_enterView_02.append("studentInfoCorrecr")
    }
    func checkSellerInfo(){
        path_enterView_02.append("sellerinfoCorrect")
    }
    
}



struct enterView_02_Previews: PreviewProvider {
    static var previews: some View {
        enterView_02(path_enterView_02: .constant(NavigationPath()))
    }
}





