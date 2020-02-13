import RxCocoa
import RxSwift
import UIKit
class MCTexfieldViewModel {
    
    //Outputs
    let text: Driver<String?>
    let icon: Driver<UIImage?>
    let isPassword: Driver<Bool>
    let placeHolder: Driver<String?>
    
    //inputs
    let textRelay = PublishRelay<String?>()
    
    init(_ config: Configuration){
        
        self.isPassword = Driver.of(config.isPassword)
        self.icon = Driver.of(config.icon)
        self.placeHolder = Driver.of(config.placeHolder)        
        self.text = self.textRelay.asDriver(onErrorJustReturn: nil)
    }
}

extension MCTexfieldViewModel {
    struct Configuration{
        let icon: UIImage?
        let isPassword: Bool
        let placeHolder: String
        
        init(icon: UIImage?, isPassword: Bool, placeHolder: String) {
            self.icon = icon
            self.isPassword = isPassword
            self.placeHolder = placeHolder
        }
    }
}
