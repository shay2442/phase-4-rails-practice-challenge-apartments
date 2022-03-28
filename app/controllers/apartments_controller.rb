class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartment
    end

    def show
        apartment = Apartment.find_by(id: params[:id])
        render json: apartment
    end
    
    def create
        apartment = Apartment.create(apartment_params)
        if apartment
            render json: apartment, status: :created
        else 
           byebug
            render json: "Not created", status: :unprocessable_entity
        end

        def updated
            apartment = Apartment.find_by(id: params[:id])
            if apartment
                render json: apartment, status: :ok
            else
                render json: {error: @apartment.errors.full_messages}
            end
        end
        
    end



    private 

    def apartment_params
        params.permit(:number)
    end
end
