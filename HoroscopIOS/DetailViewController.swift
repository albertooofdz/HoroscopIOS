//
//  DetailViewController.swift
//  HoroscopIOS
//
//  Created by Mañanas on 15/4/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let horoscopeInfo = try await getHoroscope()

                print(horoscopeInfo)
            } catch {
                print(error)
            }
        }

        // Do any additional setup after loading the view.
        self.navigationItem.title = horoscope?.name
        detailSignName.text = horoscope?.name
        detailSignDate.text = horoscope?.dates
        detailImageView.image = horoscope?.image
        
        
            
        
    }
    
        override func didReceiveMemoryWarning(){
            super.didReceiveMemoryWarning()
        }
    
    func getHoroscope() async throws{
        
        detailSignInfo.isHidden = true
        let horoscopeDaily = try await fetchHoroscopeFrom()
        if (!horoscopeDaily.horoscope_data.isEmpty){
            detailSignInfo.text = horoscopeDaily.horoscope_data
            detailSignInfo.isHidden = false
        }
    }
    
    func fetchHoroscopeFrom() async throws -> HoroscopeApi {
        let sign = horoscope?.id
        
        let url = URL (string:"https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(sign!)&day=TODAY")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoded = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
        
        return decoded.data
        
        
    }

    /*
    // MARK: - Outlet
    */
    
    @IBOutlet var detailImageView: UIImageView!
    
    @IBOutlet var detailSignName: UILabel!
    
    @IBOutlet var detailSignDate: UILabel!
    
    @IBOutlet var detailSignInfo: UILabel!
}

