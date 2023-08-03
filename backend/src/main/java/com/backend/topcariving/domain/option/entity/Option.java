package com.backend.topcariving.domain.option.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Table("CAR_OPTION")
public class Option {

	@Id
	private Long carOptionId;

	private String category;

	private String categoryDetail;

	private String optionName;

	private String optionDetail;

	private int price;

	private String photoUrl;

	private Long parentOptionId;
}
