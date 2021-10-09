//
//  WelcomViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 9/28/21.
//

import UIKit

class WelcomViewController: UIViewController {
    
    @IBOutlet var holderView: UIView!
    
 let scrollView = UIScrollView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    
    private func configure() {
        // set up scrollview
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        let titles = ["Покупайте лекарства онлайн", "Все в \n одном месте", "Быстрая доставка \n от 15 минут"]
        for x in 0..<2 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            // Title, image, button
            
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width - 20, height: 120))
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10 + 120 + 10, width: pageView.frame.size.width - 20, height: pageView.frame.size.height - 60 - 130 - 15))
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width - 20, height: 50))
            pageView.backgroundColor = UIColor(named: "Color1")
            button.backgroundColor = UIColor(named: "Color2")
            button.titleLabel?.textColor = UIColor(named: "Color1")
            label.textColor = UIColor(named: "Color2")
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica Neue", size: 20)
            label.numberOfLines = 0
            pageView.addSubview(label)
            label.text = titles[x]
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcom_\(x + 1)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            imageView.backgroundColor = UIColor(named: "Color1")
        
            button.layer.cornerRadius = 20
            button.setTitle("Далее", for: .normal)
            if x == 1 {
                button.setTitle("Начнем", for: .normal)

            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x + 1
            pageView.addSubview(button)
        }
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 3, height: 0)
        scrollView.isPagingEnabled = true
    }

    @objc func didTapButton(_ button: UIButton){
        guard button.tag < 2 else {
            //dismiss
            Core.shared.setIsNotNewUsers()
            dismiss(animated: true, completion: nil)
            return
        }
        // scroll to next page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
}
