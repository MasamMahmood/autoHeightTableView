//
//  File.swift
//  
//


import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tableView: MyOwnTableView!
    var reviewData: [ReviewElement]?
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var btnAll: UIButton!
    var tumuLink: String = ""
        
    override func awakeFromNib() {
        super.awakeFromNib()
             
        let nib = UINib.init(nibName: "CellTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CellTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.estimatedRowHeight = 200
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()        
    }
    @IBAction func onClickedTumu(_ sender: UIButton) {
        
    }

  
}

extension ReviewTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTableViewCell", for: indexPath) as! CellTableViewCell
        cell.selectionStyle = .none
        
        if cell.contentView.subviews.contains(where: { $0.tag == 999 }) == false {
            let customView = Bundle.main.loadNibNamed(String(describing: AwesomeReviewView.self), owner: self, options: nil)?.first as! AwesomeReviewView
            customView.tag = 999
            cell.contentView.addSubview(customView)
            customView.translatesAutoresizingMaskIntoConstraints = false
            customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
            customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
            customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor).isActive = true
            customView.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor).isActive = true
            customView.onSeeMoreDidTap { [weak self] in
                
                self?.reviewData?[indexPath.row].isExpanded?.toggle()
                tableView.beginUpdates()
                
                tableView.endUpdates()
            }
            
            customView.setupWith((self.reviewData?[indexPath.row])!)
        }
        
        return cell

    }
    
}

