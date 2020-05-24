//
//  FirstViewController.swift
//  CXSwift
//
//  Created by mahong yang on 2019/6/14.
//  Copyright © 2019 mahong yang. All rights reserved.
//
import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //显示频道列表的tableView
    var tableView:UITableView!
    
    //频道列表数据
    var channels:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        channels = ["LeetCode"]
    }
    
    //返回表格分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.channels.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify: String = "SwiftCell"
            let cell = tableView.dequeueReusableCell(
                withIdentifier: identify, for: indexPath)
            cell.accessoryType = .disclosureIndicator
            //设置单元格内容
            cell.textLabel?.text = channels[indexPath.row]
            return cell
    }
    
    //处理列表项的选中事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemName = channels[indexPath.row]
        if itemName == "LeetCode" {
            let vc = CXLeetCodeViewController()
            vc.title = itemName
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

