//
//  ViewController.swift
//  autoHeightTableView
//
//  Created by Masam Mahmood on 18.02.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: MyOwnTableView!
    var reviewData: Review?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let nib = UINib.init(nibName: "ReviewTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ReviewTableViewCell")
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 200
        
        fetchData()
    }

    func fetchData(){
        
        if let url = Bundle.main.url(forResource: "review", withExtension: "json") {
            do {
                
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Review.self, from: data)
                self.reviewData = jsonData
                self.tableView.reloadData()
            } catch {
                print("error:\(error)")
            }
        }
        
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        cell.selectionStyle = .none
        cell.layoutSubviews()
        cell.reviewData = self.reviewData?.reviewDetails?.reviews
        cell.sectionTitle.text =  self.reviewData?.reviewDetails?.title
        cell.tumuLink = self.reviewData?.reviewDetails?.link ?? ""
        let countData = self.reviewData?.reviewDetails?.count ?? ""
        let btntitle = "All" + " (" + countData + ")"
        cell.linkBtn.setTitle(btntitle, for: .normal)
        cell.tableView.reloadData()
        
        return cell
    }
    
    
}
