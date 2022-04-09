//
//  collectionViewCell.swift
//  CarView
//
//  Created by 张金涛 on 2022/4/6.
//

import UIKit
class CollectionViewCell: UICollectionViewCell {
    
    var Name: [String] = [" ","宝马","法拉利","奔驰","兰博基尼","奥迪"]
    var imageview = UIImageView()
    var name: String?
    var label = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configView(tag: Int) {
        imageview.image=UIImage(named: "\(tag).jpeg")
        label.text = Name[tag]
        self.tag = tag
        setUp()
    }
    func setUp() {
        self.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints=false
        imageview.topAnchor.constraint(equalTo: self.topAnchor).isActive=true
        imageview.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive=true
        imageview.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        print(self.heightAnchor)
        imageview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive=true
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.topAnchor.constraint(equalTo: imageview.bottomAnchor).isActive=true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40).isActive=true
        label.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true
        label.textColor = .black
        
        label.font = UIFont.boldSystemFont(ofSize: 20)
    }
}
