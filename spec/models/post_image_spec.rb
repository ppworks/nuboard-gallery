require 'spec_helper'

describe PostImage do
  describe 'relations' do
    it { should belong_to(:post) }
  end
end
