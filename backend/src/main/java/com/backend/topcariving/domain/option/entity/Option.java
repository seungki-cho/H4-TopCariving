package com.backend.topcariving.domain.option.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Table("CAR_OPTION")
public class Option {

	@Id
	@Column("option_id")
	private Long optionId;

	private String category;

	@Column("category_detail")
	private String categoryDetail;

	@Column("option_name")
	private String optionName;

	@Column("option_detail")
	private String optionDetail;

	private int price;

	@Column("photo_url")
	private String photoUrl;

	@Column("parent_option_id")
	private Long parentOptionId;
}
