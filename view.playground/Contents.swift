//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class OfflineMessageView: UIView {
    var message:UILabel = UILabel()
    
    required init?(coder:NSCoder) {
        super.init(coder:coder)
        setupView()
    }
    override init(frame:CGRect) {
        super.init(frame:frame)
        setupView()
    }
    func setupView() {
        //add subviews here
        message.text = "You are offline"
        message.textColor = .white
        message.textAlignment = .center
        message.backgroundColor = .black
        addSubview(message)
        setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        message.translatesAutoresizingMaskIntoConstraints = false
        message.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        message.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        message.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        message.heightAnchor.constraint(equalToConstant: 40).isActive = true
        super.updateConstraints()
    }
}

class MyViewController : UIViewController {
    var offline: UIView?
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        offline = OfflineMessageView()
        offline?.backgroundColor = .black
        view.addSubview(offline!)

        self.view = view
    }
    
    override func updateViewConstraints() {
        offline?.translatesAutoresizingMaskIntoConstraints = false
        offline?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        offline?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        offline?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        super.updateViewConstraints()
    }
    
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
