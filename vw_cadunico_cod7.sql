DROP MATERIALIZED VIEW temporario.vw_cadunico_cod7;
DROP MATERIALIZED VIEW IF EXISTS temporario.vw_cadunico_cod7;
CREATE MATERIALIZED VIEW temporario.vw_cadunico_cod7 AS
SELECT
  *,
  (
    codigo_ibge * 10 +  -- desloca uma casa para a esquerda
    (
      10 - (
        (
          -- cálculo do dígito verificador
          CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 1, 1) AS INT) +
          ((CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 2, 1) AS INT) * 2) % 10 + (CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 2, 1) AS INT) * 2) / 10) +
          CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 3, 1) AS INT) +
          ((CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 4, 1) AS INT) * 2) % 10 + (CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 4, 1) AS INT) * 2) / 10) +
          CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 5, 1) AS INT) +
          ((CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 6, 1) AS INT) * 2) % 10 + (CAST(SUBSTRING(LPAD(codigo_ibge::TEXT, 6, '0'), 6, 1) AS INT) * 2) / 10)
        ) % 10
      )
    ) % 10
  )::int AS cod_municipio
FROM temporario.tb_temp_cadunico;



REFRESH MATERIALIZED VIEW temporario.vw_cadunico_cod7;

SELECT codigo_ibge, cod_municipio
FROM temporario.vw_cadunico_cod7
LIMIT 10;

SELECT 
    v.cod_municipio AS cod_municipio_view,
    m.cod_municipio AS cod_municipio_tabela
FROM 
    temporario.vw_cadunico_cod7 v
JOIN 
    territorio.tb_municipio m 
    ON v.cod_municipio = m.cod_municipio
LIMIT 50;