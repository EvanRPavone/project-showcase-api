class ProjectsController < ApplicationController
    def create 
        Project.create(project_params)
        render json: { message: 'project saved'}
    end
    
    def index
        projects = Project.all 
        render json: projects
    end
    
    private

    def project_params
        params.require(:project).permit(:title, 
        :description, 
        :language, 
        :githubUrl, 
        :videoUrl)
    end
end
