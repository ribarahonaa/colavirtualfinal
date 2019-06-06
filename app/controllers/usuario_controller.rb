class UsuarioController < ApplicationController

    def load_atraccions  
        @atraccions_default = Gmaps4rails.build_markers(Atraccion.all) do |plot, marker|  
           marker.lat plot.latitude  
           marker.lng plot.longitude  
           marker.infowindow render_to_string(:locals => {:nombre_atc => plot.nombre_atc})  
        end  
      end
     
     def map  
        load_atraccions  
     
        @atraccions = Atraccion.all  
     end

end
