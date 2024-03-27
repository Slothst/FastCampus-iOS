//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 최낙주 on 3/11/24.
//

import UIKit

class ChatListViewController: UIViewController {
    
    private var chatList: [Chat] = Chat.list

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        chatList = chatList.sorted { chat1, chat2 in
            return chat1.date > chat2.date
        }
    }
}

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ChatListCollectionViewCell",
            for: indexPath
        ) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
