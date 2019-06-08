class ProductSerializer

    def self.serialize(product)
        out = '{'
        out += '"id": "' + product.id.to_s + '", ' 
        out += '"name": "' + product.name + '", ' 
        out += '"price": "' + product.price.to_s + '", ' 
        out += '"inventory": ' + product.inventory.to_s + ', ' 
        out += '"description": "' + product.description + '"'
        out += '}'
    end

end