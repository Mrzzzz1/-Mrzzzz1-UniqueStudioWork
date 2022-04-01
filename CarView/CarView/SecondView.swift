//
//  SecondView.swift
//  CarView
//
//  Created by 张金涛 on 2022/3/29.
//

import UIKit
class SecondView:UIView, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        cell.textLabel?.text=Text[tag][indexPath.row]
        cell.tag=indexPath.row
        return cell
    }
    
    var Text:[[String]]=[[],["x1","x2","x3","x4","x5"],["458","488","355","F40","250GT"],["G350","C200","S560","S500","glb"],["Aventador","Huracan","Reventon","350GT","350GTV"],["A6","A7","A8","R7","RS7"]]
    
    var backButton = UIButton()
    var imageView=UIImageView()
    var tableView=UITableView()
    var delegate:SecondViewDelegate?=nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(tag:Int){
        self.tag=tag
        self.backgroundColor = .white
        imageView.image=UIImage(named: "\(tag).jpeg")
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints=false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive=true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive=true
        imageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive=true
        self.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints=false
        backButton.topAnchor.constraint(equalTo: self.topAnchor,constant: 50).isActive=true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive=true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive=true
        backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive=true
       
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
       //backButton.backgroundColor = .systemBlue

        backButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints=false
        tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive=true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive=true
        tableView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive=true
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        tableView.delegate=self
        tableView.dataSource=self
    }
    @objc func click() {
        
        UIView.transition(with: self, duration: 0.5, options: .transitionFlipFromLeft, animations:{
            self.alpha=0
            
        }, completion:{
            _ in self.removeFromSuperview()
        })
        
        
    }
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print(indexPath.row+1)
        let cell=tableView.cellForRow(at: indexPath)
        
        delegate?.showDetailView(tag1: tag, tag2:cell!.tag)
        return indexPath
    }
//    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        print(indexPath.row+1)
//        let cell=tableView.cellForRow(at: indexPath)
//        
//        delegate?.showDetailView(tag1: tag, tag2:cell!.tag)
//    }
    
    
}
protocol SecondViewDelegate{
    func showDetailView(tag1:Int,tag2:Int)
}
