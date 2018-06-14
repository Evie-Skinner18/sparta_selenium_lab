require 'faker'

class RandomFormValues
  include Faker

  def generate_first_name
    @first_name = Faker::BackToTheFuture.character
  end

  def generate_last_name

  end



end
