document.addEventListener("DOMContentLoaded", function () {
    const boton = document.getElementById("Registrate");
    const formulario2 = document.querySelector(".form_registro");
    const formulario = document.querySelector("form")

    boton.addEventListener("click", function () {
        formulario2.style.display = "block";
        formulario.style.display = "none";

    });
});



