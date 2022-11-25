//
//  HomeViewController.swift
//  Task 1 & 2
//
//  Created by Ogabek Matyakubov on 25/11/22.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var cvMain: UICollectionView!
    
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        
    }


    // MARK: - Methods
    
    func initViews() {
        addNavBar()
        setCollectionView()
        
        setItems()
    }
    
    func setItems() {
        items.append(Item(title: "OgabekDev Office", image: "best_table"))
        items.append(Item(title: "Teamword", image: "teamwork"))
        items.append(Item(title: "OgabekDev Office", image: "best_table"))
        items.append(Item(title: "Teamword", image: "teamwork"))
        items.append(Item(title: "OgabekDev Office", image: "best_table"))
        items.append(Item(title: "Teamword", image: "teamwork"))
        items.append(Item(title: "OgabekDev Office", image: "best_table"))
        items.append(Item(title: "Teamword", image: "teamwork"))
        items.append(Item(title: "OgabekDev Office", image: "best_table"))
        items.append(Item(title: "Teamword", image: "teamwork"))
        items.append(Item(title: "OgabekDev Office", image: "best_table"))
        items.append(Item(title: "Teamword", image: "teamwork"))
        items.append(Item(title: "OgabekDev Office", image: "best_table"))
    }
    
    func addNavBar() {
        let scroll = UIImage(systemName: "list.bullet.rectangle")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: scroll, style: .plain, target: self, action: #selector(scrollClick))
        title = "Collection View"
    }
    
    func callScroll() {
        let vc = ScrollViewController(nibName: "ScrollViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setCollectionView() {
        cvMain.dataSource = self
        cvMain.delegate = self
        
        self.cvMain.register(UINib(nibName: "ItemCollectionViewCell", bundle: nibBundle), forCellWithReuseIdentifier: "myCell")
        
        if let flowLayout = cvMain?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screenSize: CGRect = UIScreen.main.bounds
            let cellWidth = screenSize.width / numberOfColoumns - 15
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
    }
    
    
    // MARK: - Actions
    
    
    
    // MARK: - @objc Functions
    
    @objc func scrollClick() {
        callScroll()
    }
    
    // MARK: - Collections
    
    let numberOfColoumns: CGFloat = 2
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.tvTitle.text = item.title
        cell.ivMain.image = UIImage(named: item.image)
        
        return cell
    }

}
