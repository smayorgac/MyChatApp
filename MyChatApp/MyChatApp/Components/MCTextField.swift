import UIKit
import RxSwift
import RxCocoa
class MCTextField: UIView {
    let disposebag = DisposeBag()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name:"AvenirNext-DemiBold", size: 18)
        return textField
    }()
    
    var underLineView: UIView = {
        let underLineView = UIView()
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        underLineView.backgroundColor = .black
        NSLayoutConstraint.activate([
            underLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        return underLineView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
    }
    func setUp(){
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(self.textField)
        stackView.addArrangedSubview(self.underLineView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension MCTextField {
    func bingings(vm: MCTexfieldViewModel) {
        vm.placeHolder
            .drive(self.textField.rx.placeHolderRx)
            .disposed(by: self.disposebag)

        vm.text
            .drive(self.textField.rx.text)
            .disposed(by: self.disposebag)
        
        vm.isPassword
            .drive(self.textField.rx.isSecureTextEntry)
            .disposed(by: self.disposebag)
        
        self.textField.rx.text.asDriver()
            .drive(onNext: { vm.textRelay.accept($0) })
            .disposed(by: self.disposebag)
        }
}
