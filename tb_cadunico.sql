CREATE TABLE dados_gerais.tb_cadunico AS
SELECT
    vw.cod_municipio,
    tp.referencia,
    tp.UF,
    tp.qtde_familias_nbf_rede,
    tp.qtde_familias_nbf_fossa_septica,
    tp.qtde_familias_nbf_fossa_rudimentar,
    tp.qtde_familias_nbf_vala,
    tp.qtde_familias_nbf_riolagomar,
    tp.qtde_familias_nbf_outras_formas,
    tp.qtde_familias_nbf_sem_info,
    tp.qtde_familias_bf_rede,
    tp.qtde_familias_bf_fossa_septica,
    tp.qtde_familias_bf_fossa_rudimentar,
    tp.qtde_familias_bf_vala,
    tp.qtde_familias_bf_riolagomar,
    tp.qtde_familias_bf_outras_formas,
    tp.qtde_familias_bf_sem_info,
    tp.qtde_familias_rede_geral,
    tp.qtde_familias_poco_nascente,
    tp.qtde_familias_cisterna,
    tp.qtde_familias_outras_formas,
    tp.qtde_familias_sem_info,
    tp.qtde_familias_pobreza_urbana,
    tp.qtde_familias_ate_meio_sm_urbana,
    tp.qtde_familias_acima_meio_sm_urbana,
    tp.percentual_familias_pobreza_baixa_renda_urbana,
    tp.qtde_familias_pobreza_rural,
    tp.qtde_familias_ate_meio_sm_rural,
    tp.qtde_familias_acima_meio_sm_rural,
    tp.percentual_familias_pobreza_baixa_renda_rural,
    tp.nome_municipio
FROM temporario.tb_temp_cadunico tp
LEFT JOIN temporario.vw_cadunico_cod7 vw
  ON tp.codigo_ibge = vw.codigo_ibge;

SELECT * FROM dados_gerais.tb_cadunico;    