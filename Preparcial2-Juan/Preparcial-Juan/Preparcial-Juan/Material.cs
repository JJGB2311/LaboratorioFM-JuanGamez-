using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Preparcial_Juan
{
    public partial class Material : Form
    {string usuario="";
        public Material(string user)
        {
            InitializeComponent();
            usuario = user;
            LblUsuario.Text = usuario;
            string[] alias = { "Material", "Nombre", "Descripcion","Categoria","Genero","Autor","Precio","Existencia","Estado" }; // Arreglo de nombres para campos
            navegador1.asignarAlias(alias); // Asignar nombres
            navegador1.asignarSalida(this); // Asignar form de salida
            Color nuevoColor = System.Drawing.ColorTranslator.FromHtml("#0926E3"); // Deficion de 
            navegador1.asignarColorFondo(nuevoColor);
            navegador1.asignarColorFuente(Color.White);
            navegador1.asignarAyuda("1"); // asignar 1 por defecto 
            navegador1.asignarComboConTabla("categoria", "NOMBRE", 1); // 0 o 1 en modo, 0 pone el id y 1 coloca el nombre y consulta el id
            navegador1.asignarTabla("material"); // tabla principal
            navegador1.asignarNombreForm("Material"); // Titulo y nombre del form
        }

        private void Material_Load(object sender, EventArgs e)
        {
            string aplicacionActiva = "1";
            navegador1.ObtenerIdUsuario(usuario); // Pasa el parametro del usuario
            navegador1.botonesYPermisosInicial(usuario, aplicacionActiva); // Consulta permisos al iniciar
            navegador1.ObtenerIdAplicacion(aplicacionActiva);// Pasa el id de la aplicacion actual

        }
    }
}
