module Cryptoexchange::Exchanges
  module Dobitrade
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Dobitrade::Market::API_URL}/quotes"

        def fetch
          output = super
          adapt(output['data'])
        end

        def adapt(output)
          market_pairs = []
          output.each do |value|
              market_pairs << Cryptoexchange::Models::MarketPair.new(
                                base: value['baseAsset'],
                                target: value['quoteAsset'],
                                market: Dobitrade::Market::NAME
                              )
          end
          market_pairs
        end
      end
    end
  end
end
