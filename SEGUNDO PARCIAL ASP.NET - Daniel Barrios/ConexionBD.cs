using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public static class ConexionBD
    {
        public static string CadenaConexion
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["TecnoVigilanciaDB"].ConnectionString;
            }
        }

        public static SqlConnection ObtenerConexion()
        {
            SqlConnection con = new SqlConnection(CadenaConexion);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            return con;
        }

        public static DataTable EjecutarConsulta(string query, SqlParameter[] parametros = null)
        {
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parametros != null)
                    {
                        foreach (SqlParameter p in parametros)
                        {
                            cmd.Parameters.Add(new SqlParameter(p.ParameterName, p.Value));
                        }
                    }
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        return dt;
                    }
                }
            }
        }

        public static int EjecutarComando(string query, SqlParameter[] parametros = null)
        {
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parametros != null)
                    {
                        foreach (SqlParameter p in parametros)
                        {
                            cmd.Parameters.Add(new SqlParameter(p.ParameterName, p.Value));
                        }
                    }
                    con.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        public static object EjecutarEscalar(string query, SqlParameter[] parametros = null)
        {
            using (SqlConnection con = new SqlConnection(CadenaConexion))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (parametros != null)
                    {
                        foreach (SqlParameter p in parametros)
                        {
                            cmd.Parameters.Add(new SqlParameter(p.ParameterName, p.Value));
                        }
                    }
                    con.Open();
                    return cmd.ExecuteScalar();
                }
            }
        }
    }
}
