module Github
  module Webhooks
    class PushEvent
      attr_reader :branch, :authors, :files

      def initialize(branch, authors, files)
        @branch = branch
        @authors = authors
        @files = files
      end

      class << self
        def parse(payload)
          Parser.new(payload).call
        end
      end

      class Parser
        class ParseError < StandardError; end

        def initialize(payload)
          @payload = payload
        end

        def call
          PushEvent.new(branch, authors, files)
        end

        private

        def branch
          @payload[:ref].split('/').reject { |segment| %w(refs heads).include?(segment) }.join('/')

        rescue NoMethodError
          raise ParseError.new('Failed to parse branch.')
        end

        def authors
          raise ParseError.new('Failed to parse authors.') unless @payload[:commits]
          @payload[:commits].map { |commit| commit[:author] }

        rescue NoMethodError
          raise ParseError.new('Failed to parse authors.')
        end

        def files
          documents = %i(added removed modified).each_with_object({}) do |operation, document|
            document[operation] = @payload[:commits].flat_map { |commit| commit[operation] }.compact
          end

          documents.each do |operation, files|
            documents[operation] = files.map { |file| Github::File.new(file) }
          end

          Github::Files.new(documents[:added], documents[:removed], documents[:modified])

        rescue NoMethodError
          raise ParseError.new('Failed to parse files.')
        end
      end
    end
  end
end
