# Benchmark between
# One40Proof::Test
# One40Proof::Multi::Base

require 'rubygems'
require 'benchmark'
require File.expand_path(File.dirname(__FILE__) + '/../lib/one40_proof/simple')
require File.expand_path(File.dirname(__FILE__) + '/../lib/one40_proof/multi')

n = 10
query = []
n.times { query << {:method => :test} }

Benchmark.bm do |x|
  x.report("Simple") do 
    n.times { One40Proof::Test.new }
  end
  x.report("Multi") do    
    One40Proof::Multi::Base.new(query)
  end
end