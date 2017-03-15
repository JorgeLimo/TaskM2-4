//
//  FavoritosCollectionViewController.swift
//  TaskM2
//
//  Created by alumno on 3/14/17.
//  Copyright © 2017 Jorge Limo. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FavoritosCollectionViewController: UICollectionViewController {
    
    @IBOutlet var cvFavoritos: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return favoritos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CeldaCollectionViewCell
    
        let item = favoritos[indexPath.row]
        
        cell.lblnombre.text = item.nombre
        cell.lblprecio.text = "S/ " + String(item.precio)
        
        
        
        
        let swipegr = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipegr.direction = UISwipeGestureRecognizerDirection.left
        
        cell.addGestureRecognizer(swipegr)
        // Configure the cell
    
        return cell
    }

    func swipe(sender : UISwipeGestureRecognizer){
        
        let cell = sender.view as! CeldaCollectionViewCell
        let indexPath = collectionView?.indexPath(for: cell)
        
        favoritos.remove(at: (indexPath!.row))
        cvFavoritos.reloadData()
    }
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
