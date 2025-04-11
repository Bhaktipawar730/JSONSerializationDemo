import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var url: URL?
    var urlRequest: URLRequest?
    var urlSession: URLSession?
    
    var model: [Model] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        jsonSerialization()
    }
    
    private func jsonSerialization() {
        url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        urlRequest = URLRequest(url: url!)
        urlRequest?.httpMethod = "GET"
        urlSession = URLSession(configuration: .default)

        let urlSessionDataTask = urlSession?.dataTask(with: urlRequest!) { data, response, error in
            print(data ?? "No Data")
            print(response ?? "No Response")
            print(error ?? "No Error")

            do {
                if let jsonData = data {
                    let apiResponse = try JSONSerialization.jsonObject(with: jsonData) as? [[String: Any]]
                    print(apiResponse ?? "Empty")

                    if let response = apiResponse {
                        for item in response {
                            let userId = item["userId"] as? Int ?? 0
                            let id = item["id"] as? Int ?? 0
                            let title = item["title"] as? String ?? ""
                            let body = item["body"] as? String ?? ""
                            
                            let post = Model(userId: userId, id: id, title: title, body: body)
                            self.model.append(post)
                        }
                    }

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        urlSessionDataTask?.resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.useridLabel.text = "UserId = \(model[indexPath.row].userId)"
        cell.idLabel.text = "Id = \(model[indexPath.row].id)"
        cell.titleLabel.text = "Title = \(model[indexPath.row].title)"
        cell.bodyLabel.text = "Body = \(model[indexPath.row].body)"

        
        
        return cell
    }
}
