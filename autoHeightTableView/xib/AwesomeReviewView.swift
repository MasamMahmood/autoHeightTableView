//
//  AwesomeReviewView.swift
//  
//
//
//

import UIKit

class AwesomeReviewView: UIView {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet private weak var mainStackView: UIStackView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var memberSinceLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var seeMoreButton: UIButton!
    private var isSeeLess = true
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgBackView: UIView!
    private var seeMoreDidTapHandler: (() -> Void)?
    
    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var countBtn: UIButton!
    @IBOutlet weak var begenBtn: UIButton!
    
    @IBAction private func seeMoreButtonTapped() {
        
        self.isSeeLess.toggle()
        self.descLabel.numberOfLines = self.isSeeLess ? 0 : 2
        self.descLabel.layoutIfNeeded()
        self.seeMoreButton.setTitle(self.isSeeLess ? "Read Less" : "Read More", for: .normal)
        if isSeeLess == true {
            seeMoreButton.isHidden = true
        }
        self.seeMoreDidTapHandler?()
    }

    func onSeeMoreDidTap(_ handler: @escaping () -> Void) {
        
        self.seeMoreDidTapHandler = handler
    }
    
    func setupWith(_ review: ReviewElement) {
        
        self.userNameLabel.text = review.name
        self.memberSinceLabel.text = review.date
        self.descLabel.text = review.comment
       // self.imgView.loadImage(urlString: review.image, placeHolder: "")
        self.imgView.layer.cornerRadius = imgView.frame.size.height / 2
        self.imgBackView.layer.cornerRadius = imgBackView.frame.size.height / 2
        //self.dateLabel.text = review.date
        self.countBtn.setTitle(review.likeCount, for: .normal)
        
        let a = review.rating ?? ""
        let rat = a + ".0"
        self.ratingBtn.setTitle(rat, for: .normal)
        self.begenBtn.imageView?.contentMode = .scaleAspectFit
        self.isSeeLess = review.isExpanded ?? false
        print(descLabel.numberOfLines)
        print(self.isSeeLess)
        print(descLabel.text!.count)
        if descLabel.text!.count <= 80 {
            self.seeMoreButton.isHidden = true
        }
        self.descLabel.numberOfLines = self.isSeeLess ? 0 : 2
        self.seeMoreButton.setTitle(self.isSeeLess ? "Read Less" : "Read More", for: .normal)
        
    }
}
