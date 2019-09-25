module Api
    module V1
        class StopwatchesController < ApplicationController

            def index
                @stopwatches = Stopwatch.all
                render json: {status: 'ok', message: 'loaded watches!', data: @stopwatches }, status: :ok

            end

            def show
                @stopwatch = Stopwatch.find(params[:id])
                render json: {status: 'ok', message: 'loaded watch!', data: @stopwatch }, status: :ok
            end

            def create
            end

            def destroy
            end

            def update
            end

            private

            def stopwatch_params
                params.require(:stopwatch).permit(:id, :name, :description, :total_time)
            end

        end
    end
end