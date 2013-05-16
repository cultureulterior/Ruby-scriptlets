def safe_from(*ex)
  return lambda { |&save| begin save.call rescue ex end }
end

safe = safe_from(ArgumentError,EncodingError)

safe.call { raise ArgumentError }
