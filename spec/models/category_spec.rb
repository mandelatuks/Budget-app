require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(email: 'test@email.com', password: 'password',
                     password_confirmation: 'password')
    @user.save

    @category = Category.new(name: 'category one')

    @category.save

    @transaction = Transaction.new(name: 'transaction one', amount: 50)

    @category.transactions << @transaction
  end

  it 'should have name' do
    @category.name
    expect(@category.name).to eq('category one')
  end

  it 'should have transaction' do
    @category.transactions
    expect(@category.transactions).to eq([@transaction])
  end
end
