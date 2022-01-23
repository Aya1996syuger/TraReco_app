class Relationship < ApplicationRecord
   belongs_to :customer
  belongs_to :follower, class_name: 'Customer'
  
  def follow(other_customer)
    return if self == other_customer

    relationships.find_or_create_by!(follower: other_customer)
  end

  def following?(customer)
    followings.include?(customer)
  end

  def unfollow(relathinoship_id)
    relationships.find(relathinoship_id).destroy!
  end

  

end
