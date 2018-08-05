require 'qo'

RSpec.describe Any do
  it "has a version number" do
    expect(Any::VERSION).not_to be nil
  end

  describe '.==' do
    it 'returns true for any value' do
      expect(Any == false).to eq(true)
    end
  end

  describe '.===' do
    it 'returns true for any value' do
      expect(Any === false).to eq(true)
    end

    # Note that I'm using Qo here. If these two issues are
    # added in Ruby 2.6+ it'll enable us to do this without
    # the need for Qo
    # 
    # Hash#===  - https://bugs.ruby-lang.org/issues/14869
    # Array#=== - https://bugs.ruby-lang.org/issues/14916
    # 
    # I've commented on each to note this.
    # 
    # For now, I will leave Qo in the specs so that we don't
    # have a hard dependency on 2.6+, especially considering
    # that at the time of writing this it's still in development
    describe 'Pattern matching' do
      it 'can be used to pattern match Arrays' do
        case_result =
          case ['Foo', 25]
          when Qo[/^F/, Any] then true
          else false
          end

        expect(case_result).to eq(true)
      end

      it 'can be used to pattern match Hashes' do
        case_result =
          case {id: 1, name: 'foo', age: 42}
          when Qo[id: Any, name: /^f/, age: Any] then true
          else false
          end

        expect(case_result).to eq(true)

        miss_case_result =
          case {id: 1, name: 'foo'}
          when Qo[id: Any, name: /^f/, age: Any] then true
          else false
          end

        expect(miss_case_result).to eq(false)
      end
    end

    describe '.to_proc' do
      # I don't have much of a usecase for this one, but
      # I could see how it could be potentially handy later
      it 'can be used as an always true branch' do
        which_to_select = true ? Any : :itself
        list = [1,2,3, false]

        expect(list.select(&which_to_select)).to eq(list)

        which_to_select = false ? Any : :itself
        expect(list.select(&which_to_select)).to eq(list - [false])
      end
    end
  end
end
