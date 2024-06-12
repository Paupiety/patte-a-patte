class AddressesController < ApplicationController
    def create()
        @address = Address.new(zip_code: params[:zip_code], city_name: [:city_name], address_name: [:address_name])
        if @address.save
            UserAddress.create(user: current_user, address: @address)
            redirect_back(fallback_location: root_path)
            flash[:success] = "L'adresse a bien été enregistrée"
        else
            redirect_back(fallback_location: root_path)
            flash[:error] = "Une erreur a été détectée : #{@type_offer.errors.full_messages.join(",")}"
        end
    end

    def destroy
        id = params[:adress_id]
        @address = Address.find(id)
        @address.destroy
        @user_address = UserAddress.find_by(user: current_user, address: @address)
        @user_address.destroy
        redirect_back(fallback_location: root_path)
        flash[:success] = "L'adresse a bien été supprimée"
      end
end
