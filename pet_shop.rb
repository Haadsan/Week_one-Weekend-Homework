def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

# def add_or_remove_cash(pet_shop, cash)
#   return pet_shop[:admin][:total_cash] = pet_shop[:admin][:total_cash] + cash
# end

 def add_or_remove_cash(pet_shop, cash)
  return pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

# def increase_pets_sold(pet_shop, sold)
#   return pet_shop[:admin][:pets_sold] = pet_shop[:admin][:pets_sold] + sold
# end

def increase_pets_sold(pet_shop, sold)
  return pet_shop[:admin][:pets_sold] += sold
end



# Or can use .count  and .legnth
def stock_count(pet_shop)
  return pet_shop[:pets].size
end


def pets_by_breed(pet_shop, breed)
  # empty array
  found = []
  # pet in a petshop data which is pets
  for pet in pet_shop[:pets]
  # if the name i am searching for match with the breed name
    if breed == pet[:breed]
      # adds the 2 found  pets to the empty array
      found << pet
      #   found << pet or found.push
    end
end
  return found
end


def pets_by_breed_not_found(pet_shop, breed)
  found = []
for pet in pet_shop[:pets]
  if breed != pet[:breed]
    found << pet
  end
end
  return not_found
end



def find_pet_by_name(pet_shop, name)

  for pet in pet_shop[:pets]
    if name == pet[:name]
      return pet
    end
  end
  return nil
end


def remove_pet_by_name(pet_shop, name)
remove_pet = find_pet_by_name(pet_shop, name)
pet_shop[:pets].delete(remove_pet)
end


def add_pet_to_stock(pet_shop, new_pet)
  return pet_shop[:pets].push("Bors the Younger")
end

def customer_cash(customer)
  return customer[:cash]
end


def remove_customer_cash(customer, cash)
  return customer[:cash] -= cash
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  return customer[:pets] << new_pet
end


# def customer_can_afford_pet(customer, new_pet)
# return customer[:cash] > new_pet[:price]
# end
#
# def customer_can_afford_pet_sufficient_funds(customer, new_pet)
# return customer[:cash] < new_pet[:price]
# end

def customer_can_afford_pet(customer, new_pet)
return customer[:cash] >= new_pet[:price]
end



def sell_pet_to_customer(pet_shop, pet, customer)
  # if pet not equal to nil and customer can afford pet equal to true
  if pet != nil && customer_can_afford_pet(customer, pet) == true
 # add pet to customer account
      add_pet_to_customer(customer, pet)
      # increase pet sold to customer by 1
      increase_pets_sold(pet_shop, 1)
      # add cash to the pet_shop till
      add_or_remove_cash(pet_shop, pet[:price])
      # remove cash from customer account
      remove_customer_cash(customer, pet[:price])
      # remove pet from the stock by name
      remove_pet_by_name(pet_shop, pet[:name])


  end
end
