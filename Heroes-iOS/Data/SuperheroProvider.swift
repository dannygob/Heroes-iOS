//
//  Untitled.swift
//  Heroes-iOS
//
//  Created by Tardes on 24/6/25.
//

import Foundation

class SuperHeroProvider{
    
    static let BASE_URL = "https://superheroapi.com/api"
    static let ACCESS_TOKEN = "7252591128153666"
    
    static func findSuperheroesByName(query: String) async-> [Superhero] {
        
        guard let url = URL(string: "\(BASE_URL)/\(ACCESS_TOKEN)/search/\(query)")  else {
            return []//error
        }
            do{
                let (data,_) = try await URLSession.shared.data(from: url)
                
               /* if let str = String(data: data, encoding: .utf8){
                    print("Successfully decoded: \(str)")
                }*/
                JSONDecoder().decode(SuperheroResponse.self, from: data)
              
            }   catch {
                print(error.localizedDescription)
                return []
                
            }
            
        }
        
    }

