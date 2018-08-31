module PostsHelper
	def form_title
	    @posting.new_record? ?  "Nuevo Post" : "Editar Post"
	end

	def form_button
		@posting.new_record? ?  "Crear Post" : "Actualizar Post"
	end

	def form_controller
		@posting.new_record? ?  "create" : "update"
	end
end
