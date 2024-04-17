//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit

class BudgetTypeCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    var collectionView: UICollectionView!
    public private (set) var budgetList = [Budget]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.init()
        configure()
    }
    func assignData(_ types: [Budget]) {
        self.budgetList = types
        self.collectionView.reloadData()
    }
    private func configure() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        flowLayout.itemSize = CGSize(width: 160, height: 40)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: flowLayout)
        
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = true
        collectionView.register(BudgetTypeInfoCell.self, forCellWithReuseIdentifier: BudgetTypeInfoCell.reuseID)
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -10)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return budgetList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: BudgetTypeInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: BudgetTypeInfoCell.reuseID, for: indexPath) as! BudgetTypeInfoCell
        
        let budget = self.budgetList[indexPath.item]
        cell.updateUI(budget)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 40)
    }
}
