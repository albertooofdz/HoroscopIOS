//
//  ViewController.swift
//  HoroscopIOS
//
//  Created by Mañanas on 11/4/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let horoscopeList = Horoscope.getHoroscopes()
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return horoscopeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = RecyclerView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HoroscopeViewCell
        
        let horoscope = horoscopeList[indexPath.row]
        
        cell.titleLabel.text = horoscope.name
        cell.signImageView.image = horoscope.image
        cell.signImageView.tintColor = UIColor.lightGray
        cell.descriptionLabel.text = horoscope.dates
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        return print ("Has elegido \(horoscopeList[indexPath.row])")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
            
        let detailViewController = segue.destination as! DetailViewController
        
        let indice = RecyclerView.indexPathForSelectedRow!
        
        detailViewController.horoscope = horoscopeList[indice.row]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        RecyclerView.dataSource = self
        RecyclerView.delegate = self
     
    }


    @IBOutlet var RecyclerView: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

