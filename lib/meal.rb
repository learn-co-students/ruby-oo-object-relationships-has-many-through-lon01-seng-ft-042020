require_relative "./waiter"
require_relative "./customer"

class Meal

    attr_accessor :waiter, :customer, :total, :tip

    @@all = []

    def initialize(waiter, customer, total, tip=0)
        @waiter = waiter
        @customer = customer
        @tip = tip
        @total = total
        @@all << self
    end

    def self.all
        @@all
    end

end