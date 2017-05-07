class ProductsController < ApplicationController
	def index
		@sections = ['Desayunos', 'Comidas', 'Cenas', 'Bebidas']
		@sort_options = [{
	      name: "Nombre A-Z",
	      value: "name asc"
	    }, {
	      name: "Precio de menor a mayor",
	      value: "price asc"
	    }, {
	      name: "Precio de mayor a menor",
	      value: "price desc"
	    }, {
	      name: "Con mayor visitas",
	      value: "views desc"
	    }];
	    @curr_section = params[:section] ? params[:section] : @sections[0];
	    @curr_sort = params[:sort_by];
	    @key_word = params[:key_word];

	    @products = Product.by_section(@curr_section).by_name(@key_word).order(@curr_sort);
	end

	def show
		@product = Product.find(params[:id])
		@product.increment!(:views)
	end
end
