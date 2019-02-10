class Place < ActiveRecord::Base
  include JpPrefecture
  jp_prefecture :prefecture_code
end
