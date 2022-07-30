#!/bin/bash

#github_ref="refs/heads/release/v0.0.1"
github_ref="refs/heads/feature/workflow"


          echo "Running on branch $github_ref"
          if [[ "$github_ref" =~ ^refs/heads/feature/[a-zA-z]* ]]; then
            echo "::set-output name=environment::feature"
          elif [[ "$github_ref" = "refs/heads/develop" ]]; then
            echo "::set-output name=environment::dev"
          elif [[ "$github_ref" = "^(refs\/heads\/release\/v[a*)" ]]; then
            echo "::set-output name=environment::hom"
          elif [[ "$github_ref" = "refs/heads/main" ]]; then
            echo "::set-output name=environment::prod"
          else
            echo "Ambiente não encontrado"
            exit 1
          fi
