class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '生産者' },
    { id: 3, name: '消費者' }
  ]

  include ActiveHash::Associations
  has_many :users

end
