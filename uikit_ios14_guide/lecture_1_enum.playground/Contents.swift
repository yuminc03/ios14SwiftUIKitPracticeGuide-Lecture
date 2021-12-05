import UIKit


//Enumerations

//enum
//타입분류

//도서관 -> 항목 -> 소설, 문제집, 만화책, 수필...

//분류만 하고 싶다. + 값
enum BookType {
    case fiction(title: String, price: Int, year: Int)
    case comics(title: String, price: Int, year: Int)
    case workbook(title: String, price: Int, year: Int)
}

extension BookType {
    var typeName: String {
        switch self {
        case .comics:
            return "comics"
        case .fiction:
            return "fiction"
        case .workbook:
            return "workbook"
        }
    }
}

var bookType: BookType?
var books = [BookType]()

func saveBook(book: BookType) {
//    switch book {
//    case .comics:
//        books.append(book)
//    case .fiction:
//        books.append(book)
//    default:
//        books.append(book)
//    }
    books.append(book)
}

saveBook(book: .comics(title: "aaa", price: 6000, year: 2020))
saveBook(book: .comics(title: "bbb", price: 5000, year: 2018))
saveBook(book: .comics(title: "ccc", price: 7500, year: 2017))
saveBook(book: .fiction(title: "ddd", price: 10000, year: 2021))
saveBook(book: .fiction(title: "eee", price: 12000, year: 2016))
saveBook(book: .workbook(title: "fff", price: 8500, year: 2014))

for book in books {
    
    if case let BookType.comics(title, _, _) = book {
        print(title, book.typeName)
    }
    
    if case let BookType.fiction(title, _, _) = book {
        print(title, book.typeName)
    }
    
    if case let BookType.workbook(title, _, _) = book {
        print(title, book.typeName)
    }
    
//    switch book {
//    case let .comics(_, price, _):
//        print(price)
//
//    case let .fiction(title, _, _):
//        print(title)
//    default:
//        break
//    }
}
