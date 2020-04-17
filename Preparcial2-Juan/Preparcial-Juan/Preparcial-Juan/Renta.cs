using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Odbc;
using System.IO;
using System.Net;

namespace Preparcial_Juan
{
    public partial class Renta : Form
    {
        OdbcConnection conn = new OdbcConnection("Dsn=RENTA");
        conexion cn = new conexion();
        DateTime hoy = DateTime.Now;
        string fechahora;
        string fecha;
        string sinos;
        string datoo;

                string usuario = "";
        public Renta(string user)
        {
            InitializeComponent();
            usuario = user;
            LblUsuario.Text = usuario;
            fechahora = hoy.ToString("yyyy/MM/dd");
            LblFecha.Text = fechahora;
            llenartbl();
            llenartbl2();
            dateTimePicker2.Format = DateTimePickerFormat.Custom;
            dateTimePicker2.CustomFormat = "yyyy-MM-dd";
            radioSi.Checked = true;
            sino();
            combo1.llenarse("cliente", "MEMBRESIA");
            combo2.llenarse("empleado", "EMPLEADO");
            combo3.llenarse("material", "MATERIAL");
            



        }

        private void Renta_Load(object sender, EventArgs e)
        {

        }

        void sino()
        {
            if (radioSi.Checked)
            {
                sinos = "1";
            }
            else
            {
                sinos = "0";
            }
            
        }

        private void toolStripStatusLabel1_Click(object sender, EventArgs e)
        {

        }
        void llenartbl()
        {
           
            OdbcCommand cod = new OdbcCommand();
            cod.Connection = conn;
            cod.CommandText = ("SELECT ID_ENCABEZADO,MEMBRESIA,EMPLEADO,DEVOLUCION,FECHA_INICIO,FECHA_FIN FROM renta_encabezado WHERE ESTADO =1;");
            try
            {
                OdbcDataAdapter eje = new OdbcDataAdapter();
                eje.SelectCommand = cod;
                DataTable datos = new DataTable();
                eje.Fill(datos);
                dataGridView1.DataSource = datos;
                eje.Update(datos);
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show("ERROR" + e.ToString());
                conn.Close();
                
            }
        }



        void llenar()
        {

            OdbcCommand cod = new OdbcCommand();
            cod.Connection = conn;
            cod.CommandText = ("");
            try
            {
                OdbcDataAdapter eje = new OdbcDataAdapter();
                eje.SelectCommand = cod;
                DataTable datos = new DataTable();
                eje.Fill(datos);
                dataGridView1.DataSource = datos;
                eje.Update(datos);
                datoo = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                label11.Text = datoo;
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show("ERROR" + e.ToString());
                conn.Close();

            }
        }
        public string PrimerCamp()// metodo  que obtinene el contenio de una tabla
        {
            string Campos = "";

            try
            {
                OdbcCommand cod = new OdbcCommand();
                cod.Connection = conn;
                cod.CommandText = ("SELECT MAX(ID_ENCABEZADO) FROM renta_encabezado WHERE ESTADO=1;");

                
                OdbcDataReader reader = cod.ExecuteReader(); 

                reader.Read();

                Campos = reader.GetValue(0).ToString();
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("ERROR" + ex.ToString());
            }
            return Campos;// devuelve un arreglo con los tiposlos campos
        }
        public string obtenerencabezado()
        {
            string id = "";
            string sql = "select max(ID_ENCABEZADO)FROM renta_encabezado;";
            OdbcCommand command = new OdbcCommand(sql, cn.probarConexion());
            OdbcDataReader reader = command.ExecuteReader();


            if (reader.Read())
            {
                id = reader.GetValue(0).ToString();

            }

            return id;

        }

        void llenartbl2()
        {

            OdbcCommand cod = new OdbcCommand();
            cod.Connection = conn;
            cod.CommandText = ("SELECT ID_DETALLE,MATERIAL,PRECIO_UNIDAD,CANTIDAD FROM renta_detalle WHERE ESTADO=1;");
            try
            {
                OdbcDataAdapter eje = new OdbcDataAdapter();
                eje.SelectCommand = cod;
                DataTable datos = new DataTable();
                eje.Fill(datos);
                dataGridView2.DataSource = datos;
                eje.Update(datos);
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show("ERROR" + e.ToString());
                conn.Close();

            }
        }
        void Insertar()
        {
            
            conn.Close();
            string query = "INSERT INTO `renta_encabezado` (`ID_ENCABEZADO`, `MEMBRESIA`, `EMPLEADO`, `FECHA_INICIO`, `FECHA_FIN`, `DEVOLUCION`, `ESTADO`) VALUES (NULL, "+ "(SELECT ID_DETALLE,MATERIAL,PRECIO_UNIDAD,CANTIDAD FROM renta_detalle WHERE ESTADO=1)" + ", " + combo2.obtener() + ", '"+ fechahora + "', '" + dateTimePicker2.Text + "', " + sinos+", '1');";

            conn.Open();
            OdbcCommand consulta = new OdbcCommand(query, conn);
            try
            {
                consulta.ExecuteNonQuery();
                MessageBox.Show("El Empleado se Registro Corectamente");
                llenartbl();
            }
            catch (Exception ex)
            {
                MessageBox.Show("\t Error! \n\n " + ex.ToString());
                conn.Close();
            }
        }


        void Insertar2()
        {

            conn.Close();
            string query = "INSERT INTO `renta_detalle` (`ID_DETALLE`, `ID_ENCABEZADO`, `MATERIAL`, `PRECIO_UNIDAD`, `CANTIDAD`, `ESTADO`) VALUES (NULL,' " + obtenerencabezado() + "', " + combo3.obtener() + ", "+txtpre.Text+","+txtcant.Text+", '1');";

            conn.Open();
            OdbcCommand consulta = new OdbcCommand(query, conn);
            try
            {
                consulta.ExecuteNonQuery();
                MessageBox.Show("El Empleado se Registro Corectamente");
                llenartbl();
            }
            catch (Exception ex)
            {
                MessageBox.Show("\t Error! \n\n " + ex.ToString());
                conn.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Insertar();
            llenar();
            btnin2.Enabled = true;

        }

        private void dateTimePicker2_ValueChanged(object sender, EventArgs e)
        {
            fecha = dateTimePicker2.Value.ToString("yyyy/MM/dd");
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void radioSi_CheckedChanged(object sender, EventArgs e)
        {
            sino();
        }

        private void radioNo_CheckedChanged(object sender, EventArgs e)
        {
            sino();
        }

        private void btnin2_Click(object sender, EventArgs e)
        {
            Insertar2();
            llenartbl2();
        }
    }
}
