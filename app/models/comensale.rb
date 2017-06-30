class Comensale < ActiveRecord::Base

	
	
	validates :mail, :presence => {:message => "Debe ingresar su email"}
	validates :tipo_comensal, :presence => {:message => "Debe ingresar el Tipo de Comensal"}
	
	validates :cantidad, :presence => {:message => "Debe ingresar la cantidad de Comensales"}


	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |comensale|
				csv << Comensale.attributes.values_at(*column_mail)
			end
		end
	end

end
