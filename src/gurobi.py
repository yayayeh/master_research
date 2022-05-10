#!/usr/bin/env python
import sys 
import os
import gurobipy as gp
from gurobipy import GRB
import time

if len(sys.argv) < 2:
    print('Usage: lp.py filename')
    sys.exit(0)

# Read and solve model
with open(sys.argv[1],'r') as fh:
    onelinelist = []
    oneline = 'any character to go while loop'
    while oneline:
        oneline = fh.readline()
        oneline = oneline.strip()
        if oneline != '':
            onelinelist.append(oneline)
            
    for i in onelinelist:
        start = time.time()
        print("==================================================================")
        print(i)
        model = gp.read(i)
        model.optimize()
        name = i.split('.')[0]
        
        if model.Status == GRB.INF_OR_UNBD:
            # Turn presolve off to determine whether model is infeasible
            # or unbounded
            model.setParam(GRB.Param.Presolve, 0)
            model.optimize()
        
        if model.Status == GRB.OPTIMAL:
            print('Optimal objective: %g' % model.ObjVal)
            name = name + ".sol"
            model.write(name)
            #sys.exit(0)
        elif model.Status != GRB.INFEASIBLE:
            print('Optimization was stopped with status %d' % model.Status)
            #sys.exit(0)
        else: 
        # Model is infeasible - compute an Irreducible Inconsistent Subsystem (IIS)
        
            print('')
            print('Model is infeasible')
            model.computeIIS()
            name = name + ".ilp"
            model.write(name)
            print("IIS written to file 'model.ilp'")
        end = time.time()
        print(end - start)