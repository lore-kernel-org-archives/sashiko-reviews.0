Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620EE381EB9
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 04:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785991068; cv=none; b=ADpXa7Z4ToprebxebnIX2ZCpAZKoMHJW4s2vz5wKBqhlArQrG+qor/EdeOKlhUOV0lFGQJhaDf31IJRsE2cQ/ycS3yTDIsshPyTzVSK1yKyDdquUL55DH0DaTi2TGJHIZZtkfprrMppxfGCkTgiUsqKTdezhN3FQqQ3Y+FywoJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785991068; c=relaxed/simple;
	bh=/VtCJrpZZzW7BSrSBiAxCfOZr/95stzHxElzigjjE1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+rCitkJdtkd72F6dv+n1MT7YxWnZW2YxpMq5Q2UUFqToC5vtkkUQ4Tq6lhfeq+xFuNJkbg0CH11r3+kQsKytcBIKXY66gajM72XiNs5ex263mm6VP84YhB1jicLCCmBc1hgl1rBcAbhPpqlOfGyucJCzuP8g7HXCLUeJV/YswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXaR/nXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZOziyS4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXaR/nXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZOziyS4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6763wlVX1070545
	for <sashiko-reviews@lists.linux.dev>; Thu, 6 Aug 2026 04:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKCuK4lPjrolSSKXq1q4z7GCP0Jt0iCByxPqY0euOUY=; b=bXaR/nXnVJb+40U5
	qVoC408Ak1ZyOMFxmUw1dHQcyP6kKvCx0fXFp3F8IzelM3XjhrkcWqDMt+g3OrUw
	KRD+vYilatrnJUViNn4yYM/OWOyE0UvY9k+/tTX2aPnahMyWblQs1aUPswI0hy48
	1PrOEn1VuipVcyKyk29YeP3Sb7pxtAIMKEGtAE6i6rBvzrgUWtDgcucwvmfMW0hK
	DtHGkazPn/LaWm/xeHB7cqEUTWaTUY2HqllhFpOrJyQv9RyQ6vtAyzZBeJFU0X/q
	GCc/EFx6wb1r7FVT4F+NPww/TzdID9/173dXcOU3txFi2RtdUvxw6Ptd2iHrSLdB
	NnY2pg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjud03vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 04:37:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so2939751a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 21:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785991064; x=1786595864; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKCuK4lPjrolSSKXq1q4z7GCP0Jt0iCByxPqY0euOUY=;
        b=LZOziyS4zMkTCRG4rBBVWMsVIOZBkH9greMbhbKlSSeRQlRAgf8GB1C1KprZsF48e9
         4Qn75iWcyhqSunUY6aOiPF7lpXZr4ND/MhL2GAN9LWnq7Fi4aAIvKqa3hJ+ANx/Asxqx
         AKQu6acTd8TfsQOkZxbkDvV4LAbC3AXyORSIaimiPF29EXBOrrOb2SVVC/uGusoxPxhG
         G+Eb2P2fAI+sbL5+ugz3jHRm5rEyHPxpgNpKUYR5KMY7VGVkYzqa55tShuYLCHu9KnPW
         1Jd+HDu3DHUwlcMMS89wmT7OU2wvIa2OtR2q8YVpfZgKVejvk5LMJcPlrmT1SP5m9HSS
         //pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785991064; x=1786595864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKCuK4lPjrolSSKXq1q4z7GCP0Jt0iCByxPqY0euOUY=;
        b=pYHiTXRaHolXyAEk2TFapBJW/t02+LMeSML/uMOWOt1dvJPNStCoqtEeDBVkT9GwDp
         PVXdUauSj0lSoJIWCGm+GJhytw7TdhluhBve3CYdNgV03j9drmlDRPuNUIudaOREJEII
         pmWTNwXQ2NQnfj0cxACwfoGEY2wTJqUv2uzn5DxPBQNV+1TJTkvfiaVDobqtJ0buxuaq
         V9Y2IqRk/PyBz4DKkJ3k3Cl73SHkG4SuNeWvVdaCekVi1tyA0ZA1YJ1QAZWW6sZsV+Of
         t+J2+yYqfrY5I6RPd59a1ZGwXonnbiiwJL0Wmz0e0iW+GkhhmL1Z/3SQfW39DWeUx6G2
         8Q0A==
X-Gm-Message-State: AOJu0Yw/Z8hajNtlaNb103BUaJSKwfWi4WOmnGJYn/7vEmn9t2XX9RfE
	1FnebK/zLd53zsQKmP7O66wtW/sGVRzq7kI8RJgKBjOYt2ihHL5OAmRgv7d5hp/QJ1Re4U0ZEyL
	W3UYqQdm0unkhiQTXaGndHPt+EEdkqG2g6b0a1iajNp8ufDS++k1LkV+Ipp1Y+oN1fXuk1M5TJs
	g7MR4=
X-Gm-Gg: AR+sD11/tao46nXt1jtahIKBCcTXfWR8CI4OXJghlLQa5rK3bHw9xcQre0OdNZVBxsO
	eIqGkFGuL5bq4EZRtBog3eJnoaftgH1BNCnksH99/k8fsLCCZkW5Wyux0+hrB1Gfp4hVQQKjF47
	l63xUvmh/GhQQqcvVZInoSyuRKBXkb5N0bnldUa+vI4ulFxOlwIgu+O7YFqL2LcIIdwD37L2W5O
	kUH61nc/eFwDBCdAnRC43N+h5GyrTu/Ud+dqSpajeObJNBtu4tuVtZo3yFmOeGhkcn0zHClxBll
	MCDhcmvbyiYW7g0lxV8j3MoNtMaGNHq2n16uw0i54Az/v3NLrhiQ09W53IuD7H9DbE3PlEL4b5e
	jHJRI5jchcywnRiXwp7P0l0HkoXF78MzBQ18ed3frMiASO1to5lwFv0L+ZoLZBFSxK/gr/pK5cv
	uV4rcT1sharWYY
X-Received: by 2002:a05:6a20:2447:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cb85ea2ec7mr13425255637.27.1785991064239;
        Wed, 05 Aug 2026 21:37:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:2447:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3cb85ea2ec7mr13425226637.27.1785991063836;
        Wed, 05 Aug 2026 21:37:43 -0700 (PDT)
Received: from [10.79.116.175] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc261sm22329174eec.28.2026.08.05.21.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 21:37:43 -0700 (PDT)
Message-ID: <a84a7148-b072-4afe-be5b-46773dc008bc@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 10:07:40 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC
 fan thermal management
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-8-771abd65ee1a@oss.qualcomm.com>
 <20260728183653.A8B671F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20260728183653.A8B671F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfX1bH68QXeYYVf
 OtJsmUnYaj385ROpqInEg809W2TUD4n7tzCs9RnFJfOXNII+S6IOSuV5+vzsP9arEtZhagGxSwy
 wqTAXnt/lmOKUxEFjNgz+8YainbdDDOY+YPf7EURktI7i2pUQ2yxIMSbtcr2BCsU5Ej+OAhAmoz
 rWv0xZyop3VKtc3jj+j5aXpF4MPVSgQpNmMz/zQz1Dl0v/qh15fGfQO9kFG7JmgQgUWWaxSS++l
 uowlSGHlxqzNYzij/6yGRI6It2ja+GlOQ9DWbcEaZvNPsoOamApb/F3mnuibNbuHyFROPiVmV+b
 6k3X7+mp8sWWQ/xegpkhcP2nIHobMCUhQfL77jIboErxJppNi0P19CwbAOPD0zL12zNYDDRMoNM
 7HgbFxluaydR8UfXEKwAh9jXM4stxXEHL+exFhG+7q+vzGFnXKHfgvarnBCPgla+RSZJQu1onJx
 HCwT2Ct3mkgtAMNWBXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDAzMiBTYWx0ZWRfX4UIJUyrAQQn0
 ldP5mfX9YSOD+NP+733HDeJWYUCuZXPKJpp5WmWcx0G1uZ4sdrvFeVmrr3D7D9N1fUINMjHeiwX
 QdIUrFg5N4bLMaAhvnXizJ+fLIEvclo=
X-Proofpoint-GUID: hLYREMXynQDW62RHrvJ3OO_Cpn_dz8SW
X-Proofpoint-ORIG-GUID: hLYREMXynQDW62RHrvJ3OO_Cpn_dz8SW
X-Authority-Analysis: v=2.4 cv=DeInbPtW c=1 sm=1 tr=0 ts=6a740f99 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_6jWvf3KgIEAQ9HY16cA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060032



On 7/29/2026 12:06 AM, sashiko-bot@kernel.org wrote:
> --- Patch [8]: [PATCH 8/8] arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC fan thermal management ---
> commit 59ab25e0b30620df90dae53f1497861f1847b925
> Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> arm64: dts: qcom: x1e80100-crd: Add qcom,tsens for EC fan thermal management
> 
> This commit adds the qcom,tsens property to the embedded-controller node
> in the x1e80100-crd device tree to report average SoC junction temperature
> to the EC for fan control.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> index 429deffcf3e9d..4639340e716c6 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
>> @@ -20,3 +20,9 @@ &gpu_zap_shader {
>>  &iris {
>>  	status = "okay";
>>  };
>> +
>> +&i2c5 {
>> +	embedded-controller@76 {
>> +		qcom,tsens = <&tsens2 11>, <&tsens3 15>;
>> +	};
>> +};
> [Severity: Medium]
> Since this defines a new embedded-controller@76 node directly under &i2c5
> rather than referencing an existing phandle, does it need compatible and reg
> properties?
> 
> Without them, dtc will emit a unit_address_vs_reg warning because the @76
> unit address lacks a corresponding reg = <0x76> property.
> 
> Furthermore, the I2C subsystem will not instantiate the device without a
> compatible string and reg address, which would prevent the driver from
> probing and leave the thermal management non-functional.

Same as patch 7, already defined via the included dtsi, bot missed it.
I'll switch to the ec label anyway.

-- 
Best Regards,
Anvesh

