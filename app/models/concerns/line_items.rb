module LineItems
  extend ActiveSupport::Concern

  TAX_RATE = 0.08

  included do
    has_many :line_items, dependent: :destroy

    def total_price
      line_items.to_a.sum(&:total_price)
    end

    def total_items
      line_items.to_a.sum(&:quantity)
    end

    # FIXME: CartとOrderの分け方がなんかスッキリしない

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

    def billing_tax
      (billing_amount * TAX_RATE.to_r).floor
    end

    def billing_amount
      total_price + delivery_charge + cod_fee
    end

    def billing_amount_with_tax
      billing_amount + billing_tax
    end
  end
end
