class HeroPowersController < ApplicationController
    def create 
        hero_power = HeroPower.create!(hero_power_params)
        if hero_power
            render json: hero_power, status: :created
        else 
            render json: {message: "validation errors"}, status: 404
        end

    end

    def hero_power_params
        params.permit(:strength, :power_id, :hero_id)
    end

end
