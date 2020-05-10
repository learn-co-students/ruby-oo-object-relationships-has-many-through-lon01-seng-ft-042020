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
  
    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end
  
    # returns an Array of Meal instances associated with this waiter 
    def meals
      Meal.all.select do |meal|
        meal.waiter == self #checking for waiter now
      end
    end
  
    # returns the Customer instance associated with the meal that received the largest tip 
    def best_tipper
        best_tipped_meal = meals.max_by {|meal| meal.tip}
        best_tipped_meal.customer
    end
    
  end