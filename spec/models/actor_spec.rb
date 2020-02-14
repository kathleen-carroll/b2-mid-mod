require 'rails_helper'

RSpec.describe Actor do
  describe 'validations' do
    it {validate_presence_of :name}
  end

  describe 'relationships' do
    it { should have_many :movie_actors}
    it { should have_many(:movies).through(:movie_actors)}
  end
end
