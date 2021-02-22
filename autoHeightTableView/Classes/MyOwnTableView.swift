//
//  MyOwnTableView.swift
//  autoHeightTableView
//
//  Created by Masam Mahmood on 22.02.2021.
//

import Foundation
import UIKit

class MyOwnTableView: UITableView {
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        print("ContentSizee \(contentSize)")
        return self.contentSize
    }

    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }

    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
    }
}
