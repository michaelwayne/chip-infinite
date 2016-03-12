require 'lib/instruction_parser'

describe InstructionParser do
  describe '#parse' do
    before do
      @parser = InstructionParser.new(%w(0NNN 00E0 00EE 1NNN 2NNN
                                         3XNN 4XNN 5XY0 6XNN 7XNN
                                         8XY0 8XY1 8XY2 8XY3 8XY4
                                         8XY5 8XY6 8XY7 8XYE 9XY0
                                         ANNN BNNN CXNN DXYN EX9E
                                         EXA1 FX07 FX0A FX15 FX18
                                         FX1E FX29 FX33 FX55 FX65))
    end

    def instructions(n)
      %w(0 1 2 3 4 5 6 7 8 9 A B C D E F).repeated_permutation(n).map(&:join)
    end

    context 'with a 0NNN instruction' do
      it 'returns the 0NNN opcode' do
        parsed = instructions(3)
                 .reject { |nnn| %w(0E0 0EE).include?(nnn) }
                 .map { |nnn| @parser.parse('0' + nnn) }

        expect(parsed).to all(eql '0NNN')
      end
    end

    context 'with a 00E0 instruction' do
      it 'returns the 00E0 opcode' do
        parsed = @parser.parse('00E0')

        expect(parsed).to eql('00E0')
      end
    end

    context 'with a 00EE instruction' do
      it 'returns the 00EE opcode' do
        parsed = @parser.parse('00EE')

        expect(parsed).to eql('00EE')
      end
    end

    context 'with a 1NNN instruction' do
      it 'returns the 1NNN opcode' do
        parsed = instructions(3).map { |nnn| @parser.parse('1' + nnn) }

        expect(parsed).to all(eql '1NNN')
      end
    end

    context 'with a 2NNN instruction' do
      it 'returns the 2NNN opcode' do
        parsed = instructions(3).map { |nnn| @parser.parse('2' + nnn) }

        expect(parsed).to all(eql '2NNN')
      end
    end

    context 'with a 3XNN instruction' do
      it 'returns the 3XNN opcode' do
        parsed = instructions(3).map { |xnn| @parser.parse('3' + xnn) }

        expect(parsed).to all(eql '3XNN')
      end
    end

    context 'with a 4XNN instruction' do
      it 'returns the 4XNN opcode' do
        parsed = instructions(3).map { |xnn| @parser.parse('4' + xnn) }

        expect(parsed).to all(eql '4XNN')
      end
    end

    context 'with a 5XY0 instruction' do
      it 'returns the 5XY0 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('5' + xy + '0') }

        expect(parsed).to all(eql '5XY0')
      end
    end

    context 'with a 6XNN instruction' do
      it 'returns the 6XNN opcode' do
        parsed = instructions(3).map { |xnn| @parser.parse('6' + xnn) }

        expect(parsed).to all(eql '6XNN')
      end
    end

    context 'with a 7XNN instruction' do
      it 'returns the 7XNN opcode' do
        parsed = instructions(3).map { |xnn| @parser.parse('7' + xnn) }

        expect(parsed).to all(eql '7XNN')
      end
    end

    context 'with a 8XY0 instruction' do
      it 'returns the 8XY0 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '0') }

        expect(parsed).to all(eql '8XY0')
      end
    end

    context 'with a 8XY1 instruction' do
      it 'returns the 8XY1 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '1') }

        expect(parsed).to all(eql '8XY1')
      end
    end

    context 'with a 8XY2 instruction' do
      it 'returns the 8XY2 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '2') }

        expect(parsed).to all(eql '8XY2')
      end
    end

    context 'with a 8XY3 instruction' do
      it 'returns the 8XY3 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '3') }

        expect(parsed).to all(eql '8XY3')
      end
    end

    context 'with a 8XY4 instruction' do
      it 'returns the 8XY4 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '4') }

        expect(parsed).to all(eql '8XY4')
      end
    end

    context 'with a 8XY5 instruction' do
      it 'returns the 8XY5 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '5') }

        expect(parsed).to all(eql '8XY5')
      end
    end

    context 'with a 8XY6 instruction' do
      it 'returns the 8XY6 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '6') }

        expect(parsed).to all(eql '8XY6')
      end
    end

    context 'with a 8XY7 instruction' do
      it 'returns the 8XY7 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + '7') }

        expect(parsed).to all(eql '8XY7')
      end
    end

    context 'with a 8XYE instruction' do
      it 'returns the 8XYE opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('8' + xy + 'E') }

        expect(parsed).to all(eql '8XYE')
      end
    end

    context 'with a 9XY0 instruction' do
      it 'returns the 9XY0 opcode' do
        parsed = instructions(2).map { |xy| @parser.parse('9' + xy + '0') }

        expect(parsed).to all(eql '9XY0')
      end
    end

    context 'with a ANNN instruction' do
      it 'returns the ANNN opcode' do
        parsed = instructions(3).map { |nnn| @parser.parse('A' + nnn) }

        expect(parsed).to all(eql 'ANNN')
      end
    end

    context 'with a BNNN instruction' do
      it 'returns the BNNN opcode' do
        parsed = instructions(3).map { |nnn| @parser.parse('B' + nnn) }

        expect(parsed).to all(eql 'BNNN')
      end
    end

    context 'with a CXNN instruction' do
      it 'returns the CXNN opcode' do
        parsed = instructions(3).map { |xnn| @parser.parse('C' + xnn) }

        expect(parsed).to all(eql 'CXNN')
      end
    end

    context 'with a DXYN instruction' do
      it 'returns the DXYN opcode' do
        parsed = instructions(3).map { |xyn| @parser.parse('D' + xyn) }

        expect(parsed).to all(eql 'DXYN')
      end
    end

    context 'with a EX9E instruction' do
      it 'returns the EX9E opcode' do
        parsed = instructions(1).map { |x| @parser.parse('E' + x + '9E') }

        expect(parsed).to all(eql 'EX9E')
      end
    end

    context 'with a EXA1 instruction' do
      it 'returns the EXA1 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('E' + x + 'A1') }

        expect(parsed).to all(eql 'EXA1')
      end
    end

    context 'with a FX07 instruction' do
      it 'returns the FX07 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '07') }

        expect(parsed).to all(eql 'FX07')
      end
    end

    context 'with a FX0A instruction' do
      it 'returns the FX0A opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '0A') }

        expect(parsed).to all(eql 'FX0A')
      end
    end

    context 'with a FX15 instruction' do
      it 'returns the FX15 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '15') }

        expect(parsed).to all(eql 'FX15')
      end
    end

    context 'with a FX18 instruction' do
      it 'returns the FX18 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '18') }

        expect(parsed).to all(eql 'FX18')
      end
    end

    context 'with a FX1E instruction' do
      it 'returns the FX1E opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '1E') }

        expect(parsed).to all(eql 'FX1E')
      end
    end

    context 'with a FX29 instruction' do
      it 'returns the FX29 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '29') }

        expect(parsed).to all(eql 'FX29')
      end
    end

    context 'with a FX33 instruction' do
      it 'returns the FX33 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '33') }

        expect(parsed).to all(eql 'FX33')
      end
    end

    context 'with a FX55 instruction' do
      it 'returns the FX55 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '55') }

        expect(parsed).to all(eql 'FX55')
      end
    end

    context 'with a FX65 instruction' do
      it 'returns the FX65 opcode' do
        parsed = instructions(1).map { |x| @parser.parse('F' + x + '65') }

        expect(parsed).to all(eql 'FX65')
      end
    end
  end
end
