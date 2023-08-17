// Happymodel Mobula 8 1s battery shim
// 2023-08-17 add notes and format cleanup
// 2023-08-16 reduce BatteryThick -packs are not square and bend plasic frame
// 2023-08-15 first draft

//$fn=18;
$fn=90;

BatteryLength=60.25;
BatteryWidth=16.8;
BatteryThick=5.2; // 7mm acutal but setting smaller since they are not square

OutSpan=17.73;
InSpan=24.5;

TrayStrapShift=21*0.5;
TrayStrap=3.8;
TrayWidth=20;
TrayThick=1.7;

xt30Width=10.6;

// main model
rotate([0,180,0]) BatteryShim();

// test pack
//rotate([0,180,0]) color("gray") translate([-BatteryLength*0.5,-BatteryWidth*0.5,BatteryThick+TrayThick]) cube([BatteryLength,BatteryWidth,BatteryThick]);

module BatteryShim(){
    difference(){
        translate([-(TrayStrapShift*2+TrayStrap+TrayThick*2)*0.5,-BatteryWidth*0.5,0]) cube([(TrayStrapShift*2+TrayStrap+TrayThick*2),BatteryWidth,BatteryThick+TrayThick]);
        // begin difference items
        // Strap path 1
        translate([-TrayStrapShift,0,TrayThick*0.5-0.02]) cube([TrayStrap,BatteryWidth+TrayThick*2,TrayThick],true);
        // Strap path 2
        translate([+TrayStrapShift,0,TrayThick*0.5-0.02]) cube([TrayStrap,BatteryWidth+TrayThick*2,TrayThick],true);
        // center arch
        translate([0,0,-TrayThick]) rotate([90,0,0]) cylinder(BatteryWidth+0.04,BatteryThick,BatteryThick,true);
        // center hole
        cylinder(BatteryWidth+TrayThick+0.04,BatteryThick,BatteryThick,true);
        // cable passage
        hull(){    
            cube([TrayStrapShift*2+TrayStrap+TrayThick*2+0.04,xt30Width,0.02],true);
            translate([0,-(BatteryWidth*0.5-TrayThick*1.95),BatteryThick-TrayThick*0.5]) rotate([0,90,0]) cylinder(TrayStrapShift*2+TrayStrap+TrayThick*2+0.04, TrayThick,TrayThick,true);
            translate([0,+(BatteryWidth*0.5-TrayThick*1.95),BatteryThick-TrayThick*0.5]) rotate([0,90,0]) cylinder(TrayStrapShift*2+TrayStrap+TrayThick*2+0.04,TrayThick,TrayThick,true);
        }
    }
}



