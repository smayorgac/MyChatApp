import UIKit
import RxCocoa
import RxSwift

class MCButton: UIButton{
    let disposebag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    
    private func setUp(){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 50),
            self.widthAnchor.constraint(equalToConstant: 280)
        ])
        self.styleButton()
        self.setShadow()
    }
    
    private func styleButton(){
        self.titleLabel?.font   = UIFont(name:"AvenirNext-DemiBold", size: 18)
        self.layer.cornerRadius = 25
        self.layer.borderWidth  = 3.0
        self.layer.borderColor  = UIColor.darkGray.cgColor
    }
    
    private func setShadow() {
        self.layer.shadowColor   = UIColor.black.cgColor
        self.layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        self.layer.shadowRadius  = 8
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds       = true
        self.layer.masksToBounds = false
    }
}
extension MCButton {
    func bindings(vm: MCButtonViewModel) {
        vm.buttonText
            .drive(self.rx.title(for: .normal))
            .disposed(by: self.disposebag)
        
        vm.textColor
            .drive(onNext: {
                self.setTitleColor($0, for: .normal)
            })
            .disposed(by: self.disposebag)
        
        vm.buttonColor
            .drive(self.rx.backgroundColor)
            .disposed(by: self.disposebag)
        
        self.rx.tap
            .asDriver()
            .drive(onNext: {_ in  vm.buttonPressed.accept(()) })
            .disposed(by: self.disposebag)
        
        vm.buttonPressed
            .withLatestFrom(vm.buttonState)
            .filter{ $0 != .disable }
            .map { _ in () }
            .asDriver(onErrorJustReturn: ())
            .drive(onNext: { _ in vm.animation?.animate(view: self) })
            .disposed(by: self.disposebag)
    }
}
