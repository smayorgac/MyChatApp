import UIKit

class MCTextField: UIView {
    var textField: UITextField {
        let textField = UITextField()
        textField.placeholder = "AAAAAA"
        return textField
    }
    var underLineView: UIView {
        let underLineView = UIView()
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        underLineView.backgroundColor = .black
        NSLayoutConstraint.activate([
            underLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        return underLineView
    }
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
