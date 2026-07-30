class CarsController < ApplicationController
    def index
        valid_columns = {
            "id" => "cars.id",
            "brand" => "brand",
            "name" => "name",
            "year" => "year",
            "count" => "COUNT(reservations.id)"
        }

        sort_key = valid_columns.key?(params[:sort]) ? params[:sort] : "id"
        sort_column = valid_columns[sort_key]
        sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"

        # 1. Capture the filter parameters from the view
        @brand_filter = params[:filter_brand]
        @name_filter = params[:filter_name]

        # 2. Start the query
        @cars = Car.left_joins(:reservations)
        
        # 3. Apply filters if the user typed something in the search boxes
        @cars = @cars.where("brand LIKE ?", "%#{@brand_filter}%") if @brand_filter.present?
        @cars = @cars.where("name LIKE ?", "%#{@name_filter}%") if @name_filter.present?
        
        # 4. Finish the query with the missing dot before .group!
        @cars = @cars.group('cars.id')
                     .order("#{sort_column} #{sort_direction}")
    end

    def show
        @car = Car.find(params[:id])
        @reservations = @car.reservations.includes(:user)
    end

    def new
        @car = Car.new
    end

    def create
        existing_car = Car.find_by(
        brand: car_params[:brand], 
        name: car_params[:name], 
        year: car_params[:year]
        )

        if existing_car
            amount_to_add = car_params[:count].to_i > 0 ? car_params[:count].to_i : 1
            existing_car.increment!(:count, amount_to_add)
            redirect_to cars_path, notice: "Auto je již v systému, počet aut byl zvýšen +#{amount_to_add}."
        else
            @car = Car.new(car_params)
            @car.count = 1 if @car.count.blank? || @car.count == 0

            if @car.save
                redirect_to cars_path, notice: "Nové auto bylo úspěšně přidáno."
            else
                render :new, status: :unprocessable_entity
            end
        end
    end

    def car_params
        params.require(:car).permit(:brand, :name, :year, :count)
    end

    def edit
        @car = Car.find(params[:id])
    end

    def update
        @car = Car.find(params[:id])
        if @car.update(car_params)
            redirect_to car_path(@car), notice: 'Auto bylo úspěšně aktualizováno.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @car = Car.find(params[:id])

        if @car.destroy
            redirect_to cars_path, notice: 'Auto bylo úspěšně odstraněno.'
        else
            redirect_to @car, alert: "Nelze smazat auto, které má evidované rezervace."
        end
    end
end