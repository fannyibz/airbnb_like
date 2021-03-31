json.array! @flats do |flat|
  json.extract! flat, :id, :name, :address, :description, :tag_list
end
