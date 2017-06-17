class Comensale < ActiveRecord::Base

	
	
	validates :mail, :presence => {:message => "Debe ingresar su email"}
	validates :tipo_comensal, :presence => {:message => "Debe ingresar el Tipo de Comensal"}
	
	validates :cantidad, :presence => {:message => "Debe ingresar la cantidad de Comensales"}

end
