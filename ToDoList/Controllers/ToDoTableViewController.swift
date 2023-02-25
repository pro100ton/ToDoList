//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Антон Шалимов on 19.02.2023.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    // MARK: Properties
    /// Объявляем переменную, которая будет менеджить список тудушек
    var toDos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Следующий код проверяет есть ли тудушки в базе
        /// Если есть то он их загружает, если нет - генерирует dummy данные
        if let savedToDos = ToDo.loadToDos() {
            self.toDos = savedToDos
        } else {
            self.toDos = ToDo.loadSampleToDos()
        }
       
        /// Включение "Умного" режима редактирования для таблицы. При его нажатии появляется интерфейс удаления
        /// элементов таблицы
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    override func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Объявляем объект типа "клетка" для каждой клетки в таблице
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "ToDoCellIdentifier",
                for: indexPath)
            
            // Достаем текущее значение тудушки в соответствии с номером
            let currentToDo = toDos[indexPath.row]
            
            // Производим ее конфигурацию
            var content = cell.defaultContentConfiguration()
            content.text = currentToDo.title
            
            // Устанавливаем это конфигурацию клетке
            cell.contentConfiguration = content
            
            // Возвращаем клетку
            return cell
        }
    
    // Override to support conditional editing of the table view.
    override func tableView( _ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Так как все клетки должны иметь возможность редактирования, то просто возвращаем `true`
        return true
    }
    
    /// Перегружаем метод `commit:forRowAt` чтобы можно было свайпом удалять объекты таблицы
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    // MARK: Segues
    /// Unwind method to allow different scenes to navigate back to ToDo list table
    /// - Parameter segue: Any segue can trigger that action
    @IBAction func unwindToToDoList(segue: UIStoryboardSegue) {
        
    }
}
