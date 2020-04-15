// start 18:00 pause 18:13
// start again at 21:26

public class GildedRose {
    
    let minQuality = 0
    let maxQuality = 50
    
    var items:[Item]
    
    public init(items:[Item]) {
        self.items = items
    }
    
    // update Quality
    public func updateQuality() {
        for item in items {
            
            // swich on all item name
            switch item.name {
            case "+5 Dexterity Vest":
                print("quality -1")
            case "Aged Brie":
                print("quality +1")
            case "Elixir of the Mongoose":
                print("quality -1")
            case "Sulfuras, Hand of Ragnaros":
                print("nothing change")
            case "Backstage passes to a TAFKAL80ETC concert":
                print("quality +1 if more than 10 days +2 between 10 and 6 and + 3 between 5 and 0 then 0 after the show")
            case "Conjured Mana Cake":
                print("quality -2  and -4 when after the date")
            default:
                break
            }
            
            
            
//            if (items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
//                if (items[i].quality > 0) {
//                    if (items[i].name != "Sulfuras, Hand of Ragnaros") {
//                        items[i].quality -= 1
//                    }
//                }
//            } else {
//                if (items[i].quality < 50) {
//                    items[i].quality += 1
//
//                    if (items[i].name == "Backstage passes to a TAFKAL80ETC concert") {
//                        if (items[i].sellIn < 11) {
//                            if (items[i].quality < 50) {
//                                items[i].quality += 1
//                            }
//                        }
//
//                        if (items[i].sellIn < 6) {
//                            if (items[i].quality < 50) {
//                                items[i].quality += 1
//                            }
//                        }
//                    }
//                }
//            }
//
//            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
//                items[i].sellIn -= 1
//            }
//
//            if (items[i].sellIn < 0) {
//                if (items[i].name != "Aged Brie") {
//                    if (items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
//                        if (items[i].quality > 0) {
//                            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
//                                items[i].quality -= 1
//                            }
//                        }
//                    } else {
//                        items[i].quality -= items[i].quality
//                    }
//                } else {
//                    if (items[i].quality < 50) {
//                        items[i].quality += 1
//                    }
//                }
//            }
//        }
    }
}
