class ParadaColectivo < ApplicationRecord
  belongs_to :parada
  belongs_to :colectivo
end
