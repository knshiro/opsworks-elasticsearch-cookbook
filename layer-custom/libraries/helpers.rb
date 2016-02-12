module ElasticsearchOpsWorksCookbook
  module Helpers
    def self.flat_hash(hash, k = '')
      return {k => hash} unless hash.is_a?(Hash)
      hash.inject({}){ |h, v| h.merge! flat_hash(v[-1], (!k.empty? ? (k + '.') : '') + v[0].to_s) }
    end
  end
end
