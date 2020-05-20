# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :title }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:article)).to be_valid
    end
  end
end
