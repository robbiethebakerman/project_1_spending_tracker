class Budget

  attr_reader :id
  attr_accessor :type, :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
    @amount = options['amount'] if options['amount']
  end

end
