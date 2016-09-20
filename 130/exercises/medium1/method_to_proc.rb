def convert_to_base_8(n)
  n.to_i.to_s(8)
end

converter = method("convert_to_base_8")
p converter.call("10")

# p [8,10,12,14,33].map(&converter)
