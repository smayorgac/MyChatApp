import RxCocoa
import RxSwift

class MCButtonViewModel {
    //outputs
    let buttonPressed = PublishRelay<Void>()
    let buttonText: Driver<String>
    let buttonState: Driver<State>
    let buttonColor: Driver<UIColor>
    let textColor: Driver<UIColor>
    let animation: CustomAnimation?
    
    let disposebag = DisposeBag()
    
    init(_ config: Configuration){
        self.buttonText = Driver.of(config.text)
        self.buttonState = Driver.of(config.state)
        self.textColor = Driver.of(config.textColor)
        self.buttonColor = Driver.combineLatest(Driver.of(config.color), self.buttonState)
            { (color:$0, state: $1) }
            .map{
                $0.state == .disable ? Colors.grey : $0.color
            }
        self.animation = config.animation
    }
}

extension MCButtonViewModel {
    enum State {
        case enable
        case disable
    }
}

extension MCButtonViewModel {
    
    struct Configuration {
        let text: String
        let state: State
        let color: UIColor
        let animation: CustomAnimation?
        let textColor: UIColor
        
        init(text: String, state: State, color: UIColor, customAnimation: CustomAnimation?, textColor: UIColor) {
            self.text = text
            self.state = state
            self.color = color
            self.animation = customAnimation
            self.textColor = textColor
        }
    }
}
