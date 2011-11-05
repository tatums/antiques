class Measurement < ActiveRecord::Base
  belongs_to :product
        
  validates_presence_of :dimension, :amount, :unit_of_measure
<<<<<<< HEAD
  validate :dimension_exists?, :on => :create
  
  scope :order_by_position, order(:position)
  
  
  
  after_create :set_init_position

  def set_init_position
    product = self.product
    position = product.measurements.size
    update_attributes(:position => position)
  end

  def self.only_dimension
    all(:select => "dimension").map(&:dimension)  
  end
  
  def dimension_exists?
    d = self.product.measurements.only_dimension
    errors.add(:dimension, 'already exists for this object.') if d.include?(dimension) 
  end
  # def dimension_exists?
  #   d = self.product.measurements.only_dimension
  #   errors.add(:dimension, 'already exists for this object.') if d.include?(dimension) 
  # end

  #validates_exclusion_of :dimension, :in => self.product.measurements.only_dimension
    
=======
  scope :order_by_position, order(:position)
  
  
  after_create :set_init_position

  def set_init_position
    p = self.product
    x = p.measurements.size
    update_attributes(:position => x)
  end
  
>>>>>>> 155df5c196845e601546793c68862416eb7b97e6
  def full_line
    dimension + " " + amount +  unit_of_measure
  end
  
  DIMENSION_SELECT = [
      [ "Height"  , "H"   ],
      [ "Width" , "W"  ] ,
  	  [ "Depth" ,  "D"],
  	  [ "Diameter" ,  "Dia"]
    ]
  UNIT_OF_MEASURE_SELECT = [
        [ "Feet"  , "\'"   ],
        [ "Inches" , "\""  ]
      ]
  
  
end
