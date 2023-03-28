class HerosController < ApplicationController
    def index 
        heros = Hero.all
        render json: heros, status: 200
    end

    def show 
        hero = Hero.find_by(id: params[:id])
        if hero 
        render json: hero, serializer: HeroAndPowersSerializer, status: 200
        else 
            render json: {error: 'Hero not found', status: :not_found}
        end
    end

    private 

    def hero_params
        params.permit(:name, :super_name)
    end
end

