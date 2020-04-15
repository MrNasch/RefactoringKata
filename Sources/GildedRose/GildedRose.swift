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
                updateDexterityVestQuality(item: item)
            case "Aged Brie":
                updateAgedBrie(item: item)
            case "Elixir of the Mongoose":
                updateElixirOfMongoose(item: item)
            case "Sulfuras, Hand of Ragnaros":
                updateSulfuras(item: item)
            case "Backstage passes to a TAFKAL80ETC concert":
                updateBackstage(item: item)
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
        }
    }
    
    // check Dexterity vest sellIn and decrease by 1 if > 0 and by 2 < 0
    func updateDexterityVestQuality(item: Item) {
        if item.sellIn > 0 {
            item.quality -= 1
        } else {
            item.quality -= 2
        }
        
        item.sellIn -= 1
    }
    
    // check Aged Brie sellIn increase quality by 1
    func updateAgedBrie(item: Item) {
        if item.sellIn > 0 {
            item.quality += 1
        }

        item.sellIn -= 1
    }
    
    // check Elixir of de mngoose sellIn and decrease by 1 then by 2 after the date
    func updateElixirOfMongoose(item: Item) {
        if item.sellIn > 0 {
            item.quality -= 1
        } else {
            item.quality -= 2
        }
        
        item.sellIn -= 1
    }
    
    // Sulfuras stay at 80 quality all the time
    func updateSulfuras(item: Item) {
        item.quality = 80
    }
    
    // check backstage increase quality and drop after event
    func updateBackstage(item: Item) {
        if item.sellIn > 10 {
            item.quality += 1
        } else if item.sellIn <= 10 && item.sellIn > 5 {
            item.quality += 2
        } else if item.sellIn <= 5 && item.sellIn > 0 {
            item.quality += 3
        } else if item.sellIn <= 0 {
            item.quality = 0
        }
        
        item.sellIn -= 1
    }
}
