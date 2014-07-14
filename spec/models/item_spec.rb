require 'rails_helper'

describe Item do
  context "clearance" do

    it "sells items at 75% of the price" do
      item = FactoryGirl.create(:item, style: FactoryGirl.create(:style, wholesale_price: 50))
      item.clearance!
      expect(item.price_sold).to eq 37.5
    end

    it "updates item status to clearanced" do
      item = FactoryGirl.create(:item, style: FactoryGirl.create(:style, wholesale_price: 50))
      item.clearance!
      expect(item.status).to eq :clearanced
    end

    it "disallows sold items to be clearanced" do
      item = FactoryGirl.create(:item, status: :sold, price_sold: 50)
      item.clearance!
      expect(item.status).to eq :sold
      expect(item.price_sold).to eq 50
    end

    it "disallows items to be sold below $2" do
      item = FactoryGirl.create(:item, style: FactoryGirl.create(:style, wholesale_price: 2))
      item.clearance!
      expect(item.price_sold).to eq 2
    end

    it "disallows dresses to be sold below $5" do
      item = FactoryGirl.create(:item, style: FactoryGirl.create(:style, wholesale_price: 6, type: "Dress"))
      item.clearance!
      expect(item.price_sold).to eq 5
    end

     it "disallows pants to be sold below $5" do
      item = FactoryGirl.create(:item, style: FactoryGirl.create(:style, wholesale_price: 6, type: "Pants"))
      item.clearance!
      expect(item.price_sold).to eq 5
    end

    it "disallows items to be sold above their wholesale price" do
      item = FactoryGirl.create(:item, style: FactoryGirl.create(:style, wholesale_price: 1, type: "Pants"))
      item.clearance!
      expect(item.price_sold).to eq 1
    end
  end
end
