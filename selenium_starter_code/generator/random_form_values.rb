require 'faker'

class RandomFormValues
  include Faker

  def generate_first_name
    @first_name = Faker::BackToTheFuture.character
  end

  def generate_last_name
    @last_name = Faker::DrWho.character
  end

  def generate_

  end

end
