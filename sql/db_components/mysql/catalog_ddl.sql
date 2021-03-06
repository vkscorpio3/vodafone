-- Primary Tables

create table sbl_category_product
(
  category_product_id			varchar(80)		not null,
  product		  		        varchar(80)		null,
  sequence_number				integer			null,
  active_flag					tinyint  		null
,constraint sbl_category_product_p primary key (category_product_id)
);

create table sbl_translation
(
  translation_id				varchar(80)		not null,
  display_name					nvarchar(1024)	null,
  language_code					nvarchar(255)	null,
  language_name					nvarchar(255)	null
,constraint sbl_translation_p primary key (translation_id)
);

create table sbl_product_line
(
  product_line_id				varchar(80)		not null,
  name							nvarchar(1024)	null,
  description					nvarchar(1024)	null
,constraint sbl_product_line_p primary key (product_line_id)
);

create table sbl_key_feature
(
  key_feature_id				varchar(80)		not null,
  feature						nvarchar(255)	null,
  vendor_id						varchar(80)		null,
  vendor_location				nvarchar(1024)	null
,constraint sbl_key_feature_p primary key (key_feature_id)
);

create table sbl_literature
(
  literature_id					varchar(80)		not null,
  description					nvarchar(1024)	null,
  literature_file_date			datetime		null,
  literature_file_ext			varchar(80)		null,
  literature_file_name			nvarchar(1024)	null,
  literature_file_size			integer			null,
  name							nvarchar(1024)	null,
  sales_tool_type				nvarchar(255)	null,
  release_date					datetime		null,
  expiration_date				datetime		null,
  web_display					nvarchar(1024)	null,
  synopsis						nvarchar(1024)	null
,constraint sbl_literature_p primary key (literature_id)
);

create table sbl_recommended_product
(
  recommended_product_id		varchar(80)		not null,
  product						varchar(80)		null,
  type							nvarchar(255)	null,
  effective_from				datetime		null,
  effective_to					datetime		null
,constraint sbl_recommended_product_p primary key (recommended_product_id)
);

create table sbl_configured_attribute
(
  configured_attribute_id		varchar(80)	not null,
  attribute_definition			varchar(80)		null,
  original_id					varchar(80)		null,
  attribute_name				nvarchar(255)	null,
  display_name					nvarchar(1024)	null,
  default_value					nvarchar(255)	null,
  increment_value				nvarchar(255)	null,
  maximum_value					nvarchar(255)	null,
  minimum_value					nvarchar(255)	null,
  none_value					nvarchar(255)	null,
  unit_of_measure				nvarchar(255)	null,
  hidden_flag					tinyint			null,
  read_only_flag				tinyint			null,
  required_flag					tinyint			null,
  vector_flag					tinyint			null  
,constraint sbl_configured_attribute_p primary key (configured_attribute_id)
);

create table sbl_attribute
(
  attribute_id					varchar(80)	not null,
  original_id					varchar(80)		null,
  name							nvarchar(255)	null,
  description					nvarchar(1024)	null,
  domain_type					nvarchar(255)	null,
  data_type						nvarchar(255)	null,
  maximum_value					nvarchar(255)	null,
  minimum_value					nvarchar(255)	null,
  unit_of_measure				nvarchar(255)	null,
  attribute_definition_id		varchar(80)		null  
,constraint sbl_attribute_p primary key (attribute_id)
);

create table sbl_attribute_value
(
  attribute_value_id			varchar(80)	not null,
  attribute_value				nvarchar(1024)	null,
  sequence						integer			null  
,constraint sbl_attribute_value_p primary key (attribute_value_id)
);

create table sbl_simple_bundle_structure
(
  simple_bundle_struct_id		varchar(80)		not null
,constraint sbl_simple_bundle_structure_p primary key (simple_bundle_struct_id)
);

create table sbl_config_product_structure
(
  config_prod_struct_id			varchar(80)		not null
,constraint sbl_config_product_structure_p primary key (config_prod_struct_id)
);

create table sbl_promotion_structure
(
  promotion_struct_id			varchar(80)		not null,
  adjustment_charge				nvarchar(255)	null,
  adjustment_reason				nvarchar(1024)	null,
  charge_basis					nvarchar(1024)	null,
  commit_flag					tinyint			null,
  end_date						datetime		null,
  grace_period					integer			null,
  grace_period_uom				nvarchar(255)	null,
  instance						nvarchar(255)	null,
  nrc_amount					numeric(19,7)	null,
  nrc_currency_code				nvarchar(255)	null,
  nrc_exchange_date				datetime		null,
  nrc_plan_id					varchar(80)		null,
  nrc_plan_name					nvarchar(1024)	null,
  nrc_quantity					integer			null,
  nrc_schedule					nvarchar(255)	null,
  nrc_schedule_id				varchar(80)		null,
  period						integer			null,
  period_uom					nvarchar(255)	null,
  promotion						varchar(80)		null,
  promotion_type				nvarchar(255)	null,
  rc_adjustment_amount			numeric(19,7)	null,
  rc_adjustment_um				nvarchar(255)	null,
  rc_amount						numeric(19,7)	null,
  rc_amount_curr_code			nvarchar(255)	null,
  rc_amount_exch_date			datetime		null,
  rc_schedule					nvarchar(255)	null,
  rc_schedule_id				varchar(80)		null,
  reason						nvarchar(1024)	null,
  sales_product_flag			tinyint			null,
  score							integer			null,
  start_date					datetime		null,
  usage_plan_id					varchar(80)		null,
  usage_plan_name				nvarchar(1024)	null,
  usage_schedule				nvarchar(255)	null,
  usage_schedule_id				varchar(80)		null
,constraint sbl_promotion_structure_p primary key (promotion_struct_id)
);

create table sbl_relationship
(
  relationship_id				varchar(80)		not null,
  name							nvarchar(1024)	null,
  display_name					nvarchar(1024)	null,
  class							varchar(80)		null,
  class_name					nvarchar(1024)	null,
  default_product				varchar(80)		null,
  minimum_cardinality			integer			null,
  maximum_cardinality			integer			null,
  default_cardinality			integer			null
,constraint sbl_relationship_p primary key (relationship_id)
);

create table sbl_relationship_domain
(
  relationship_domain_id		varchar(80)		not null,
  product						varchar(80)		null,
  name							nvarchar(1024)	null,
  display_name					nvarchar(1024)	null,
  description					nvarchar(1024)	null
,constraint sbl_relationship_domain_p primary key (relationship_domain_id)
);

create table sbl_promotion_relationship
(
  relationship_id				varchar(80)		not null,
  promotion						varchar(80)		null,
  product						varchar(80)		null,
  product_line					varchar(80)		null,
  class_name					nvarchar(1024)	null,
  class_version					nvarchar(255)	null,
  minimum_quantity				integer			null,
  maximum_quantity				integer			null,
  default_quantity				integer			null,
  type							nvarchar(255)	null,
  integration_id				varchar(80)		null
,constraint sbl_promotion_relationship_p primary key (relationship_id)
);

create table sbl_promo_prod_attr_override
(
  promo_prod_attr_override_id	varchar(80)		not null,
  attribute_name				nvarchar(1024)	null,
  condition_clause				nvarchar(1024)	null,
  promotion_item_id				varchar(80)		null
,constraint sbl_promo_prod_attr_override_p primary key (promo_prod_attr_override_id)
);

create table sbl_promo_prod_attr_over_val
(
  promo_prod_attr_over_val_id	varchar(80)		not null,
  promo_item_attr_id			varchar(80)		null,
  attribute_value				nvarchar(1024)	null
,constraint sbl_promo_prod_attr_over_val_p primary key (promo_prod_attr_over_val_id)
);

create table sbl_promo_prod_agg_defaults
(
  promo_prod_agg_default_id		varchar(80)		not null,
  default_cardinality			integer			null,
  parent_class_id				varchar(80)		null,
  product						varchar(80)		null,
  type							nvarchar(255)	null
,constraint sbl_promo_prod_agg_defaults_p primary key (promo_prod_agg_default_id)
);

create table sbl_promo_pricing_rule
(
  pricing_rule_id				varchar(80)		not null,
  matrix_rule_number			nvarchar(255)	null,
  adjustment_group_id			varchar(80)		null,
  adjustment_type				nvarchar(255)	null,
  adjustment_value				numeric(16,7)	null,
  class_name					nvarchar(1024)	null,
  class_version					varchar(80)		null,
  product						varchar(80)		null,
  product_line					varchar(80)		null,
  promotion						varchar(80)		null,
  type							nvarchar(255)	null,
  currency_code					nvarchar(255)	null,
  exchange_date					datetime		null
,constraint sbl_promo_pricing_rule_p primary key (pricing_rule_id)
);

create table sbl_promotion_term
(
  term_id						varchar(80)		not null,
  description					nvarchar(1024)	null,
  name							nvarchar(1024)	null,
  section						nvarchar(255)	null,
  sequence_number				integer			null,
  term_template_id				varchar(80)		null,
  type							nvarchar(255)	null
,constraint sbl_promotion_term_p primary key (term_id)
);

create table sbl_promotion_upgrade
(
  upgrade_id					varchar(80)		not null,
  original_promotion			varchar(80)		null,
  target_promotion				varchar(80)		null,
  commitment_start				nvarchar(255)	null,
  duration						nvarchar(255)	null,
  penalty_amount				numeric(16,7)	null,
  penalty_amount_curr_code		nvarchar(255)	null,
  penalty_amount_exch_date		datetime		null,
  prorate_plan_id				varchar(80)		null,
  prorate_plan_name				nvarchar(1024)	null,
  relationship_type				nvarchar(255)	null
,constraint sbl_promotion_upgrade_p primary key (upgrade_id)
);

create table sbl_promotion_version
(
  version_id					varchar(80)		not null,
  created						datetime		null,
  active_flag					tinyint			null,
  promotion_end_date			datetime		null,
  promotion						varchar(80)		null,
  promotion_object_id			varchar(80)		null,
  released_flag					tinyint			null,
  promotion_start_date			datetime		null,
  version						nvarchar(255)	null
,constraint sbl_promotion_version_p primary key (version_id)
);

create table sbl_product_class
(
  class_id						varchar(80)		not null,
  name							nvarchar(1024)	null,
  parent_class_id				varchar(80)		null,
  parent_class_name				nvarchar(1024)	null
,constraint sbl_product_class_p primary key (class_id)
);

-- Auxilary Tables

create table sbl_catalog
(
  catalog_id					varchar(80)		not null,
  active    					tinyint			null,
  catalog_type					nvarchar(255)	null,
  description					nvarchar(1024)	null,
  start_date					datetime		null,
  end_date						datetime		null,
  private_flag 					tinyint			null,
  sequence_number				integer			null
,constraint sbl_catalog_p primary key (catalog_id)
,constraint sbl_catalog_f foreign key (catalog_id) references dcs_catalog (catalog_id)
);

create table sbl_catalog_media
(
  catalog_id					varchar(80)		not null,
  thumbnail_image_id			varchar(80)		null
,constraint sbl_catalog_media_p primary key (catalog_id)
,constraint sbl_catalog_media_f foreign key (catalog_id) references dcs_catalog (catalog_id)
,constraint sbl_catalog_media_f_t foreign key (thumbnail_image_id) references dcs_media (media_id)
);

create table sbl_category
(
  category_id					varchar(80)		not null,
  active_flag   				tinyint			null,
  count							integer			null,
  private_flag   				tinyint			null,
  root_category_flag   			tinyint			null,
  sequence_number				integer			null,
  category_usage				nvarchar(1024)	null,
  parent_category_id			varchar(80) 	null
,constraint sbl_category_p primary key (category_id)
,constraint sbl_category_f foreign key (category_id) references dcs_category (category_id)
);

create table sbl_product
(
  product_id					varchar(80)		not null,
  siebel_type					integer			not null,
  quantity   					integer			null,
  product_cfg_model_id			varchar(80)		null,
  inclusive_eligibility_flag	tinyint			null,
  integration_id				varchar(80)		null,
  orderable						tinyint			null,
  part							nvarchar(1024)	null,
  price_list_id					varchar(80)		null,
  product_def_type_code			integer			null,
  product_type_code				integer			null,
  unit_of_measure				nvarchar(255)	null,
  vendor_integration_id			varchar(80)		null,
  class							varchar(80)		null,
  price_type					integer			null,
  active						tinyint			null,
  simple_bundle_struct_id		varchar(80)		null,
  config_prod_struct_id			varchar(80)		null,
  promotion_struct_id			varchar(80)		null
,constraint sbl_product_p primary key (product_id)
,constraint sbl_product_f foreign key (product_id) references dcs_product (product_id)
);

create table sbl_media_external
(
  media_id						varchar(80)		not null,
  media_size	   				integer			null
,constraint sbl_media_external_p primary key (media_id)
,constraint sbl_media_external_f foreign key (media_id) references dcs_media (media_id)
);

create table sbl_promotion_struct_media
(
  promotion_struct_id			varchar(80)		not null,
  large_image_id	   			varchar(80)		null,
  thumbnail_image_id	   		varchar(80)		null
,constraint sbl_promotion_struct_media_p primary key (promotion_struct_id)
,constraint sbl_promotion_struct_media_f foreign key (promotion_struct_id) references sbl_promotion_structure (promotion_struct_id)
,constraint sbl_promotion_struct_media_f_l foreign key (large_image_id) references dcs_media (media_id)
,constraint sbl_promotion_struct_media_f_t foreign key (thumbnail_image_id) references dcs_media (media_id)
);

-- Multi Tables

create table sbl_catalog_translation
(
  catalog_id					varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_catalog_translation_p primary key (catalog_id,translation_id)
,constraint sbl_catalog_translation_f foreign key (catalog_id) references dcs_catalog (catalog_id)
,constraint sbl_catalog_translation_f_t foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_category_translation
(
  category_id					varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_category_translation_p primary key (category_id,translation_id)
,constraint sbl_category_translation_f foreign key (category_id) references dcs_category (category_id)
,constraint sbl_category_translation_f_t foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_category_products
(
  category_id					varchar(80)		not null,
  category_product_id			varchar(80)		not null
,constraint sbl_category_products_p primary key (category_id,category_product_id)
,constraint sbl_category_products_f foreign key (category_id) references dcs_category (category_id)
,constraint sbl_category_products_f_c foreign key (category_product_id) references sbl_category_product (category_product_id)
);

create table sbl_product_translation
(
  product_id					varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_product_translation_p primary key (product_id,translation_id)
,constraint sbl_product_translation_f foreign key (product_id) references dcs_product (product_id)
,constraint sbl_product_translation_f_t foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_prod_product_line
(
  product_id					varchar(80)		not null,
  product_line_id				varchar(80)		not null
,constraint sbl_prod_product_line_p primary key (product_id,product_line_id)
,constraint sbl_prod_product_line_f foreign key (product_id) references dcs_product (product_id)
,constraint sbl_prod_product_line_f_p foreign key (product_line_id) references sbl_product_line (product_line_id)
);

create table sbl_product_feature
(
  product_id					varchar(80)		not null,
  key_feature_id				varchar(80)		not null
,constraint sbl_product_feature_p primary key (product_id,key_feature_id)
,constraint sbl_product_feature_f foreign key (product_id) references dcs_product (product_id)
,constraint sbl_product_feature_f_k foreign key (key_feature_id) references sbl_key_feature (key_feature_id)
);

create table sbl_product_literature
(
  product_id					varchar(80)		not null,
  literature_id					varchar(80)		not null
,constraint sbl_product_literature_p primary key (product_id,literature_id)
,constraint sbl_product_literature_f foreign key (product_id) references dcs_product (product_id)
,constraint sbl_product_literature_f_l foreign key (literature_id) references sbl_literature (literature_id)
);

create table sbl_product_rec_prod
(
  product_id					varchar(80)		not null,
  recommended_product_id		varchar(80)		not null
,constraint sbl_product_rec_prod_p primary key (product_id,recommended_product_id)
,constraint sbl_product_rec_prod_f foreign key (product_id) references dcs_product (product_id)
,constraint sbl_product_rec_prod_f_r foreign key (recommended_product_id) references sbl_recommended_product (recommended_product_id)
);

create table sbl_product_config_attr
(
  product_id					varchar(80)		not null,
  configured_attribute_id		varchar(80)		not null
,constraint sbl_product_config_attr_p primary key (product_id,configured_attribute_id)
,constraint sbl_product_config_attr_f foreign key (product_id) references dcs_product (product_id)
,constraint sbl_product_config_attr_f_c foreign key (configured_attribute_id) references sbl_configured_attribute (configured_attribute_id)
);

create table sbl_attribute_translation
(
  attribute_id					varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_attribute_translation_p primary key (attribute_id,translation_id)
,constraint sbl_attribute_translation_f foreign key (attribute_id) references sbl_attribute (attribute_id)
,constraint sbl_attribute_translation_f_t foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_attr_attr_value
(
  attribute_id					varchar(80)		not null,
  attribute_value_id			varchar(80)		not null
,constraint sbl_attr_attr_value_p primary key (attribute_id,attribute_value_id)
,constraint sbl_attr_attr_value_f foreign key (attribute_id) references sbl_attribute (attribute_id)
,constraint sbl_attr_attr_value_f_a foreign key (attribute_value_id) references sbl_attribute_value (attribute_value_id)
);

create table sbl_attr_val_translation
(
  attribute_value_id			varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_attr_val_translation_p primary key (attribute_value_id,translation_id)
,constraint sbl_attr_val_translation_f foreign key (attribute_value_id) references sbl_attribute_value (attribute_value_id)
,constraint sbl_attr_val_translation_f_a foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_simple_bundle_struct_rel
(
  simple_bundle_struct_id		varchar(80)		not null,
  relationship_id				varchar(80)		not null
,constraint sbl_simple_bun_struct_rel_p primary key (simple_bundle_struct_id,relationship_id)
,constraint sbl_simple_bun_struct_rel_f foreign key (simple_bundle_struct_id) references sbl_simple_bundle_structure (simple_bundle_struct_id)
,constraint sbl_simple_bun_struct_rel_f_r foreign key (relationship_id) references sbl_relationship (relationship_id)
);

create table sbl_config_prod_media
(
  config_prod_struct_id			varchar(80)		not null,
  decoration_id	   				varchar(80)		null
,constraint sbl_config_prod_media_p primary key (config_prod_struct_id,decoration_id)
,constraint sbl_config_prod_media_f foreign key (config_prod_struct_id) references sbl_config_product_structure (config_prod_struct_id)
,constraint sbl_config_prod_media_f_d foreign key (decoration_id) references dcs_media (media_id)
);

create table sbl_config_prod_struct_rel
(
  config_prod_struct_id			varchar(80)		not null,
  relationship_id				varchar(80)		not null
,constraint sbl_config_prod_struct_rel_p primary key (config_prod_struct_id,relationship_id)
,constraint sbl_config_prod_struct_rel_f foreign key (config_prod_struct_id) references sbl_config_product_structure (config_prod_struct_id)
,constraint sbl_config_prod_struct_rel_f_r foreign key (relationship_id) references sbl_relationship (relationship_id)
);

create table sbl_promotion_struct_rel
(
  promotion_struct_id			varchar(80)		not null,
  relationship_id				varchar(80)		not null
,constraint sbl_promotion_struct_rel_p primary key (promotion_struct_id,relationship_id)
,constraint sbl_promotion_struct_rel_f foreign key (promotion_struct_id) references sbl_promotion_structure (promotion_struct_id)
,constraint sbl_promotion_struct_rel_f_r foreign key (relationship_id) references sbl_promotion_relationship (relationship_id)
);

create table sbl_promo_struct_pricing_rule
(
  promotion_struct_id			varchar(80)		not null,
  promotion_pricing_rule_id		varchar(80)		not null
,constraint sbl_promo_struct_pri_rule_p primary key (promotion_struct_id,promotion_pricing_rule_id)
,constraint sbl_promo_struct_pri_rule_f foreign key (promotion_struct_id) references sbl_promotion_structure (promotion_struct_id)
,constraint sbl_promo_struct_pri_rule_f_p foreign key (promotion_pricing_rule_id) references sbl_promo_pricing_rule (pricing_rule_id)
);

create table sbl_promotion_struct_msg
(
  promotion_struct_id			varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_promotion_struct_msg_p primary key (promotion_struct_id,translation_id)
,constraint sbl_promotion_struct_msg_f foreign key (promotion_struct_id) references sbl_promotion_structure (promotion_struct_id)
,constraint sbl_promotion_struct_msg_f_m foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_promotion_struct_term
(
  promotion_struct_id			varchar(80)		not null,
  term_id						varchar(80)		not null
,constraint sbl_promotion_struct_term_p primary key (promotion_struct_id,term_id)
,constraint sbl_promotion_struct_term_f foreign key (promotion_struct_id) references sbl_promotion_structure (promotion_struct_id)
,constraint sbl_promotion_struct_term_f_t foreign key (term_id) references sbl_promotion_term (term_id)
);

create table sbl_promotion_struct_upgrade
(
  promotion_struct_id			varchar(80)		not null,
  upgrade_id					varchar(80)		not null
,constraint sbl_promo_struct_upgrade_p primary key (promotion_struct_id,upgrade_id)
,constraint sbl_promo_struct_upgrade_f foreign key (promotion_struct_id) references sbl_promotion_structure (promotion_struct_id)
,constraint sbl_promo_struct_upgrade_f_u foreign key (upgrade_id) references sbl_promotion_upgrade (upgrade_id)
);

create table sbl_promotion_struct_version
(
  promotion_struct_id			varchar(80)		not null,
  version_id					varchar(80)		not null
,constraint sbl_promo_struct_version_p primary key (promotion_struct_id,version_id)
,constraint sbl_promo_struct_version_f foreign key (promotion_struct_id) references sbl_promotion_structure (promotion_struct_id)
,constraint sbl_promo_struct_version_f_v foreign key (version_id) references sbl_promotion_version (version_id)
);

create table sbl_relationship_translation
(
  relationship_id				varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_rel_translation_p primary key (relationship_id,translation_id)
,constraint sbl_rel_translation_f foreign key (relationship_id) references sbl_relationship (relationship_id)
,constraint sbl_rel_translation_f_t foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_relationship_domains
(
  relationship_id				varchar(80)		not null,
  relationship_domain_id		varchar(80)		not null
,constraint sbl_relationship_domains_p primary key (relationship_id,relationship_domain_id)
,constraint sbl_relationship_domains_f foreign key (relationship_id) references sbl_relationship (relationship_id)
,constraint sbl_relationship_domains_f_r foreign key (relationship_domain_id) references sbl_relationship_domain (relationship_domain_id)
);

create table sbl_relationship_media
(
  relationship_id				varchar(80)		not null,
  relationship_decoration_id	varchar(80)		not null
,constraint sbl_relationship_media_p primary key (relationship_id,relationship_decoration_id)
,constraint sbl_relationship_media_f foreign key (relationship_id) references sbl_relationship (relationship_id)
,constraint sbl_relationship_media_f_r foreign key (relationship_decoration_id) references dcs_media (media_id)
);

create table sbl_promo_rel_attr_overrides
(
  relationship_id				varchar(80)		not null,
  promo_prod_attr_override_id	varchar(80)		not null
,constraint sbl_promo_rel_attr_over_p primary key (relationship_id,promo_prod_attr_override_id)
,constraint sbl_promo_rel_attr_over_f foreign key (relationship_id) references sbl_promotion_relationship (relationship_id)
,constraint sbl_promo_rel_attr_over_f_p foreign key (promo_prod_attr_override_id) references sbl_promo_prod_attr_override (promo_prod_attr_override_id)
);

create table sbl_promo_rel_prod_msg
(
  relationship_id				varchar(80)		not null,
  translation_id				varchar(80)		not null
,constraint sbl_promo_rel_prod_msg_p primary key (relationship_id,translation_id)
,constraint sbl_promo_rel_prod_msg_f foreign key (relationship_id) references sbl_promotion_relationship (relationship_id)
,constraint sbl_promo_rel_prod_msg_f_p foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_promo_rel_agg_def_prod
(
  relationship_id				varchar(80)		not null,
  promo_prod_agg_default_id		varchar(80)		not null
,constraint sbl_promo_rel_agg_def_prod_p primary key (relationship_id,promo_prod_agg_default_id)
,constraint sbl_promo_rel_agg_def_prod_f foreign key (relationship_id) references sbl_promotion_relationship (relationship_id)
,constraint sbl_promo_rel_agg_def_prod_f_r foreign key (promo_prod_agg_default_id) references sbl_promo_prod_agg_defaults (promo_prod_agg_default_id)
);

create table sbl_prod_attr_override_values
(
  promo_prod_attr_override_id		varchar(80)	not null,
  promo_prod_attr_over_val_id		varchar(80)	not null
,constraint sbl_prod_attr_over_values_p primary key (promo_prod_attr_override_id,promo_prod_attr_over_val_id)
,constraint sbl_prod_attr_over_values_f foreign key (promo_prod_attr_override_id) references sbl_promo_prod_attr_override (promo_prod_attr_override_id)
,constraint sbl_prod_attr_over_values_f_p foreign key (promo_prod_attr_over_val_id) references sbl_promo_prod_attr_over_val (promo_prod_attr_over_val_id)
);

create table sbl_prod_class_translation
(
  class_id							varchar(80)	not null,
  translation_id					varchar(80)	not null
,constraint sbl_prod_class_translation_p primary key (class_id,translation_id)
,constraint sbl_prod_class_translation_f foreign key (class_id) references sbl_product_class (class_id)
,constraint sbl_prod_class_translation_f_t foreign key (translation_id) references sbl_translation (translation_id)
);

create table sbl_prod_class_conf_attr
(
  class_id							varchar(80)	not null,
  configured_attribute_id			varchar(80)	not null
,constraint sbl_prod_class_conf_attr_p primary key (class_id,configured_attribute_id)
,constraint sbl_prod_class_conf_attr_f foreign key (class_id) references sbl_product_class (class_id)
,constraint sbl_prod_class_conf_attr_f_t foreign key (configured_attribute_id) references sbl_configured_attribute (configured_attribute_id)
);
