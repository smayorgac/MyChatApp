import UIKit

class LoginView: UIView {
    
    let loginButton = MCButton()
    let signinButton = MCButton()
    let userNameField = MCTextField()
    let passwordField = MCTextField()
    
    var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode  = .scaleAspectFill
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(){
        self.backgroundColor = .white
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 18
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stackView.addArrangedSubview(self.logo)
        stackView.addArrangedSubview(self.userNameField)
        stackView.addArrangedSubview(self.passwordField)
        stackView.addArrangedSubview(self.loginButton)
        stackView.addArrangedSubview(self.signinButton)
                
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false;
        scrollView.addSubview(stackView)
        
        self.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: scrollView.contentLayoutGuide.rightAnchor, constant: 40),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo:scrollView.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
    }
}

extension LoginView {
    func bindings(vm: LoginViewModel) {
        self.userNameField.bingings(vm: vm.userNameVM)
        self.passwordField.bingings(vm: vm.passwordVM)
        self.signinButton.bindings(vm: vm.signInButtonVM)
        self.loginButton.bindings(vm: vm.loginButtonVM)
    }
}
