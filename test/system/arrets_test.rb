require "application_system_test_case"

class ArretsTest < ApplicationSystemTestCase
  setup do
    @arret = arrets(:one)
  end

  test "visiting the index" do
    visit arrets_url
    assert_selector "h1", text: "Arrets"
  end

  test "should create arret" do
    visit arrets_url
    click_on "New arret"

    fill_in "Apport", with: @arret.apport
    fill_in "Name", with: @arret.name
    fill_in "Year", with: @arret.year
    click_on "Create Arret"

    assert_text "Arret was successfully created"
    click_on "Back"
  end

  test "should update Arret" do
    visit arret_url(@arret)
    click_on "Edit this arret", match: :first

    fill_in "Apport", with: @arret.apport
    fill_in "Name", with: @arret.name
    fill_in "Year", with: @arret.year
    click_on "Update Arret"

    assert_text "Arret was successfully updated"
    click_on "Back"
  end

  test "should destroy Arret" do
    visit arret_url(@arret)
    click_on "Destroy this arret", match: :first

    assert_text "Arret was successfully destroyed"
  end
end
