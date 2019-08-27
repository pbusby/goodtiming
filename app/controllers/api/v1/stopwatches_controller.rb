module Api
    module V1
        class StopwatchesController < ApplicationController

            def index
                stopwatches = Stopwatches.all
            end

            def show
            end

            def create
            end

            def destroy
            end

            def update
            end

            private

            def stopwatch_params
            end

        end
    end
end