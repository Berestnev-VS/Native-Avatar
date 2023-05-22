import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    let scrollView = UIScrollView()
    let customTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.text = "Avatar"
        return label
    }()
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "person.crop.circle.fill")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        scrollView.delegate = self
        scrollView.frame = view.bounds
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        
        view.addSubview(scrollView)
        view.addSubview(customTitleView)
        customTitleView.addSubview(titleLabel)
        customTitleView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            customTitleView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            customTitleView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            customTitleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: customTitleView.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor),
            
            imageView.trailingAnchor.constraint(equalTo: customTitleView.trailingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: customTitleView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = max(0, scrollView.contentOffset.y)
        customTitleView.transform = CGAffineTransform(translationX: 0, y: -offset)
    }
}

class CustomNavController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = false
        
    }
}
