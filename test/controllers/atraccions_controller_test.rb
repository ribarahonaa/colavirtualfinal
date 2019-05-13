require 'test_helper'

class AtraccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atraccion = atraccions(:one)
  end

  test "should get index" do
    get atraccions_url
    assert_response :success
  end

  test "should get new" do
    get new_atraccion_url
    assert_response :success
  end

  test "should create atraccion" do
    assert_difference('Atraccion.count') do
      post atraccions_url, params: { atraccion: { capacidad_atc: @atraccion.capacidad_atc, descripcion_atc: @atraccion.descripcion_atc, imagen_atc: @atraccion.imagen_atc, nombre_atc: @atraccion.nombre_atc } }
    end

    assert_redirected_to atraccion_url(Atraccion.last)
  end

  test "should show atraccion" do
    get atraccion_url(@atraccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_atraccion_url(@atraccion)
    assert_response :success
  end

  test "should update atraccion" do
    patch atraccion_url(@atraccion), params: { atraccion: { capacidad_atc: @atraccion.capacidad_atc, descripcion_atc: @atraccion.descripcion_atc, imagen_atc: @atraccion.imagen_atc, nombre_atc: @atraccion.nombre_atc } }
    assert_redirected_to atraccion_url(@atraccion)
  end

  test "should destroy atraccion" do
    assert_difference('Atraccion.count', -1) do
      delete atraccion_url(@atraccion)
    end

    assert_redirected_to atraccions_url
  end
end
