# SwipeDeleteBug
Project showing a possible UIKit bug in swipe-to-delete/setEditing in iOS 11.

Instructions:
1. Run this project in Xcode 9 beta 1 (9M136h).
2. Run on iPhone 7 simulator or an iPhone running iOS 11 beta 1 (15A5278f).
3. Add a line of text using the "+" button.
4. Swipe-to-delete the line of text. The application crashes with a UITableView assertion error.
5. Follow the same instructions on an iPhone running iOS 10.3.2 (14F89), where the error does not occur.
