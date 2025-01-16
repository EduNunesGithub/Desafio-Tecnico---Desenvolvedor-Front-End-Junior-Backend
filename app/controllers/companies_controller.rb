class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update destroy]

  # GET /companies
  def index
    query = Company.ransack(params[:q])
    @companies = query.result.page(params[:page]).per(params[:per_page] || 10)

    render json: {
      companies: @companies,
      meta: api_metadata(@companies)
    }, status: :ok
  end

  # GET /companies/:id
  def show
    render json: @company, status: :ok
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /companies/:id
  def update
    if @company.update(company_params)
      render json: @company, status: :ok
    else
      render json: { errors: @company.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /companies/:id
  def destroy
    @company.destroy
    head :no_content
  end

  private

  def set_company
    @company = Company.find_by(id: params[:id])
    return @company if @company.present?

    render json: { error: 'Company not found' }, status: :not_found
  end

  def company_params
    params.require(:company).permit(:address, :cnpj, :company_name, :phone, :whatsapp)
  end
end
