require "application_system_test_case"

class AtraccionsTest < ApplicationSystemTestCase
  setup do
    @atraccion = atraccions(:one)
  end

  test "visiting the index" do
    visit atraccions_url
    assert_selector "h1", text: "Atraccions"
  end

  test "creating a Atraccion" do
    visit atraccions_url
    click_on "New Atraccion"

    fill_in "Capacidad atc", with: @atraccion.capacidad_atc
    fill_in "Descripcion atc", with: @atraccion.descripcion_atc
    fill_in "Imagen atc", with: @atraccion.imagen_atc
    fill_in "Nombre atc", with: @atraccion.nombre_atc
    click_on "Create Atraccion"

    assert_text "Atraccion was successfully created"
    click_on "Back"
  end

  test "updating a Atraccion" do
    visit atraccions_url
    click_on "Edit", match: :first

    fill_in "Capacidad atc", with: @atraccion.capacidad_atc
    fill_in "Descripcion atc", with: @atraccion.descripcion_atc
    fill_in "Imagen atc", with: @atraccion.imagen_atc
    fill_in "Nombre atc", with: @atraccion.nombre_atc
    click_on "Update Atraccion"

    assert_text "Atraccion was successfully updated"
    click_on "Back"
  end

  test "destroying a Atraccion" do
    visit atraccions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Atraccion was successfully destroyed"
  end
end
