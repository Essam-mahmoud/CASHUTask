//
//  MainPageViewController.swift
//  CASHU
//
//  Created by Smart Zone on 10/20/20.
//  Copyright © 2020 Smart Zone. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MainPageViewController: BaseViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var productsTableview: UITableView!
    @IBOutlet weak var loaderView: NVActivityIndicatorView!
    @IBOutlet weak var aboveButton: UIButton!
    @IBOutlet weak var noDataImage: UIImageView!
    
    //MARK:- Properities
    var lastContentOffset : CGFloat = 0
    fileprivate let cellName = "ProductsCell"
    var homePagePresenter: HomePagePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        homePagePresenter = HomePagePresenter(homePageVC: self)
        homePagePresenter?.homePageData.delegate = self
        getHomeData()

        // Do any additional setup after loading the view.
    }
    
    // function to setup View
    func setupView(){
        loaderView.type = .ballScaleMultiple
        productsTableview.delegate = self
        productsTableview.dataSource = self
        productsTableview.tableFooterView = UIView()
        productsTableview.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        productsTableview.addSubview(refreshControl)
    }
    
    // function to get data from server
    func getHomeData(){
        loaderView.startAnimating()
        homePagePresenter?.homePageData.getHomeData(success: { (success) in
            self.loaderView.stopAnimating()
            self.refreshControl.endRefreshing()
            self.productsTableview.reloadData()
            if self.homePagePresenter?.homePageData.data.products.count ?? 0 < 1{
                self.noDataImage.isHidden = false
            }else{
                self.noDataImage.isHidden = true
            }
            
        }, failure: { (failure) in
            self.refreshControl.endRefreshing()
            self.loaderView.stopAnimating()
        })
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        getHomeData()
    }
    
    @IBAction func showAboveBtn(_ sender: UIButton) {
        productsTableview.setContentOffset(.zero, animated: true)
    }
}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homePagePresenter?.homePageData.data.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! ProductsCell
        cell.setupProducts(product: (homePagePresenter?.homePageData.data.products[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let animationTwo = AnimationFactory.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 1.0, delayFactor: 0.05)
        
        let animatortwo = Animator(animation: animationTwo)
        animatortwo.animate(cell: cell, at: indexPath, in: tableView)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            aboveButton.isHidden = scrollView.contentOffset.y < 250
    }
}
