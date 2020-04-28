class Waiter
    attr_accessor :name, :yrs_experience
 
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal(customer,total,tip)
      Meal.new(self, customer, total, tip)
    end

    def meals
      Meal.all.select {|m| m.waiter == self}
    end
    
    def best_tipper
      top_tip = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
      top_tip.customer
    end
end