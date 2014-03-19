require 'spec_helper'

describe Connection do
  let(:user) { create(:user) }

  subject(:connection) { create(:connection, user: user) }

  describe 'コネクションを作成できる' do
    specify { expect(connection).to be_instance_of Connection }
  end

  describe 'relations' do
    specify { expect(connection).to belong_to(:user) }
  end
end
