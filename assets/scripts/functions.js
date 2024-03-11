function getXCoordinates(){
 document.querySelector('model-viewer').addEventListener('click', (event) => {
                 const rect = event.target.getBoundingClientRect();
                 const x = event.clientX - rect.left; // X coordinate relative to the model-viewer
                 const y = event.clientY - rect.top; // Y coordinate relative to the model-viewer

              });
              return x;
        }

function getYCoordinates(){
          window.addEventListener('DOMContentLoaded', (event) => {
                     document.querySelector('model-viewer').addEventListener('click', (event) => {
                         const rect = event.target.getBoundingClientRect();
                         const x = event.clientX - rect.left; // X coordinate relative to the model-viewer
                         const y = event.clientY - rect.top; // Y coordinate relative to the model-viewer

                      });
                 });
                 return y;
                 }