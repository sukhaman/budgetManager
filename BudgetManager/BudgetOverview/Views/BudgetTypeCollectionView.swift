//
//  Created by Sukhaman Singh on 3/23/24.
//

import UIKit

class BudgetTypeCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    var collectionView: UICollectionView!
    public private (set) var budgetTypes = [BudgetType]()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.init()
        configure()
    }
    func assignData(_ types: [BudgetType]) {
        self.budgetTypes = types
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
        return budgetTypes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: BudgetTypeInfoCell = collectionView.dequeueReusableCell(withReuseIdentifier: BudgetTypeInfoCell.reuseID, for: indexPath) as! BudgetTypeInfoCell
        
        let budget = self.budgetTypes[indexPath.item]
        cell.lblName.text = budget.type
        cell.imageAvatar.image = UIImage.from(color: budget.color,size: CGSize(width: 5, height: 5))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 40)
    }
}
