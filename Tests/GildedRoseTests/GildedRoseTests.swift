@testable import GildedRose
import XCTest

// starting at 17:02 pause at 18:00

class GildedRoseTests: XCTestCase {

    // MARK: average item
    
    func testDexterity_DecreaseQuality_NoError() {
    //Given
        let items = [Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20)]
        let app = GildedRose(items: items);
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 9)
        XCTAssertEqual(app.items.first?.quality, 19)
    }
    
    func testElixirOfTheMongoose_DecreaseQuality_NoError() {
    //Given
        let items = [Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 4)
        XCTAssertEqual(app.items.first?.quality, 6)
    }
    
    // MARK: Item with increase quality
    
    func testAgedBrie_IncreaseQuality_NoError() {
    //Given
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 0)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 1)
        XCTAssertEqual(app.items.first?.quality, 1)
    }
    
    // MARK: Item that never change
    
    func testSulfuras_AllwaysStayTheSame_NoError() {
    //Given
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 0)
        XCTAssertEqual(app.items.first?.quality, 80)
    }
    
    // MARK: Item that increase quality and drop after selling date
    
    func testBackstage_IncreaseQualityMoreThan10Days_NoError() {
    //Given
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 14)
        XCTAssertEqual(app.items.first?.quality, 21)
    }
    
    func testBackstage_IncreaseQualityBetween10And6Days_NoError() {
    //Given
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 9)
        XCTAssertEqual(app.items.first?.quality, 12)
    }
    
    func testBackstage_IncreaseQualityBetween5And1Days_NoError() {
    //Given
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 4)
        XCTAssertEqual(app.items.first?.quality, 13)
    }
    
    func testBackstage_DropQualityWhen0Days_NoError() {
    //Given
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, -1)
        XCTAssertEqual(app.items.first?.quality, 0)
    }
    
    // MARK: Conjured item
    
    func testConjuredManaCake_DecreaseQuality_NoError() {
    //Given
        let items = [Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, 2)
        XCTAssertEqual(app.items.first?.quality, 4)
    }
    
    func testConjuredManaCake_DecreaseQualityTwiceWhen0Days_NoError() {
    //Given
        let items = [Item(name: "Conjured Mana Cake", sellIn: -1, quality: 6)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, -2)
        XCTAssertEqual(app.items.first?.quality, 2)
    }
    
    // MARK: Max and Lowest quality
    
    func testMax_Quality_NoError() {
    //Given
        let items = [Item(name: "Aged Brie", sellIn: -1, quality: 50)]
        let app = GildedRose(items: items)
    //When
        app.updateQuality()
    //Then
        XCTAssertEqual(app.items.first?.sellIn, -2)
        XCTAssertEqual(app.items.first?.quality, 50)
    }
    
    
    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
        return [
            ("testDexterity_DecreaseQuality_NoError", testDexterity_DecreaseQuality_NoError),
            ("testAgedBrie_IncreaseQuality_NoError", testAgedBrie_IncreaseQuality_NoError),
            ("testElixirOfTheMongoose_DecreaseQuality_NoError", testElixirOfTheMongoose_DecreaseQuality_NoError),
            ("testSulfuras_AllwaysStayTheSame_NoError", testSulfuras_AllwaysStayTheSame_NoError),
            ("testBackstage_IncreaseQualityMoreThan10Days_NoError", testBackstage_IncreaseQualityMoreThan10Days_NoError),
            ("testBackstage_IncreaseQualityBetween10And6Days_NoError", testBackstage_IncreaseQualityBetween10And6Days_NoError),
            ("testBackstage_IncreaseQualityBetween5And1Days_NoError", testBackstage_IncreaseQualityBetween5And1Days_NoError),
            ("testConjuredManaCake_DecreaseQuality_NoError", testConjuredManaCake_DecreaseQuality_NoError),
            ("testConjuredManaCake_DecreaseQualityTwiceWhen0Days_NoError", testConjuredManaCake_DecreaseQualityTwiceWhen0Days_NoError),
            ("testMax_Quality_NoError", testMax_Quality_NoError)
        ]
    }
}
