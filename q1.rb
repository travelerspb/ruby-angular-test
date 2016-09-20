def squish(arr, n = nil)
  return arr if n == 0

  n -= 1 if n.nil?

  arr.each_with_object([]) do |element, flattened|
    flattened.push (element.is_a?(Array) ? squish(element, n) : element)
  end
end
