//
//  ApiClient.swift
//  RedPanda
//
//  Created by Muhammad Anas on 25/10/22.
//

import Foundation

public struct ApiClient {
    
    
    
    
    
    static func getDataFromServer( complete: @escaping (_ success: Bool, _ data: [Data]? )->() ){
        DispatchQueue.global().async {
            sleep(2)
            var dummyData: [Data] = [Data]()
            for i in 0...100{
                if i == 0 {
                    dummyData.append(Data(imageURL: "https://image.com", productTitle: "RedPanda", productPrice: 1500, productDesc: "The red panda, also known as the lesser panda, is a small mammal native to the eastern Himalayas and southwestern China. It has dense reddish-brown fur with a black belly and legs, white-lined ears, a mostly white muzzle and a ringed tail"))
                }
                else if i == 1 {
                    dummyData.append(Data(imageURL: "https://image.com", productTitle: "Polar bear", productPrice: 2000, productDesc: "The polar bear is a hypercarnivorous bear whose native range lies largely within the Arctic Circle, encompassing the Arctic Ocean, its surrounding seas and surrounding land masses. It is the largest extant bear species, as well as the largest extant land carnivore"))
                }
                else if i == 2 {
                    dummyData.append(Data(imageURL: "https://image.com", productTitle: "Bear", productPrice: 2500, productDesc: "Bears are carnivoran mammals of the family Ursidae. They are classified as caniforms, or doglike carnivorans. Although only eight species of bears are extant, they are widespread, appearing in a wide variety of habitats throughout the Northern Hemisphere and partially in the Southern Hemisphere."))
                } else {
                    dummyData.append(Data(imageURL: "https://image.com", productTitle: "New Panda", productPrice: 150, productDesc: "This is automatic generated dataa.."))
                }
                

                //dummyData.append(Data(title: "This is a title \(i)", subTitle: "This is a subtitle"))
            }
            complete(true, dummyData)
            // If server gives an error, use "complete(false, nil)"
        }
    }
}
