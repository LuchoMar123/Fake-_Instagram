import Foundation

class ProfileViewModel {
    
    let URL_API = "https://dummyapi.io/data/v1/user/60d0fe4f5311236168a109ca"
    let appId = "626c31c5df0af1efad6b2d4c"
    var profileDetail: Profile? = nil
    
    func getDataFromApi() async {
        do {
            guard let url = URL(string: URL_API) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue(appId, forHTTPHeaderField: "app-id")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            if let decoder = try? JSONDecoder().decode(Profile.self, from: data) {
                DispatchQueue.main.async(execute: {
                    self.profileDetail = decoder
                })
            }
        } catch {
            print("error")
        }
    }
    
}
	
	
