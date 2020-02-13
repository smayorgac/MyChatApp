
import Foundation
import RxSwift
import RxCocoa

public extension Reactive where Base: UITextField {
    public var isSecureTextEntry: Binder<Bool> {
         return Binder<Bool>(self.base, scheduler: MainScheduler.instance) { view, value in
                   view.isSecureTextEntry = value
        }
    }
    public var placeHolderRx: Binder<String?> {
        return Binder<String?>(self.base, scheduler: MainScheduler.instance) { view, value in
            view.placeholder = value
        }
    }
}
