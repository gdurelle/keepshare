require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :lists }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_length_of :password }
  it { is_expected.to validate_uniqueness_of :email }

  describe 'as_json' do
    subject { FactoryGirl.create :user }
    specify do
      expect(subject.as_json.to_s).to match(subject.email)
      expect(subject.as_json.to_s).to match(/data/)
      expect(subject.as_json.to_s).to match(/links/)
      expect(subject.as_json[:links].to_s).to match(/self/)
    end
  end
end
