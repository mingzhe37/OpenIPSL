within OpenIPSL.Examples.Tutorial.Example_4.BaseModels.BaseNetwork;
model SMIB_Partial "Partial SMIB Model with PF Record and Load"
  OpenIPSL.Electrical.Buses.Bus B01(
    v_0=pf.powerflow.bus.V1,
    angle_0=pf.powerflow.bus.A1,    displayPF=true)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  OpenIPSL.Electrical.Buses.Bus B03(
    v_0=pf.powerflow.bus.V3,
    angle_0=pf.powerflow.bus.A3,    displayPF=true)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  OpenIPSL.Electrical.Buses.Bus B04(
    v_0=pf.powerflow.bus.V4,
    angle_0=pf.powerflow.bus.A4,    displayPF=true)
    annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
  OpenIPSL.Electrical.Buses.Bus B02(
    v_0=pf.powerflow.bus.V2,
    angle_0=pf.powerflow.bus.A2,    displayPF=true)
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_01(
    R=0.0010,
    X=0.2000,
    G=0.0000,
    B=0.0000)
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_02(
    R=0.0100,
    X=0.2000,
    G=0.0000,
    B=0.0000) annotation (Placement(transformation(extent={{10,10},{30,30}})));
  OpenIPSL.Electrical.Branches.PwLine line_03(
    R=0.0005,
    X=0.1000,
    G=0.0000,
    B=0.0000) annotation (Placement(transformation(extent={{-8,-30},{12,-10}})));
  OpenIPSL.Electrical.Branches.PwLine line_04(
    R=0.0005,
    X=0.1000,
    G=0.0000,
    B=0.0000) annotation (Placement(transformation(extent={{28,-30},{48,-10}})));
  inner OpenIPSL.Electrical.SystemBase SysData
    annotation (Placement(transformation(extent={{-88,72},{-48,90}})));
  GeneratingUnits.InfiniteBus infiniteBus(
    P_0=pf.powerflow.machines.PG2,
    Q_0=pf.powerflow.machines.QG2,
    v_0=pf.powerflow.bus.V2,
    angle_0=pf.powerflow.bus.A2,          displayPF=true)
    annotation (Placement(transformation(extent={{94,-10},{74,10}})));
  replaceable
  OpenIPSL.Electrical.Loads.PSSE.Load load(
    P_0=pf.powerflow.loads.PL1,
    Q_0=pf.powerflow.loads.QL1,
    v_0=pf.powerflow.bus.V3,
    angle_0=pf.powerflow.bus.A3) constrainedby OpenIPSL.Electrical.Loads.PSSE.BaseClasses.baseLoad
    annotation (Placement(transformation(extent={{-34,-56},{-14,-36}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.01,
    X=0.1,
    t1=1,
    t2=1.1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=270,
        origin={36,-46})));
  PfData.PowerFlow pf(redeclare record PowerFlow =
        OpenIPSL.Examples.Tutorial.Example_4.PfData.Pf00000)
    annotation (Placement(transformation(extent={{-80,26},{-60,46}})));
equation
  connect(line_01.p, B01.p)
    annotation (Line(points={{-53,0},{-60,0}}, color={0,0,255}));
  connect(line_01.n, B03.p)
    annotation (Line(points={{-35,0},{-30,0}}, color={0,0,255}));
  connect(line_02.p, B03.p) annotation (Line(points={{11,20},{-16,20},{-16,0},{
          -30,0}}, color={0,0,255}));
  connect(line_02.n, B02.p)
    annotation (Line(points={{29,20},{48,20},{48,0},{60,0}}, color={0,0,255}));
  connect(line_03.p, B03.p) annotation (Line(points={{-7,-20},{-16,-20},{-16,0},
          {-30,0}}, color={0,0,255}));
  connect(line_03.n, B04.p)
    annotation (Line(points={{11,-20},{20,-20}},color={0,0,255}));
  connect(line_04.p, B04.p)
    annotation (Line(points={{29,-20},{20,-20}}, color={0,0,255}));
  connect(line_04.n, B02.p) annotation (Line(points={{47,-20},{48,-20},{48,0},{
          60,0}}, color={0,0,255}));
  connect(infiniteBus.pwPin, B02.p)
    annotation (Line(points={{73,0},{60,0}}, color={0,0,255}));
  connect(load.p, B03.p)
    annotation (Line(points={{-24,-36},{-24,0},{-30,0}}, color={0,0,255}));
  connect(pwFault.p, B04.p) annotation (Line(points={{36,-39},{36,-28},{24,
          -28},{24,-20},{20,-20}}, color={0,0,255}));
  annotation (Diagram(graphics={Text(
          extent={{-92,68},{94,48}},
          lineColor={0,0,0},
          lineThickness=1,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="Single-machine infinite bus model")}));
end SMIB_Partial;
