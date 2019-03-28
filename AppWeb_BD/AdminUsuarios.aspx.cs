using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminUsuarios : System.Web.UI.Page
{
  //Variables generales de la página.
  private DataSet DsGeneral= new DataSet(); DataRow fila;
  private GestorBD.GestorBD GestorBD;         //Para manejar la BD.
  private Comunes comunes = new Comunes();     //Para manejar las rutinas de uso común.
  private String cadSql;
  private const int OK = 1;

  //Acciones iniciales.
  protected void Page_Load(object sender, EventArgs e) {

  }

  //========================================================================
  //Parte 1a: acciones relacionadas con el alta de usuarios.
  //Muestra/deshabilita los controles asociados al alta.
  protected void BtnAlta_Click(object sender, EventArgs e) {

    TxtRFC.Visible = true; TxtNombre.Visible = true;
    TxtPassw.Visible = true; DDLTipo.Visible = true;
    BtnBaja.Enabled = false; BtnCambio.Enabled = false;
    LblMensaje.Text = "Operación: Alta";
    Session["Operación"] = "Alta";
  }

  //Muestra controles adicionales según el tipo de usuario a 
  //dar de alta.
  protected void DDLTipo_SelectedIndexChanged(object sender, EventArgs e) {
    String tipo;

    tipo = DDLTipo.SelectedValue;
    LblMensaje.Text = "Tipo de usuario: " + tipo;
    if (DDLTipo.Text != "Tipo de usuario") {
      if (DDLTipo.SelectedValue == "Cli") {
        TxtDomicilio.Visible = true; TxtCat.Visible = false;
      }
      else {
        TxtDomicilio.Visible = false; TxtCat.Visible = true;
        if (DDLTipo.SelectedValue == "Emp")
          TxtCat.Text = "Base";          //Tipo de empleado.
        else
          TxtCat.Text = "Gerente";
      }
      BtnEjecuta.Enabled = true;
    }
    else {
      TxtDomicilio.Visible = false; TxtCat.Visible = false; BtnEjecuta.Enabled = false;
    }
  }

  //===============================================================
  //Alta de un nuevo usuario:
  //primeramente lo da de alta en la tabla de Usuarios, verificando antes que no exista 
  //el RFC. Después da de alta en las tablas de Clientes o Empleados, según el tipo de
  //usuario de que se trate.
  public void alta() {
    //Parte 1b: Recupera objetos de Session.
    GestorBD = (GestorBD.GestorBD) Session["GestorBD"];

    //Verifica que el rfc del nuevo usuario no exista.
    cadSql = "select * from PCUsuarios where rfc='" + TxtRFC.Text + "'";
    GestorBD.consBD(cadSql, DsGeneral, "Usuario");
    if (DsGeneral.Tables["Usuario"].Rows.Count == 0) {
      //Da de alta en la tabla de usuarios.
      cadSql = "insert into PCUsuarios values('" + TxtRFC.Text + "','" + 
        TxtNombre.Text + "','" + TxtPassw.Text + "','" + 
        DDLTipo.SelectedValue.ToString() + "')";
      if (GestorBD.altaBD(cadSql) == OK) {
        if (DDLTipo.SelectedValue.ToString() == "Cli") {
          //============================================
          //Parte 1c: alta de un cliente.
          cadSql = "insert into PCClientes values('" + TxtRFC.Text +
                    "','" + TxtDomicilio.Text + "')";
          if (GestorBD.altaBD(cadSql) == OK)
            LblMensaje.Text = "Inserción exitosa en Usuarios y Clientes";
          else
            LblMensaje.Text = "Error de inserción en la tabla Clientes";
        }
        else {
          //============================================
          //Parte 1d: alta de un empleado.
          cadSql = "insert into PCEmpleados values('" + TxtRFC.Text + 
            "','" + TxtCat.Text + "')";
          if (GestorBD.altaBD(cadSql) == OK) {
            Response.Write("Inserción exitosa en Usuarios y Empleados");
            LblMensaje.Text = "Inserción exitosa en Usuarios y Empleados";
          }
          else
            LblMensaje.Text = "Error de inserción en la tabla Empleados";
        }
      }
    }
    else
      LblMensaje.Text = "Error: ese rfc ya existe";
  }

  //=================================================================
  //Parte 2a: acciones relacionadas con la baja de un usuario.
  protected void BtnBaja_Click(object sender, EventArgs e) {

    //Lee los datos de los usuarios y muestra sus RFC en DDLUsuarios.
    leeUsuarios();

    //Oculta/deshabilita controles.
    DDLUsuarios.Visible = true;
    BtnAlta.Enabled = false; BtnCambio.Enabled = false;
    LblMensaje.Text = "Operación: Baja";
    Session["Operación"] = "Baja";
  }

  //Lee los datos de los usuarios y muestra sus RFC en el DDL de usuarios.
  //Esta rutina es usada tanto en baja, como en cambio de datos de usuarios.
  protected void leeUsuarios() {
    GestorBD = (GestorBD.GestorBD)Session["GestorBD"];
    cadSql = "select * from PCUsuarios";
    GestorBD.consBD(cadSql, DsGeneral, "DatosUsuarios");
    comunes.cargaDDL(DDLUsuarios, DsGeneral, "DatosUsuarios", "RFC");
    Session["DsGeneral"] = DsGeneral;
  }

  //=================================================================
  //Baja de un usuario:
  //elimina al usuario elegido en el DDL.
  public void baja() {
    String RFC, tipo;
    DataRow[] filas;

    //Parte 2b: acciones iniciales para la baja.
    //Determina el tipo del usuario (cliente o empleado) usando la información que ya está
    //en el DataSet.
    RFC = DDLUsuarios.SelectedValue;
    DsGeneral = (DataSet)Session["DsGeneral"];
    filas = DsGeneral.Tables["DatosUsuarios"].Select("RFC='" + RFC + "'");
    fila = filas[0]; tipo = fila["Tipo"].ToString();

    //Da de baja en Clientes o Empleados, según el tipo de usuario.
    GestorBD = (GestorBD.GestorBD)Session["GestorBD"];
    if (tipo == "Cli") {
      //===========================================
      //Parte 2c: Baja en la tabla de Clientes.
      cadSql = "delete from PCClientes where RFC='" + RFC + "'";
      if (GestorBD.bajaBD(cadSql) == OK)
        LblMensaje.Text = "Eliminación exitosa en Clientes";
      else
        LblMensaje.Text = "Error de eliminación en la tabla Clientes";
    }
    else {
      //===========================================
      //Parte 2d: Baja en la tabla de Empleados.
      cadSql = "delete from PCEmpleados where RFC='" + RFC + "'";
      if (GestorBD.bajaBD(cadSql) == OK)
        LblMensaje.Text = "Eliminación exitosa en Empleados";
      else
        LblMensaje.Text = "Error de eliminación en la tabla Empleados";
    }
    //===========================================
    //Parte 2e: Da de baja en la tabla de Usuarios.
    cadSql = "delete from PCUsuarios where RFC='" + RFC + "'";
    if (GestorBD.bajaBD(cadSql) == OK)
      LblMensaje.Text = "Eliminación exitosa en Usuarios";
    else
      LblMensaje.Text = "Error de eliminación en la tabla Usuarios";
  }

  protected void DDLUsuarios_SelectedIndexChanged(object sender, EventArgs e) {

      BtnEjecuta.Enabled = true;     //para ejecutar la operación en cuestión.
  }


  //=====================================================================
  //Parte 4: acciones relacionadas con la ejecución de la 
  //operación elegida.
  protected void BtnEjecuta_Click(object sender, EventArgs e) {
    String oper;

    //Ejecuta el código si no hay errores de validación.
    if (Page.IsValid) { 
      oper = Session["Operación"].ToString();
      switch (oper) {
        case "Alta":
          alta();
          break;
        case "Baja":
          baja();
          break;
        case "Cambio":
          //cambio();
          break;
      }
    }

    TxtRFC.Visible = false; TxtNombre.Visible = false;
    TxtPassw.Visible = false;
    //TxtPassw.TextMode = TextBoxMode.Password;   //Para que aparezcan asteriscos al dar la contra.
    TxtDomicilio.Visible = false; TxtCat.Visible = false;
    DDLTipo.Text = "Tipo de usuario"; DDLTipo.Visible = false; DDLUsuarios.Visible = false;
    BtnAlta.Enabled = true; BtnBaja.Enabled = true; BtnCambio.Enabled = true;
    BtnEjecuta.Enabled = false;
  }

}