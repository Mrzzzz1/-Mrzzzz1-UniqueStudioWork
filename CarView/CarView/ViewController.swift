//
//  ViewController.swift
//  CarView
//
//  Created by 张金涛 on 2022/3/29.
//

import UIKit


class ViewController:  UIViewController,SecondViewDelegate, UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCollectionView()
        setupLebalView()
        
       
    }
    func setupLebalView() {
        let label = UILabel()
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive=true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        label.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true
        label.text = "Choose your car!"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 40)
    }
    
    func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: self.view.frame.width/3, height: self.view.frame.height*0.2)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints=false
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "itemed")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemed", for: indexPath) as! CollectionViewCell
        cell.configView(tag: (indexPath.item)+1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showTableview(tag: indexPath.item+1)
    }
    
    
    
    func showTableview(tag: Int) {
        let secondView = SecondView(frame: self.view.frame)
        secondView.delegate=self
        UIView.transition(with: self.view, duration: 0.5, options: .transitionFlipFromLeft, animations: {
             self.view.addSubview(secondView)
        },completion:nil)
        self.view.addSubview(secondView)
        secondView.setupView(tag: tag)
    }
    
    func showDetailView(tag1: Int, tag2: Int) {
        let detailView=DetailView(frame: self.view.frame)
        UIView.transition(with: self.view, duration: 0.5, options: .transitionCurlDown, animations: {
             self.view.addSubview(detailView)
        }, completion:nil)
        detailView.setUp(i: tag1, j: tag2)
    }
    

}


