var data = [
    {name: "A", val: 11975},
    {name: "B", val: 5871}
];

var w = 230,
    h = 230,
    r = Math.min(w, h) / 2,
    labelr = r + 30, // radius for label anchor
    color = d3.scale.category20(),
    donut = d3.layout.pie(),
    arc = d3.svg.arc().innerRadius(r * .6).outerRadius(r);

var vis = d3.select(".chart")
  .append("svg:svg")
    .data([data])
    .attr("width", w + 150)
    .attr("height", h);

var arcs = vis.selectAll("g.arc")
    .data(donut.value(function(d) { return d.val }))
  .enter().append("svg:g")
    .attr("class", "arc")
    .attr("transform", "translate(" + (r + 30) + "," + r + ")");

arcs.append("svg:path")
    .attr("fill", function(d, i) { return color(i); })
    .attr("d", arc);

arcs.append("svg:text")
    .attr("transform", function(d) {
        var c = arc.centroid(d),
            x = c[0],
            y = c[1],
            // pythagorean theorem for hypotenuse
            h = Math.sqrt(x*x + y*y);
        return "translate(" + (x/h * labelr) +  ',' +
           (y/h * labelr) +  ")";
    })
    .attr("dy", ".20em")
    .attr("text-anchor", function(d) {
        // are we past the center?
        return (d.endAngle + d.startAngle)/2 > Math.PI ?
            "end" : "start";
    })
    .text(function(d, i) { return d.value.toFixed(2); });
