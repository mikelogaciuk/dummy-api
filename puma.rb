# frozen_string_literal: true

threads_min = ENV.fetch('PUMA_THREADS') { 1 }.to_i
threads_max = ENV.fetch('PUMA_THREADS') { 4 }.to_i
threads threads_min, threads_max

port ENV.fetch('PORT') { 4567 }
