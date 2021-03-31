json.array! @flats do |flat|
  json.extract! flat, :id, :name, :address
end
