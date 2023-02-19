//
//  ToDo.swift
//  ToDoList
//
//  Created by Антон Шалимов on 19.02.2023.
//

import Foundation

struct ToDo: Equatable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    
    /// Редекларация метода протокола `==` для того, чтобы обозначить что тудушки равны
    /// в случае если их `id` совпадают
    /// - Parameters:
    ///   - lhs: Первый экземпляр для сравнения
    ///   - rhs: Второй экземпляр для сравнения
    /// - Returns: `True` если `id` совпадают
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    // TODO: Добавить имплементацию метода загрузки тудушек
    /// Статический метод для загрузки тудушек
    /// - Returns: пока ничего, позже добавлю имплементацию
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    /// Static method for generation dummy data with list of ToDo's as started point of an app
    /// - Returns: [List] of 3 ToDo's items
    static func loadSampleToDos() -> [ToDo] {
        return [
            ToDo(title: "Wash dishes",
                 isComplete: false,
                 dueDate: Date(),
                 notes: "Need to do it ASAP"),
            ToDo(title: "Do homework",
                 isComplete: false,
                 dueDate: Date(),
                 notes: "Maybe after two games of APEX :)"),
            ToDo(title: "Visit dentist",
                 isComplete: false,
                 dueDate: Date(),
                 notes: "Better be sooner that later")
        ]
    }
}
