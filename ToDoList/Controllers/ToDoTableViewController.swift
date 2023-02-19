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
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
