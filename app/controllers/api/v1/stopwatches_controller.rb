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
                @stopwatch = Stopwatch.new(stopwatch_params)
                if @stopwatch.save
                    render json: {status: 'ok', message: 'new watch saved to DB!', data: @stopwatch}, status: :ok
                else
                    render json: {status: 'error', message: 'watch failed to save to DB :('}
                end
            end

            def destroy
                @stopwatch = Stopwatch.find(params[:id])
                @stopwatch.destroy
                render json: {status: 'ok', message: 'deleted watch!', data: @stopwatch }, status: :ok
            end

            def update
                @stopwatch = Stopwatch.find(params[:id])
                @stopwatch.update(stopwatch_params)
                render json: {status: 'ok', message: 'watch updated in DB!', data: @stopwatch}, status: :ok
            end

            private

            def stopwatch_params
                params.permit(:id, :name, :description, :total_time)
            end

        end
    end
end