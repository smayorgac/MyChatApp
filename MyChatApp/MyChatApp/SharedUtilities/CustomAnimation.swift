import UIKit

protocol CustomAnimation {
    var action: CABasicAnimation { get }
    func animate(view: UIView) -> Void
}
