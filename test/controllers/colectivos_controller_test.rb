require "test_helper"

class ColectivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @colectivo = colectivos(:one)
  end

  test "should get index" do
    get colectivos_url, as: :json
    assert_response :success
  end

  test "should create colectivo" do
    assert_difference("Colectivo.count") do
      post colectivos_url, params: { colectivo: { isAccesible: @colectivo.isAccesible, isFavorito: @colectivo.isFavorito, lat: @colectivo.lat, long: @colectivo.long, nombre: @colectivo.nombre } }, as: :json
    end

    assert_response :created
  end

  test "should show colectivo" do
    get colectivo_url(@colectivo), as: :json
    assert_response :success
  end

  test "should update colectivo" do
    patch colectivo_url(@colectivo), params: { colectivo: { isAccesible: @colectivo.isAccesible, isFavorito: @colectivo.isFavorito, lat: @colectivo.lat, long: @colectivo.long, nombre: @colectivo.nombre } }, as: :json
    assert_response :success
  end

  test "should destroy colectivo" do
    assert_difference("Colectivo.count", -1) do
      delete colectivo_url(@colectivo), as: :json
    end

    assert_response :no_content
  end
end
