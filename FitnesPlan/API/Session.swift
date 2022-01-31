//
//  Session.swift
//  FitnesPlan
//
//  Created by Oschepkov Aleksandr on 30.01.2022.
//

final class Session{
    
    private init(){} //  Закрываем инит
    
    static let shared = Session() // Мы переиспользуем один и тот же объект
    
    var token: String = "" //Token VK
    var userId: Int = 0    //ID пользователя
    var userProfile: UserProfile?
}
