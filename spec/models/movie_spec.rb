require 'rails_helper'

RSpec.describe Movie do
  describe 'validations' do
    it {validate_presence_of :name}
  end

  describe 'relationships' do
    it {should belong_to :studio}
    it { should have_many :movie_actors}
  end
end
