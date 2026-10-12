Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C40134EEFD
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788391; cv=none; b=U8xRcGdIrLnMlmWh9IiHl+qiiDe5tqjtE+tCb+6LqHgFPj6hPUOQZXy3VWCNe/KQ3o1VUTgbOhB4dlvgqaiZ2DQVd23sYuzAZpqmSkCu5xDIseqCYB1i3NyHgo4vYugMefvEOrfAlX5sbqs9tcTqtu22mFxvwEjPRdS2cSeWh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788391; c=relaxed/simple;
	bh=XyNUnqIeGkrl2sN+87qAS40ppnV7noHEstsY3QW47jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTu5tcK0BBYqbdwlvgvAU86sqN4+RuPzZ1CNVuueIAFAZqctyqPHFF+Y862Ao7GN6bBPSpmJ6Xzp2C9QwjKZqSDhMuRz7FsNlF6di7XJWYUaAx0Wi1if+8uaM0pMX+3BBj2DNLseHW6o2ShkAxikdrM4ekCbBwl6S/d3X0E4JgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aX+Eoz0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyxV4lkq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aX+Eoz0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyxV4lkq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55c4g1314446
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaW2KGhD8Vzo1irLVSwbI7B2RgRHueLNyNGlF/CbcPs=; b=aX+Eoz0kjufQEhsV
	kW0OtNreGrxBpIbeB1qWSlr8Is/d8vE07/FyqD33U3zWNrnH+L7ck3hEFkFeIeMC
	imTfb/irx2SiOS66yDMw+fmYwYj5xBJwrd2+wXkjJuks1cenW16rvNP3ToedbpmH
	7gqSL62LAz1v6EObv+sbF6xtEwoMS7QQjKGmLyMnMUOKDEpYUECktvtnk2aQxKQv
	mp9dB0uq0eYVfBfUXuS2nhxFPc4Yc6O8H5q7NNhP1qMRK4bIwXM7zSs2KtGrZKmA
	794WVhayetXuTpbLr9MPSiOvc5Jh3qR1TYNZbAeOWSL13GQFf1+t4DbPvW6sActb
	s7Dwlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j711f2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 06:59:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc7e0321ec1so2066820a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 11 Oct 2026 23:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788388; x=1792393188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaW2KGhD8Vzo1irLVSwbI7B2RgRHueLNyNGlF/CbcPs=;
        b=CyxV4lkqFgn0WA2K6DOutLy950dfRSRu+bK7ieHDycHtmZOdffeqKDeVWeGmAZbhv7
         Tpi5dDmq8J2rwmbUSZDImGZZvCRQ9z5/LqLgKBvRxVuiIU9hK93Ek0cqYtCVZzM52cSJ
         p+UkqU++BW3ZUDiPs+V9ecBnS5aMVXPf+j1zcTmrt/agTKVIfy2x9+gjAPWnR4vcEeu/
         /13PdHz9tqSp3oouqolZ8C8nLGd+uEPCQN32gh524igb8oUqxYzSaddYK2Nhxy39xe9E
         VI8Xs450plEu2PB67ccmavfQ3S7SSn1fsTLBKttkqnCQCMXk1qRPymyfiwUEmDdLOWbb
         kJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788388; x=1792393188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaW2KGhD8Vzo1irLVSwbI7B2RgRHueLNyNGlF/CbcPs=;
        b=sb4TWx4s65hxHgpJX1BZrnZ93/oxR7e+0aKIYJD67BGH0/qmlecQIDn1UQ5DzOP6Tz
         ldFihcLHwBs3r1xFu/S5w1VCb/8FMViTctrvzRG5whOYmVcyNpXHAFh4OtCx2q3hLNA3
         AtHirM0G+tH/y1xqDiPoparZGb1j9h0T7PHrrhMRbg+zqrUJ1d7GcyC+mwuMkzJiiOci
         52wOlDt++1kK5Zv7ebcXHCGSKQeMdXIK5dmgeMCjEIhjyKFte1VP3VCIorss2Y0iLETM
         jRnqju0PWa6E0TPfG2ZHPEW0IhzPPEF5D6/QmY3YMym3o5SZQ9lGrgSXe5M8+8beMqsP
         D0WQ==
X-Gm-Message-State: AFq9FYKlueuNJsscL4uqLvZw1jjwlvRQPnF3n/wi6KZtZ/U4NBl6TGAZ
	tScTEn1qhMp+hKfcGrc1BnNNKioTbs7vMVmqPifrBuVDRqXFJN0kAVAma3OQn+0FSghiRL0TtM+
	OIMsMsnwvN+jY56Lb5um8YNCSnuY4l0nwOU9M4NSn5NeIZK5gegZ3F9YPGBkD0dtPNmX/HL1IKA
	ycqUY+0Q==
X-Gm-Gg: AYBFou12GXahxnmecqwhnYprhevncqJenmUBlz68NSvbnQTieKXQzeppaSHowCOPrDr
	wdgJYJofmoKXSHM+T0XVbQwiGx3pikSiVpIv+7pZvdAUNY/syAFRs/U/nEEFl8D+3qcjHW+V46z
	Q9hQ37yA/TfHrui6X1d8QaDLikAt1iNiMsPWeG9lsoK/KHi9u8c0fMqRX89BZWk5jis1WuHkPg9
	Pr4Rjz9mRHXjoCUS7BUV4AlENNo//l9U7j1t+EarhX+cKsNYxNeZ1LRbU3LlPWbgCcodPHO35Qz
	8TzTHv+SXBuvslbai2I6qnU2MxY7LZ4o9Eaa21vp62CjR5zgoT7xUbSZJpMdqDROGFFw8zQt3qI
	Ww2/mtAG0IRCBhy2SovKHHzq5pR7ukpai4cIWykNJ85OsANOBLCvHEdaax9Qu7MY=
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr7530716a91.50.1791788387837;
        Sun, 11 Oct 2026 23:59:47 -0700 (PDT)
X-Received: by 2002:a17:90b:48c7:b0:3ab:8b2:72bf with SMTP id 98e67ed59e1d1-3ab3a928525mr7530698a91.50.1791788387341;
        Sun, 11 Oct 2026 23:59:47 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.161.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm17720151a91.11.2026.10.11.23.59.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:59:47 -0700 (PDT)
Message-ID: <6c7bb574-74c9-45e3-954b-b572342f9946@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:59:43 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 14/14] arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5:
 Add DT overlay
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, media-ci@linuxtv.org, robh@kernel.org, olteanv@gmail.com,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-14-04fd28d815c6@oss.qualcomm.com>
 <sashiko-outbox-167757@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-167757@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX5c1kCRunThV3
 OfmTvd4dYIB1M9OGxuhwHmo/BupEgcUcepAFWglix1ej1gMDMjsg2cawVTrQPvzwV8m5pns/xdi
 3Z3sPhesKEpCJwReOM6DnC0gzcUcmlc=
X-Proofpoint-GUID: 7AQzqTqPagzz65F-ZK9twr3VAl1hPhta
X-Proofpoint-ORIG-GUID: 7AQzqTqPagzz65F-ZK9twr3VAl1hPhta
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6acc8564 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=K/RrOd38U9TixX+j9hIN8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GJQVe2W2MQrxmwjxaooA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNyBTYWx0ZWRfX7riTAwHE6hTm
 3bD0LqlxlL9Dtgof580csdxWMrrkwX6lNtPZaTWLhWkVK72caWfk6G9RFtVUhPyfH7Yx8H1tiXq
 WhAdaOKKX7mFH3tk+WDrI4kdsDiFA0rXlSRk1kPIcwh3df58bNOxg95HpmswkugmkBYAjM8KuSM
 LiHo2vCbpkb0JjWQufhW2D50MtlUoDUpV+1EzZCgmSrLxrP0uW0AogjyL3V0lHOABZCWexxBws7
 mviAB0HHRPVcy+jRb1xpaaQm5lWsYtCwmDP0hQ/WVbjjsb7Fnmxrfw5d5TyY3J4e3nvbOpApEn9
 vsR/8x2tSFKnK5pScXhjmYGDem6YE8LGxevzV3LjIyTx5b+16IIK3pw7bdgM/kvt2p/sK12I8pf
 2/GVDghyWYckUfqZoqRy4cK4bstJ/xfdaWs79bkOSw78AeqJBEE8fX1tUyohIFxYXph7e+563LU
 mWZpekALgXQScToNTfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120027

On 10/12/2026 2:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: qcom: missing vddm-supply in s5kjn5 camera node
> --
> 
> commit c1df83521b79d78bdf83d4c496be4b0e82a9f05c
> Author: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> 
> arm64: dts: qcom: kaanapali-mtp-camera-s5kjn5: Add DT overlay
> 
> This commit enables the S5KJN5 image sensor via CCI on the Kaanapali MTP
> board. It adds a device tree overlay for the camera module connected to
> the CSIPHY2 interface in four lane mode.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
>> new file mode 100644
>> index 0000000000000..d0e39855e0e62
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp-camera-s5kjn5.dtso
> [ ... ]
>> +&cci0_i2c1 {
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	camera@10 {
>> +		compatible = "samsung,s5kjn5";
>> +		reg = <0x10>;
>> +
>> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&cam_mclk2_default &cam_reset2_default>;
>> +
>> +		clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
>> +		assigned-clocks = <&cambistmclkcc CAM_BIST_MCLK_CC_MCLK2_CLK>;
>> +		assigned-clock-rates = <19200000>;
>> +
>> +		vddio-supply = <&vreg_l4n_1p8>;
>> +		vddd-supply = <&vreg_l1m_1p0>;
>> +		vdda-supply = <&vreg_l4m_2p2>;
>> +		vddio1p2-supply = <&vreg_l2n_1p2>;
>> +		afvdd-supply = <&vreg_l7m_2p8>;
> 
> [Severity: High]
> Does this device tree node omit the vddm-supply property?
> 
> Looking at the s5kjn5 driver in drivers/media/i2c/s5kjn5.c, it
> unconditionally requires the "vddm" regulator during probe:
> 
> static const char * const s5kjn5_supply_names[] = {
> 	"vddio",
> 	"vddd",
> 	"vddm",
> 	"vdda",
> 	"vddio1p2",
> 	"afvdd",
> };
> 
> Missing this property in the DT overlay will cause the driver probe to
> fail with -ENODEV, or if the regulator core substitutes a dummy regulator,
> the physical MIPI PHY power domain may remain unpowered, causing the sensor
> to fail to stream.
> 
>> +
>> +		port {
>> +			s5kjn5_out_ep: endpoint {
>> +				data-lanes = <1 2 3 4>;
>> +				link-frequencies = /bits/ 64 <1248000000>;
>> +				remote-endpoint = <&csiphy2_in_ep>;
>> +			};
>> +		};
>> +	};
>> +};
> 

vddm is an optional power supply and on this JN5 daughter card we don't 
this power rail.

---
Best Regards,
Hangxiang
