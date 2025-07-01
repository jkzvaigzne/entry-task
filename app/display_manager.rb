require_relative 'transaction_processor'

class DisplayManager
  include TransactionFormattable

  def initialize(transaction_processor)
    @transaction_processor = transaction_processor
  end

  def format_product_list(products)
    product_list = "Available Products:"
    products.each do |code, product|
      product_list += "\n #{code} - #{product[:name]} - #{product[:price]}"
    end
    product_list;
  end

  def format_transaction_result(product_name, change)
    basic_result = "Dispensed #{product_name} with change #{change}"
    last_transaction = @transaction_processor.last_transaction_details

    "#{basic_result}\n Transaction details: #{last_transaction}"
  end
end
