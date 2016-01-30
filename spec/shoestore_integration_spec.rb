require('spec_helper')

  describe('the path to add a new shoe store to the application', {:type => :feature}) do
    it('allows a user to add a new shoe store to the list of shoe stores') do
      visit('/')
      click_link('SHOPS')
      fill_in('store_name', :with => "Solestruck")
      click_button('Add')
      expect(page).to have_content('Solestruck')
    end
  end

  describe('the path to delete a shoe store', {:type => :feature}) do
    it('allows a user to delete a shoe store from the app') do
      visit('/')
      click_link("SHOPS")
      fill_in('store_name', :with => "Solestruck")
      click_button('Add')
      expect(page).to have_content('Solestruck')
      click_link('Solestruck')
      expect(page).to have_content('Solestruck carries the following brands:')
      click_button('Delete this Store')
      expect(page).not_to(have_content('Solestruck'))
    end
  end

  describe('the path to update a shoe store', {:type => :feature}) do
    it('allows a user to update the name of a shoe store') do
      visit('/')
      click_link("SHOPS")
      fill_in('store_name', :with => "Solestruck")
      click_button('Add')
      expect(page).to have_content('Solestruck')
      click_link('Solestruck')
      expect(page).to have_content('Solestruck carries the following brands:')
      fill_in('store_name', :with => "Solestruck Shop")
      click_button('Update Shop')
      expect(page).to have_content('Solestruck Shop')
    end
  end

    describe('the path to add a brand', {:type => :feature}) do
      it('allows a user to add a brand to a shoe store') do
        visit('/')
        click_link('SHOPS')
        fill_in('store_name', :with => "Solestruck")
        click_button('Add')
        expect(page).to have_content('Solestruck')
        click_link('SHOE FINDER')
        expect(page).to have_content('SHOE FINDER')
        click_link('BRANDS')
        expect(page).to have_content('CURRENT BRANDS')
        fill_in('brand_name', :with => "Fancy Boots")
        click_button('Add Brand')
        expect(page).to have_content('Fancy Boots')
        click_link('SHOE FINDER')
        click_link('SHOPS')
        click_link('Solestruck')
        expect(page).to have_content('Solestruck carries the following brands:')
        select "Fancy Boots", :from => "brand_id"
        click_button('Add')
        expect(page).to have_content('Fancy Boots')
      end
    end

    describe('the path to update a brand', {:type => :feature}) do
      it('allows a user to update the name of a brand') do
        visit('/')
        click_link("BRANDS")
        fill_in('brand_name', :with => "Fancy Boots")
        click_button('Add Brand')
        expect(page).to have_content("Fancy Boots")
        click_link('Fancy Boots')
        expect(page).to have_content('Fancy Boots is sold at the following stores:')
        fill_in('brand_name', :with => "Super Fancy Boots")
        click_button('Update')
        expect(page).to have_content('Super Fancy Boots')
      end
    end

      describe('the path to delete a brand', {:type => :feature}) do
        it('allows a user to delete a brand from the app') do
          visit('/')
          click_link("BRANDS")
          fill_in('brand_name', :with => "Fancy Boots")
          click_button('Add Brand')
          expect(page).to have_content('Fancy Boots')
          click_link('Fancy Boots')
          expect(page).to have_content('Fancy Boots is sold at the following stores:')
          click_button('Delete this Brand')
          expect(page).not_to(have_content('Fancy Boots'))
        end
      end
