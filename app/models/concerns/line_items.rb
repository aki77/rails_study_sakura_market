module LineItems
  extend ActiveSupport::Concern

  included do
    has_many :line_items, dependent: :destroy

    def total_price
      line_items.to_a.sum(&:total_price)
    end

    def total_items
      line_items.to_a.sum(&:quantity)
    end

    def cod_fee
      case total_price
      when 0...10000
        300
      when 10000...30000
        400
      when 30000...100000
        600
      else
        1000
      end
    end

    def delivery_charge
      total_items.fdiv(5).ceil * 600
    end
  end
end
