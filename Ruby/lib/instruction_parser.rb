# Matches a given program instruction to its corresponding opcode
class InstructionParser
  def initialize(opcodes)
    @opcodes = opcodes
  end

  def parse(instruction)
    return instruction if %w(00E0 00EE).include?(instruction)

    @opcodes.find { |opcode| instruction =~ /#{opcode.gsub(/[XYN]/, '[0-F]')}/ }
  end
end
