class Measurement < ActiveRecord::Base
  belongs_to :product
        
  validates_presence_of :dimension, :amount, :unit_of_measure
  scope :order_by_position, order(:position)
  
  
  after_create :set_init_position

  def set_init_position
    p = self.product
    x = p.measurements.size
    update_attributes(:position => x)
  end
  
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
