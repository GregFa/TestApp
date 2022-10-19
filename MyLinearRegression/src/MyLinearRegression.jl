module MyLinearRegression

    using  CSV, DataFrames, GLM, Statistics

    export my_linear_regression

    function my_linear_regression(myfile::String, invar::String, outvar::String )

        df = CSV.read(myfile, DataFrame)

        frml = eval(Meta.parse("@formula($(outvar) ~ $(invar))"))

        linear_regressor = lm(frml, df)

        return linear_regressor
    end

    function julia_main()
        for arg in ARGS
            println(arg)
        end
        
        show(my_linear_regression(ARGS[1], ARGS[2], ARGS[3]))
    end

end