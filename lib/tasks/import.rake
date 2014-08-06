require 'rdf'
require 'rdf/ntriples'

namespace :db do
  namespace :n3 do
    desc "Import data from nt file"
    task :import => :environment do
      graph = RDF::Graph.load("lib/data/administrative-geography.nt")
      Statement.delete_all
      graph.each_triple do |subject, predicate, object|
        Statement.create(subject: subject.to_s, predicate: predicate.to_s, object: object.to_s) rescue nil
      end
    end
  end
end
