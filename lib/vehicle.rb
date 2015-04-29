require('pry')
class Vehicle
@@vehicles = []

  define_method(:initialize) do |make, model, year|
      @make = make
      @model = model
      @year = year
      @id = @@vehicles.length.+(1)
  end

  define_method(:make) do
    @make
  end

  define_method(:model) do
    @model
  end

  define_method(:id) do
    @id
  end

  define_method(:year) do
    @year
  end

  define_singleton_method(:all) do
    @@vehicles
  end

  define_method(:save) do
    @@vehicles.push(self)
  end

  define_singleton_method(:clear) do
    @@vehicles = []
  end

  define_method(:age) do
    current_time = Time.new.year
    @age = current_time - @year
  end

  define_method(:worth_buying?) do
    american_made = ["Chevy", "Ford", "GM"]
      if american_made.include?(@make) && @age < 15
        true
      else
        false
      end
  end


end
