require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(username: 'blanco') }
  let(:group) { user.groups.create(name: 'abc', icon: 'cde') }
  context 'testing group controller method and models' do
    it 'expects a new group to created successfuly' do
      expect(group.valid?).to eq(true)
    end
    it "doesn't create a group with an empty name" do
      group = Group.create(name: '')
      expect(group.valid?).to eq false
    end
    it 'creates a group only if the name is unique' do
      group2 = Group.create(name: group.name.to_s)
      expect(group2.valid?).to eq false
    end
    it 'creates a group only if the name is unique' do
      group2 = Group.create(name: group.name.to_s)
      expect(group2.valid?).to eq false
    end
    it 'creates a group not needing an icon' do
      group1 = user.groups.create(name: 'abc', icon: '')
      expect(group1.icon.nil? & group1.valid?).to eq false
    end
  end
end
