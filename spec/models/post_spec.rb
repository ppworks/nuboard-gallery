require 'spec_helper'

describe Post do
  let(:post) { create(:post) }
  describe '投稿が生成出来る' do
    subject { post }
    it { should be_instance_of Post }
  end

  describe 'relations' do
    it { should belong_to(:user) }
  end
end
