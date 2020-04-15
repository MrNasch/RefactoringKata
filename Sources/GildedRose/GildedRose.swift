// start 18:00 pause 18:13
// start again at 21:26

public class GildedRose {
    
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
                updateConjured(item: item)
            default:
                break
            }
        }
    }
    
    // check Dexterity vest sellIn and decrease by 1 if > 0 and by 2 < 0
    func updateDexterityVestQuality(item: Item) {
        if item.sellIn > 0 {
            item.quality -= 1
        } else {
            item.quality -= 2
        }
        
        checkQuality(item: item)
        
        item.sellIn -= 1
    }
    
    // check Aged Brie sellIn increase quality by 1
    func updateAgedBrie(item: Item) {
        if item.sellIn > 0 {
            item.quality += 1
        }
        
        checkQuality(item: item)

        item.sellIn -= 1
    }
    
    // check Elixir of de mngoose sellIn and decrease by 1 then by 2 after the date
    func updateElixirOfMongoose(item: Item) {
        if item.sellIn > 0 {
            item.quality -= 1
        } else {
            item.quality -= 2
        }
        
        checkQuality(item: item)
        
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
        
        checkQuality(item: item)
        
        item.sellIn -= 1
    }
    
    // check conjured and decrease quality by 2 and by 4 after date
    func updateConjured(item: Item) {
        if item.sellIn > 0 {
            item.quality -= 2
        } else {
            item.quality -= 4
        }
        
        checkQuality(item: item)
        
        item.sellIn -= 1
    }
    
    // check max quality
    func checkQuality(item: Item) {
        if item.quality > maxQuality {
            item.quality = maxQuality
        }
    }
}
