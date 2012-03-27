class Hailwtfornot < ActiveRecord::Base
  paginates_per 4

  def self.create_new params
    hailwtfornot = Hailwtfornot.new(params[:hailwtfornot])

    image1 =  Image.new(params[:image1])
    image2 =  Image.new(params[:image2])

    begin 
      Hailwtfornot.transaction do
        image1.save!
        image2.save!
        hailwtfornot.image1 = image1.id
        hailwtfornot.image2 = image2.id
        hailwtfornot.points = image1.points + image2.points
        hailwtfornot.save!
      end
    rescue ActiveRecord::RecordInvalid
      hailwtfornot.errors.add(:base, image1.errors.full_messages.join(' ')) if image1.errors.any?
      hailwtfornot.errors.add(:base, image2.errors.full_messages.join(' ')) if image2.errors.any?
    end
    hailwtfornot
  end

  #def image1
  #  Image.find(image1) if image1
  #end

  #def image2
  #  Image.find(image2) if image2
  #end
end
