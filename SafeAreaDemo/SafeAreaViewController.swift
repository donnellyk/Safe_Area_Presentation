import UIKit

class SafeAreaView : UIView {
  @IBOutlet weak var label: UILabel! {
    didSet{
      label.text = "\(safeAreaInsets.top)\n\(safeAreaInsets.right)\n\(safeAreaInsets.bottom)\n\(safeAreaInsets.left)"
    }
  }
  
  override func safeAreaInsetsDidChange() {
    super.safeAreaInsetsDidChange()
    label.text = "\(safeAreaInsets.top)\n\(safeAreaInsets.right)\n\(safeAreaInsets.bottom)\n\(safeAreaInsets.left)"
  }
}

class SafeAreaViewController: UIViewController {
  @IBOutlet weak var centerY: NSLayoutConstraint!
  @IBOutlet weak var centerX: NSLayoutConstraint!
  @IBOutlet weak var safeAreaView: SafeAreaView!
  
  @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    let translation = sender.translation(in: view)
    centerY.constant += translation.y
    centerX.constant += translation.x
    
    sender.setTranslation(.zero, in: view)
  }
  
  @IBAction func additionalTapped(_ sender: Any) {
    if additionalSafeAreaInsets == .zero {
      additionalSafeAreaInsets = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
    } else {
      additionalSafeAreaInsets = .zero
    }
  }
  
  @IBAction func marginTapped(_ sender: Any) {
    safeAreaView.insetsLayoutMarginsFromSafeArea = !safeAreaView.insetsLayoutMarginsFromSafeArea
  }
}
