class StockpilesController < ApplicationController
    def index
        stockpiles = Stockpile.where(user: current_user)
        render json: stockpiles, include: { projects: {except: []} }
    end
    
    def create
        stockpile = Stockpile.create(name: stockpile_params[:name], user: current_user)
        render json: stockpile, include: { projects: {except: []} }
    end
    
    def update
        stockpile = Stockpile.find_by(id: params[:id])
        project = Project.find_by(id: params[:project_id])
        case params[:update]
        when "add project"
            if stockpile && project && stockpile.user_id == current_user.id && !stockpile.projects.include?(project)
                stockpile.projects << project
                render json: { message: "project added to stockpile" }
            else
                render json: { message: "unable to add project to stockpile" }
            end
        when "remove project"
            if stockpile && project && stockpile.user_id == current_user.id && stockpile.projects.include?(project)
                stockpile.projects.destroy(project)
                render json: { message: "project removed from stockpile" }
            else
                render json: { message: "unable to remove project from stockpile" }
            end
        end
    end
    
    private

    def stockpile_params
        params.permit(:name)
    end
end
