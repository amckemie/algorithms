require 'rubygems'
require 'rspec'
require_relative '../sort.rb'

describe 'Sort' do
  describe '.selection_sort' do

    context 'when the argument is empty' do
      it "returns an empty array" do
        expect(Sort.selection_sort([])).to eq([])
      end
    end

    context 'when negative numbers are included' do
      it "returns an array sorted with negative numbers in front" do
        expect(Sort.selection_sort([8, -2, -1, 13])).to eq([-2, -1, 8, 13])
      end
    end

    context 'when duplicate numbers are include' do
      it "returns an array with duplicates sorted next to each other" do
        expect(Sort.selection_sort([10, 3, 0, 3, 20])).to eq([0, 3, 3, 10, 20])
      end
    end

    it "sorts large unordered arrays" do
      array = [-10, 4, 1000, -20, 54, 2456, 0, 31, 45, 44, -100]
      expect(Sort.selection_sort(array)).to eq([-100, -20, -10, 0, 4, 31, 44, 45, 54, 1000, 2456])
    end

    context 'array has all the same numbers' do
      it "returns the same array" do
        expect(Sort.selection_sort([5,5,5,5])).to eq([5,5,5,5])
      end
    end
  end

  describe "merge sort" do

    describe 'merge' do

      it "returns an empty array when given 2 empty arrays" do
        expect(Sort.merge([],[])).to eq([])
      end

      it "returns the other array when given 1 empty array" do
        expect(Sort.merge([], [1,3,5,10])).to eq([1,3,5,10])
        expect(Sort.merge([2,4,8,10], [])).to eq([2,4,8,10])
      end

      it "merges arrays of uneven lengths" do
        expect(Sort.merge([0,3,10,12], [-1,5])).to eq([-1,0,3,5,10,12])
        expect(Sort.merge([-1,2,9], [0, 11,14])).to eq([-1,0,2,9,11,14])
      end

      it "merges large arrays" do
        expect(Sort.merge([-1,0,5,20,45, 60, 101], [-4, 1, 4, 25, 28, 59, 61,200])).to eq([-4,-1,0,1,4,5,20,25,28,45,59,60,61,101,200])
      end
    end

    describe "mergesort" do
      it "returns an empty array when the array passed in is empty" do
        expect(Sort.mergesort([])).to eq([])
      end

      it "sorts 1 element arrays" do
        expect(Sort.mergesort([1])).to eq([1])
      end

      it "sorts 2 element arrays" do
        expect(Sort.mergesort([2,1])).to eq([1,2])
      end

      it "sorts 3 element arrays" do
        expect(Sort.mergesort([1,-1,9])).to eq([-1,1,9])
      end

      it "sorts large arrays" do
        expect(Sort.mergesort([200,-10, 9, -2, 3, 40, 201, 38])).to eq([-10,-2,3,9,38,40,200,201])
      end
    end
  end
end
