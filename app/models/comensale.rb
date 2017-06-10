class Comensale < ActiveRecord::Base

	validates :id_legajo, :presence => {:message => "Debe ingresar su número de legajo"}
	validates :mail, :presence => {:message => "Debe ingresar su email"}
	validates :tipo_comensal, :presence => {:message => "Debe ingresar el Tipo de Comensal"}
	validates :id_legajo, :presence => {:message => "Debe ingresar el número de legajo"}
	validates :cantidad, :presence => {:message => "Debe ingresar la cantidad de Comensales"}

end
