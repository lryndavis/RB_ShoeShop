require('spec_helper')

  describe('the path to add a new shoe store to the application', {:type => :feature}) do
    it('allows a user to add a new shoe store to the list of shoe stores') do
      visit('/')
      fill_in('store_name', :with => "Solestruck")
      click_button('Add')
      expect(page).to have_content('Solestruck')
    end
  end

    describe('the path to delete a shoe store', {:type => :feature}) do
      it('allows a user to delete a shoe store from the app') do
        visit('/')
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
          fill_in('store_name', :with => "Solestruck")
          click_button('Add')
          expect(page).to have_content('Solestruck')
          click_link('Solestruck')
          expect(page).to have_content('Solestruck carries the following brands:')
          fill_in('store_name', :with => "Solestruck Shop")
          click_button('Update')
          expect(page).to have_content('Solestruck Shop')
        end
      end
      describe('the path to add a brand', {:type => :feature}) do
          it('allows a user to add a brand to a shoe store') do
            visit('/')
            fill_in('store_name', :with => "Solestruck")
            click_button('Add')
            expect(page).to have_content('Solestruck')
            click_link('Solestruck')
            expect(page).to have_content('Solestruck carries the following brands:')
            fill_in('brand_name', :with => "Fancy Boots")
            click_button('Add')
            expect(page).to have_content('Fancy Boots')
          end
        end
