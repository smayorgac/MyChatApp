import Foundation
import RxSwift
import RxCocoa
import UIKit

class LoginViewModel {
    let userNameVM: MCTexfieldViewModel
    let passwordVM: MCTexfieldViewModel
    let loginButtonVM: MCButtonViewModel
    let signInButtonVM: MCButtonViewModel
    
    init() {
        let userNameConfig = MCTexfieldViewModel.Configuration(icon: nil, isPassword: false, placeHolder: "User Name")
        let passwordConfig = MCTexfieldViewModel.Configuration(icon: nil, isPassword: true, placeHolder: "Password")
        let loginButtonConfig = MCButtonViewModel.Configuration(text: "Login", state: .enable, color: Colors.coolBlue, customAnimation: BasicShakeAnimation(), textColor: Colors.white)
        let signinButtonConfig = MCButtonViewModel.Configuration(text: "Sign in", state: .enable, color: Colors.orange, customAnimation: BasicShakeAnimation(), textColor: Colors.darkBlack)
        
        self.userNameVM = MCTexfieldViewModel(userNameConfig)
        self.passwordVM = MCTexfieldViewModel(passwordConfig)
        self.loginButtonVM = MCButtonViewModel(loginButtonConfig)
        self.signInButtonVM = MCButtonViewModel(signinButtonConfig)
        
        let credentials = Driver.combineLatest(
                userNameVM.text.filter({ $0 != nil }),
                passwordVM.text.filter({ $0 != nil })
            ){ (username: $0, password: $1) }
        
//        loginButtonVM.buttonPressed
//            .withLatestFrom(credentials)
//            .bind(onNext: {
//                
//            })
    }
}
