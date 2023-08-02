package com.backend.topcariving.domain.option.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@Schema(description = "Trim Response : 트림 정보를 반환하는 dto")
@AllArgsConstructor
public class TrimResponseDTO {

	@Schema(description = "옵션의 ID값", example = "1")
	private Long optionId;

	@Schema(description = "옵션의 카테고리 이름", example = "르블랑")
	private String categoryName;

	@Schema(description = "옵션의 가격", example = "1476000")
	private int price;

	@Schema(description = "옵션의 사진 url", example = "https://www.test.com")
	private String photoUrl;

}
