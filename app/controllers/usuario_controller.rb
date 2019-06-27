class UsuarioController < ApplicationController

    def load_atraccions  
      @atraccions_default = Gmaps4rails.build_markers(Atraccion.all) do |plot, marker|  
         marker.lat plot.latitude  
         marker.lng plot.longitude  
		 marker.title plot.nombre_atc
		 
      end  
	end

	def reports
		@atraccion = Atraccion.all
	end

    def generar_reporte
		@atraccion = Atraccion.find(params[:id])

		Caracal::Document.save 'reporteAtraccion.docx' do |docx|
			
			#Tamaño de página 
			docx.page_size do
				width   12240     # page width in twips.
				height  15840     # page height in twips.
			end
	
			#Fijamos los márgenes
			docx.page_margins do
				left    720     # left margin in twips.
				right   720     # right margin in twips.
				top     1440    # top margin in twips.
				bottom  1440    # bottom margin in twips.
			end
	
			#Colocamos el numero de página
			docx.page_numbers true do
				align :right    # accepts :left, :center, and :right.
			end
		
			#Cambiamos la fuente por defecto
			docx.font do
				name 'Droid Serif'
			end
			
			docx.h1 'Detalles de la Atraccion'
			
			docx.img "#{url_for(@atraccion.imagen_atc)}", width: 500, height: 300

			docx.p "Nombre: #{@atraccion.nombre_atc}"
			docx.p "Descripcion: #{@atraccion.descripcion_atc}"
			docx.p "Capacidad: #{@atraccion.capacidad_atc} "

		end #Caracal

		send_file("reporteAtraccion.docx" ,
			:filename      =>  "reporteAtraccion.docx",
			:type          =>  'application/msword')
		
	end

    def map
      load_atraccions
  
      @atraccions = Atraccion.all
	end

end
