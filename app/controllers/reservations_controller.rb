class ReservationsController < ApplicationController
    def index
        valid_columns = {
            "id"         => "reservations.id",
            "customer"   => "users.name",
            "car"        => "cars.brand",
            "start_date" => "reservations.start_date",
            "end_date"   => "reservations.end_date"
        }

        sort_key = valid_columns.key?(params[:sort]) ? params[:sort] : "id"
        sort_column = valid_columns[sort_key]
        sort_direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"

        unless params.has_key?(:filter_start_date)
            @start_date = params[:filter_start_date].presence
        else
            @start_date = params[:filter_start_date].presence
        end

        @end_date = params[:filter_end_date].presence

        #like a dictionary - sort by user/car name (look it up knowing only id)
        @reservations = Reservation.joins(:user, :car).order("#{sort_column} #{sort_direction}")

        if @start_date.present?
            @reservations = @reservations.where("reservations.end_date >= ?", @start_date)
        end
        
        if @end_date.present?
            @reservations = @reservations.where("reservations.start_date <= ?", @end_date)
        end
    end


    def show
        @reservation = Reservation.find(params[:id])
    end

    def new
    @reservation = Reservation.new
    
    if params[:user_id].present?
        @reservation.user_id = params[:user_id]
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save
            redirect_to @reservation, notice: 'Rezervace byla úspěšně vytvořena.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def reservation_params
        params.require(:reservation).permit(:user_id, :car_id, :start_date, :end_date)
    end


    def edit
        @reservation = Reservation.find(params[:id])
    end

    def update
        @reservation = Reservation.find(params[:id])
        
        if @reservation.update(reservation_params)
            redirect_to @reservation, notice: 'Rezervace byla úspěšně upravena.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        
        if params[:source] == 'profile'
            redirect_to user_path(@reservation.user), notice: 'Rezervace byla úspěšně smazána.'
        else
            redirect_to reservations_path, notice: 'Rezervace byla úspěšně smazána.'
        end
    end
end