class AddressesController < ApplicationController

    def index()
      @cart = Cart.find_by(user:current_user)
    end 
    
    def create()
        @address = Address.new(zip_code: params[:zip_code], city_name: params[:city_name], address_name: params[:address_name])
        if @address.save
            UserAddress.create(user: current_user, address: @address)
            redirect_back(fallback_location: root_path)
            flash[:success] = "L'adresse a bien été enregistrée"
        else
            redirect_back(fallback_location: root_path)
            flash[:error] = "Une erreur a été détectée : #{@type_offer.errors.full_messages.join(",")}"
        end
    end

    def update
        @address = Address.find(params[:id])
        @user = current_user
        if @address.update(zip_code: params[:address][:zip_code], city_name: params[:address][:city_name], address_name: params[:address][:address_name])
          redirect_back(fallback_location: root_path)
          flash[:success] = "L'adresse a bien été modifiée"
        else
            redirect_back(fallback_location: root_path)
          flash[:error] = "Une erreur a été détectée : #{@offer.errors.full_messages.join(",")}"
        end
      end
     
    def edit()
        @address = Address.find(params[:id])
    end  

    def destroy
        id = params[:id]
        @address = Address.find(id)
        @user_address = UserAddress.find_by(user: current_user, address: @address)
        @user_address.destroy
        @address.destroy
        redirect_back(fallback_location: root_path)
        flash[:success] = "L'adresse a bien été supprimée"
      end
end
