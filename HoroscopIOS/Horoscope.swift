//
//  Horoscope.swift
//  HoroscopIOS
//
//  Created by Mañanas on 11/4/24.
//

import UIKit

struct Horoscope {
    let id: String
    let name: String
    let image: UIImage
    let dates: String
    
    static func getHoroscopes() -> [Horoscope] {
        let list: [Horoscope] = [
            Horoscope(id: "aries", name: "Aries", image: UIImage(named: "aries")!, dates: "March 21 to April 19"),
            Horoscope(id: "taurus", name: "Taurus", image: UIImage(named: "tauro")!, dates: "April 20 to May 20"),
            Horoscope(id: "gemini", name: "Gemini", image: UIImage(named: "geminis")!, dates: "May 21 to June 20"),
            Horoscope(id: "cancer", name: "Cancer", image: UIImage(named: "cancer")!, dates: "June 21 to July 22"),
            Horoscope(id: "leo", name: "Leo", image: UIImage(named: "leo")!, dates: "July 23 to August 22"),
            Horoscope(id: "virgo", name: "Virgo", image: UIImage(named: "virgo")!, dates: "August 23 to September 22"),
            Horoscope(id: "libra", name: "Libra", image: UIImage(named: "libra")!, dates: "September 23 to October 22"),
            Horoscope(id: "scorpio", name: "Scorpio", image: UIImage(named: "escorpio")!, dates: "October 23 to November 21"),
            Horoscope(id: "sagittarius", name: "Sagittarius", image: UIImage(named: "sagitario")!, dates: "November 22 to December 21"),
            Horoscope(id: "capricorn", name: "Capricorn", image: UIImage(named: "capricornio")!, dates: "December 22 to January 19"),
            Horoscope(id: "aquarius", name: "Aquarius", image: UIImage(named: "acuario")!, dates: "January 20 to February 18"),
            Horoscope(id: "pisces", name: "Pisces", image: UIImage(named: "piscis")!, dates: "February 19 to March 20")
        ]
        return list
    }
}

struct HoroscopeResponse: Decodable{
    let data: HoroscopeApi
}
struct HoroscopeApi: Decodable{
    let horoscope_data: String
}


    
