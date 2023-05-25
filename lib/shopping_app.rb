require_relative "shopping_app/seller"
require_relative "shopping_app/item"
require_relative "shopping_app/customer"
require_relative "shopping_app/ownable"

seller = Seller.new("DIC Mali")
10.times{ Item.new("CPU", 40830, seller) }
10.times{ Item.new("Mémoire", 13880, seller) }
10.times{ Item.new("Carte mère", 28980, seller) }
10.times{ Item.new("Bloc d'alimentation", 8980, seller) }
10.times{ Item.new("Boîtier PC", 8727, seller) }
10.times{ Item.new("Disque dur 3.5 pouces", 10980, seller) }
10.times{ Item.new("SSD 2.5 pouces", 13370, seller) }
10.times{ Item.new("SSD M.2", 12980, seller) }
10.times{ Item.new("Ventilateur de CPU", 13400, seller) }
10.times{ Item.new("Carte graphique", 23800, seller) }


puts "🤖 Veuillez entrer votre nom"
customer = Customer.new(gets.chomp)

puts "🏧 Veuillez saisir le montant à charger dans votre portefeuille"
customer.wallet.deposit(gets.chomp.to_i)

puts "🛍️ Début des achats"
end_shopping = false
while !end_shopping do
  puts "📜 Liste des produits"
  seller.items_list

  puts "️️⛏ Veuillez entrer le numéro du produit"
  number = gets.to_i

  puts "⛏ Veuillez entrer la quantité"
  quantity = gets.to_i

  items = seller.pick_items(number, quantity)

  items&.each{|item| customer.cart.add(item) }

  puts "🛒 Contenu du panier"
  customer.cart.items_list
  puts "🤑 Montant total : #{customer.cart.total_amount}"

  puts "😭 Voulez-vous terminer vos achats ? (oui/non)"
  end_shopping = gets.chomp == "oui"
end

puts "💸 Confirmez-vous l'achat ? (oui/non)"
customer.cart.check_out if gets.chomp == "oui"

puts "୨୧┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ Résultat ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈୨୧"
puts "️🛍️ Les possessions de #{customer.name}"
customer.items_list
puts "😱👛 Solde du portefeuille de #{customer.name} : #{customer.wallet.balance}"

puts "📦 État des stocks de #{seller.name}"
seller.items_list
puts "😻👛 Solde du portefeuille de #{seller.name} : #{seller.wallet.balance}"

puts "🛒 Contenu du panier"
customer.cart.items_list
puts "🌚 Montant total : #{customer.cart.total_amount}"

puts "🎉 Fin"
