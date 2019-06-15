document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(153, 204, 255)';
  ctx.fillRect(0, 0, 500, 500);
  
  ctx.beginPath();
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.stroke();
  ctx.fillStyle = 'rgb(255, 255, 179)'
  ctx.fill();

  ctx.beginPath();
  ctx.arc(250, 75, 50, 0, 2 * Math.PI);
  ctx.fillStyle = 'rgb(255, 255, 179)'
  ctx.fill();

  ctx.beginPath();
  ctx.arc(275, 75, 50, 0, 2 * Math.PI);
  ctx.fillStyle = 'rgb(153, 204, 255)';
  ctx.fill();
});
