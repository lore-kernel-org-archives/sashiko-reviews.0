Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2C318ECD
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783193; cv=none; b=RAexyjCtAC1UMkPVM30QRwTZ7aa9W40AdX/D8Ji+9O/rF/r5mkZVYwfN6RQ8lEuHeDgSx+xCf5HSE2+IKQinhVBlFMoa5DZ4U5hvNx09gwqhWzII1zCt8gBivjtVlIniqmYZ0Pd9TiqVgGHP1K5AQN2yGzfzJzBOc4yWPgkKo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783193; c=relaxed/simple;
	bh=ocUUV2GsC2FgvGcbHUMW0RoFvDZhShrGNrCCLkHdeS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZY9YOGSDPrJhgftLPHLk3LlP7J144ze7/Kg1do6dLkRV7tjW6tdqQus7s63BxSJ8nDwY+YM7iKVCLbJ7AaiGRfsTqOVRfZKQ5x6gkcDZpnUEIkllpS4//S1RxDalaWwBRHHSugk9w6GBH7pRuzI/UXCDy4qCcbf/hQsg8YXBkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFQPlf9Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5O4RaSr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFQPlf9Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5O4RaSr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUX62841062
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eWyz0bm6QQ0/5uAMB1IflY62dp+iLMo2hK5d5t3vGYE=; b=FFQPlf9Q127YGKAZ
	GlkNtoT5nWHk5EmbnHqrK4+RjzmsWRhsSwZtHRDYa1lmDYR584xqePWnVxOcRo6f
	dim/uLEmUhjKIeme3KwDqbKaMHkgtJEK5ybMpNjBNHPOeSkAJuH/57Yj0HWwLpkO
	JW3UCA8jShl3mKp+pZmIcCCG5VXyfmzVu7s97BaioYYm7NHok/GyOK7+3ATuwo9k
	GFR6cjefV5jPAo9wMky3pXMkwjCfI29sZrgHqH5qTIzNyo2CN45+YShxlDqrsIz5
	5a45G6ALeai3MlYzYl16t2Xwkm+deWbhW3QhHDeroodo80TcdiygppGWCoi1ClqJ
	mJmO8A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899trb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:26:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4530a90fdso193806735ad.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778783189; x=1779387989; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWyz0bm6QQ0/5uAMB1IflY62dp+iLMo2hK5d5t3vGYE=;
        b=M5O4RaSrixU3VAJ4wdfwQJtQi4Xc8oUefASwJRd84gUyIEJcdR1O0etG/hemPDX6Dy
         jbssNA+HVsOJ52/UQ2WSkQyAJpzqBgqVTg5r2cKITpHe4HN+fHOtLXxZOXry25sb2jA8
         uSHcNH9QRIS9SQgEOsVerhPoZ3e979gdtvih6pjrHzarSmGBv/xkv3nuYZkeNIA/a7eL
         8i2iLlegNfD/v8wtubiaaL1bwZTRyw3Y4Z5tdgvfqFVz4PeZMYd3QpahrpyErqSMzuvf
         zm/+Eiy3rOec0XG4K3II/jtCO9OTNFxcHe9ToymJuBVwcY6SzbZiOCoCU+aXMWb0jcmE
         qemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783189; x=1779387989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWyz0bm6QQ0/5uAMB1IflY62dp+iLMo2hK5d5t3vGYE=;
        b=sYTKlQP1z/V6AxcShYJS5f2w/QJQiV1e4MKLcrFhlXMbCfgs0y+bqk5G7Gujxo/DEl
         RBnOEMgg77UTaipNbkTlG9fahePDts0Xd0qcdzdjvytG0B55tyBOPinZhn/osISiztbR
         epzV5nWR7KzIjxWeapasmaroYo0V7tmL1pvE7TIDN7pEqDDjgpemdS5yMxw+uiuYTyW+
         ro/KBijEb6eJgaH9XongQZnMevVJBtXEqO6a5r2tq5RcFB3Jp6TyY665wzJXq4GegVsd
         fnDttt/d82Bm0I/yRr9PbngNWjaLxnCYZ+nhNMJX8K7BNOe0IWqy5o9BHTewFPUpwnbd
         KnpQ==
X-Gm-Message-State: AOJu0YzeuBUjXgTtotvLsQCJnfMolqIwB/DbrXLow6VjeS7MpjbAbtv8
	oFVB/o+fo7en7UC1tESOfCyvAD/q+DZQsDuvfu/zpQ+F2BuC0o4rWq5tAKaQgRvPPQkalVgP8Wx
	AWfyjOQWzZUhKOAOqOtqPLmjd69YQH+CNXeP0DRnHPJWAyKyW4PpVsgrCBPP/lZaFXSUskHk9jr
	LAnxI=
X-Gm-Gg: Acq92OFdSsaMag1U3bBl1AxK7JV5OIrCOS66mRIS14D2kRtYqynzHyLbpnMroli+fFg
	pa3yfNMeUtbiLaHQCMeFroeytv2XF7tMYoJk3icfdLTB25vviKRJQGN5a3+/zpcwdKYEaKvXVUG
	wpU5lErev47LsHBrI6MzYdgJ5RAmnAnoCIgugF19XOrImdvU8+xQoGFUn2O1FNedPX+79inRUXm
	J5keMV8r3sQQPQ4KnLHL4MIZfhOux3wj7XApKdZDgUrnCA+nq/pAX5s9eOcUznceNZIec5paXW+
	QME6CskUvuMdkVZexCAyry3mxHR9+8kRsrgKkliLeY2PTqmvOuzDHpOqngZbhywqYBIX/2hFpXW
	PCP/3AZp1yEZnHOlQV0FWviv+xgxiR2NqFJJPwS/a5nacRw7JSWYxkwyYH4xInIul9A==
X-Received: by 2002:a17:902:b181:b0:2bc:6784:5260 with SMTP id d9443c01a7336-2bd7e966018mr5256085ad.37.1778783189372;
        Thu, 14 May 2026 11:26:29 -0700 (PDT)
X-Received: by 2002:a17:902:b181:b0:2bc:6784:5260 with SMTP id d9443c01a7336-2bd7e966018mr5255935ad.37.1778783188908;
        Thu, 14 May 2026 11:26:28 -0700 (PDT)
Received: from [192.168.1.4] ([122.177.247.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f749sm32831495ad.20.2026.05.14.11.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 11:26:28 -0700 (PDT)
Message-ID: <5019be04-2800-4f01-96ba-a64ac13d4364@oss.qualcomm.com>
Date: Thu, 14 May 2026 23:56:23 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>
References: <20260512-glymur_camcc-v3-2-a7196fee2779@oss.qualcomm.com>
 <20260513215441.E17B8C19425@smtp.kernel.org>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260513215441.E17B8C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE4NCBTYWx0ZWRfX5nIyvfSPRZnW
 JiNoh3kYERKHwFRW35p0Q41OmikoHhuDzRDO8QQTQQwKYSX4CsMcJLnBZiRECb95HRx7qisdOFf
 hGM9gqAKbGhbZkZ2u+UiqtbrOkkdfqqr9whNNpE/4sLtSxZOduEPL6K7BYpjdh9ONWoBfJdtcYm
 3xGjJZxLCAAKtkH7ic8GTFITj3V7exwLnw11ToBL235px2FoO241tvTOdYmGxECXmsqVNP+iPh6
 dk4cTo2LIDoITIiJ9Y1q5Sl4/duZ74lQZ4QSuwFcXBkLG+FFXfjuoLtv3+mNRDxu2SMJLsGkvTI
 A5vwQEAIp92USsW8LcuI6TpdVjMA+bUMaFLUPVJ0AZRx9ZE57lH+xmlhD99+njl/U+0SewttmMA
 98AnVBlI7KVqR+GyoVZelGqWqA9OQqAy9dfBGhEmQ1L3askcYsWhhF/HLwfjdRtMmOAAhuum/7l
 ZTCp5QVTFQC0bJlpegw==
X-Proofpoint-ORIG-GUID: GDDdW1CKl3s8sIF5b6hXuQpKVOhFX53c
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a0613d6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=TsyavLd573QUvrMOwheqKA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zW_1G7NrSvYEZv8OMdsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: GDDdW1CKl3s8sIF5b6hXuQpKVOhFX53c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140184



On 5/14/2026 3:24 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Incorrect hardware clock mapping for P_CAM_CC_PLL2_OUT_EVEN in cam_cc_parent_data_1.
> - [High] Mismatch between parent map and frequency table for cam_cc_xo_clk_src leading to clock configuration failure.
> - [High] Inconsistent hardware register offsets for CSI4 clocks.
> - [Medium] Cross-Config Consistency Kconfig violation for CLK_GLYMUR_CAMCC.
> --
> 
> commit 5405dbfa49980ee6b2cd4bb1348b52c906b3f710
> Author: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> clk: qcom: camcc-glymur: Add camera clock controller driver
> 
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index df21ef5ffd686..754c3b823f3f8 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -45,6 +45,17 @@ config CLK_ELIZA_TCSRCC
>>  	  Support for the TCSR clock controller on Eliza devices.
>>  	  Say Y if you want to use peripheral devices such as USB/PCIe/UFS.
>>  
>> +config CLK_GLYMUR_CAMCC
>> +	tristate "Glymur Camera Clock Controller"
>> +	depends on ARM64 || COMPILE_TEST
>> +	select CLK_GLYMUR_GCC
>> +	default m if ARCH_QCOM
> 
> This isn't a bug, but is it intentional to use default m if ARCH_QCOM here?
> Existing sibling configurations for the same SoC family (such as
> CLK_GLYMUR_DISPCC and CLK_GLYMUR_GPUCC) omit this default.
> 

Yes, it is intentional. Existing sibling defconfigs were part of separate arm64
defconfig file, but the recent convention is to enable the defconfig from Kconfig
itself.

>> +	help
>> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> 
> [ ... ]
> 
>> diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-glymur.c
>> new file mode 100644
>> index 0000000000000..b21e6830a72b4
>> --- /dev/null
>> +++ b/drivers/clk/qcom/camcc-glymur.c
>> @@ -0,0 +1,2280 @@
> 
> [ ... ]
> 
>> +static const struct parent_map cam_cc_parent_map_1[] = {
>> +	{ P_BI_TCXO, 0 },
>> +	{ P_CAM_CC_PLL2_OUT_EVEN, 3 },
>> +	{ P_CAM_CC_PLL2_OUT_MAIN, 5 },
>> +};
>> +
>> +static const struct clk_parent_data cam_cc_parent_data_1[] = {
>> +	{ .index = DT_BI_TCXO },
>> +	{ .hw = &cam_cc_pll2.clkr.hw },
>> +	{ .hw = &cam_cc_pll2.clkr.hw },
> 
> Does this correctly map the EVEN and MAIN outputs? Both are currently mapped
> to the undivided &cam_cc_pll2.clkr.hw structure, and it appears the
> cam_cc_pll2_out_even post-divider structure is missing from the file
> entirely.
> 

Yes, no need to define separate even and odd outputs here since they are
unused and only pll2 main output is used to derive the clk frequencies.

> Other PLLs like PLL0 and PLL1 have proper post-divider structures defined
> for their EVEN outputs. Could this cause the framework to miscalculate
> the rate of the EVEN output by treating it as the full MAIN frequency?
> 
>> +};
> 
> [ ... ]
> 
>> +static struct clk_rcg2 cam_cc_xo_clk_src = {
>> +	.cmd_rcgr = 0x13948,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
>> +	.parent_map = cam_cc_parent_map_6_ao,
>> +	.freq_tbl = ftbl_cam_cc_xo_clk_src,
> 
> Will this configuration cause rate operations on cam_cc_xo_clk_src to fail?
> The frequency table relies on P_BI_TCXO, but the mapped
> cam_cc_parent_map_6_ao only contains P_BI_TCXO_AO:
> 
> static const struct parent_map cam_cc_parent_map_6_ao[] = {
> 	{ P_BI_TCXO_AO, 0 },
> };
> 
> When the clock framework searches for the source, qcom_find_src_index()
> might return -ENOENT.
> 

Will fix the frequency table to use P_BI_TCXO_AO src.

>> +	.hw_clk_ctrl = true,
> 
> [ ... ]
> 
>> +static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
>> +	.cmd_rcgr = 0x15104,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
> 
> [ ... ]
> 
>> +static struct clk_rcg2 cam_cc_csi4phytimer_clk_src = {
>> +	.cmd_rcgr = 0x15124,
>> +	.mnd_width = 0,
>> +	.hid_width = 5,
> 
> Is the .cmd_rcgr offset correct for this clock block?
> 
> The address 0x15124 is immediately sequential to the CSI1 RCGR (0x15104),
> which suggests this might actually be the CSI2 offset. Additionally, the
> corresponding branch clocks for CSI4 use .halt_reg at 0x15250 and
> 0x15254, which are spaced unusually far from the 0x15124 RCGR.
> 

There are no CSI2,3 clocks supported on Glymur HW and above address is correct
for CSI4 as per HW register layout.

Thanks,
Jagadeesh

