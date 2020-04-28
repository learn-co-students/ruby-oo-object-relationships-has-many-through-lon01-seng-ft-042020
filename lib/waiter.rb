class Waiter

    attr_accessor :name, :years_of_experience

    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        Meal.all.max_by{|meal| meal.tip}
    end

    def best_tipper
        top_tip = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}
        top_tip.customer
    end




end