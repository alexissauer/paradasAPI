require "test_helper"

class ParadasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parada = paradas(:one)
  end

  test "should get index" do
    get paradas_url, as: :json
    assert_response :success
  end

  test "should create parada" do
    assert_difference("Parada.count") do
      post paradas_url, params: { parada: { isFavorito: @parada.isFavorito, lat: @parada.lat, long: @parada.long, nombre: @parada.nombre } }, as: :json
    end

    assert_response :created
  end

  test "should show parada" do
    get parada_url(@parada), as: :json
    assert_response :success
  end

  test "should update parada" do
    patch parada_url(@parada), params: { parada: { isFavorito: @parada.isFavorito, lat: @parada.lat, long: @parada.long, nombre: @parada.nombre } }, as: :json
    assert_response :success
  end

  test "should destroy parada" do
    assert_difference("Parada.count", -1) do
      delete parada_url(@parada), as: :json
    end

    assert_response :no_content
  end
end
