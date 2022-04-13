//
//  ViewModel.swift
//  RandomUserWithCombine
//
//  Created by Sy Lee on 2022/04/12.
//

import Foundation
import Alamofire
import Combine


class ViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers: [RandomUser] = []
    
    let urlString = "https://randomuser.me/api/?results=50"
    
    init() {
        fetchRandomUsers()
    }
// AF.publishDecodable
//    func fetchRandomUsers() {
//        print(#fileID, #function, #line, "")
//        //파싱할 제이슨데이터 주소 요청
//        AF.request(urlString)
//            //엔티티를 뷰에서 사용할 형태로 디코딩하고 발행
//            .publishDecodable(type: RandomUserResponse.self)
//            //퍼블리쉬 형태를 벗김과 동시에 옵셔널도 벗김
//            .compactMap{ $0.value }
//            //RandomUserResponse 에서 results(랜덤유저 배열)만 뽑아냄
//            .map{ $0.results }
//            //구독: 랜덤유저스 변수에 구독하고 받은 값을 대입
//            .sink(receiveCompletion: {completion in print("데이터 스트림 완료")}
//                  ,receiveValue: { receivedValue in self.randomUsers = receivedValue} )
//            //메모리에서 날려줌
//            .store(in: &subscription)
//    }
    
// URLSession
//    fileprivate func fetchData(from url: URL, compeletion: @escaping (_ data: Data?) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else {
//                return
//            }
//         compeletion(data)
//        } .resume()
//    }
//
//    fileprivate func fetchRandomUsers() {
//        guard let url = URL(string: urlString) else { return }
//        fetchData(from: url) { data in
//            if let unwrappedData = data {
//                guard let decodedData = try? JSONDecoder().decode(RandomUserResponse.self, from: unwrappedData) else { return }
//                let resultsData = decodedData.results
//                DispatchQueue.main.async { [weak self] in
//                    self?.randomUsers = resultsData
//                }
//            } else {
//                print("No data returned.")
//            }
//        }
//    }

// Combine
    func fetchRandomUsers() {
        guard let url = URL(string: urlString) else {return}

        URLSession.shared
            .dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { output in
                return output.data
            }
            .decode(type: RandomUserResponse.self, decoder: JSONDecoder())
            .sink { completion in
                print("completion: \(completion)")
            } receiveValue: {[weak self] response in
                self?.randomUsers = response.results
            }
            .store(in: &subscription)
    }
            
    
}
