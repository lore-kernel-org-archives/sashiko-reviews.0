Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65D3FB7EB
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629680; cv=none; b=r4yMftHTqH7I5Hxvv0oYvY/+53RmRBXKuxQsJ5J9uzjC04Webi/E86tvLK5NXz/voWw8o3Koub4YpdgFuRKmcwRI9EAyL2wCMWjW1TJsp8jfmqXFQ1AVdtk4h1d/YuxpBeVTLWhQ28D9dBOI4wbxW8BuS6IRF44gSzFNUzfiKek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629680; c=relaxed/simple;
	bh=0i9yQKbjU1hIXSuOnmpAvy4haUvfQLHFSxTtPHpjr00=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Act0ZB7Gb0F0gCj72/le94sfxrMY3SR6Hp6kN8+xxBreJqQTYznK0pYHKHg2TjBf0M71WayCHo22em6RkrO/ia58pXhc85H5Ik3zvRRHCR4w7bl1dutzAPDRCvQMAcJTSsUf5PWanjKmyMeJzJ8FciARHwYEtCfMhHiCZsAC1Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XGVBNbA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BYYLG3Ns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGVBNbA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BYYLG3Ns"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SHvslg1457993
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 21:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/hiL0qeixXa4oLwE6fqQAOzFaxdQ7/jcwOb7u6Pi4eI=; b=XGVBNbA/zyTtoClY
	9AjzKlgTH9oZtFKAK12M5miNGxIRk8CV6LoDfl7U3rPFWyBXdxTHbvTYwoggZ5wn
	AGuRd3fHZyxK/U43RndeXJq3POasV2qUQfmK2Aq5gize2nMMZShCIZI0LPA2Jgv1
	poD2OGdMmLgQjoAWfJmM5ZPhCVWo0HUCyIPxMXGIo9b9zVa2PSmfACOOXU/7/Y6C
	e1ITjMYJ+eqX+PH8vnQEK2Xm64/MaxZyf/6Ic9xzcQQoF1UjuwSnGPYnbjPmGvxe
	SwqlhnVhHiENh84N95CNc3cGqe/43LZYoqsedfmWkNkcZ/iPp6VERISdq7ujMjVV
	TI5N5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw20t95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 21:07:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so45796485a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790629677; x=1791234477; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hiL0qeixXa4oLwE6fqQAOzFaxdQ7/jcwOb7u6Pi4eI=;
        b=BYYLG3NsKtHnSdjzQk/cNEt7HOITMPKc4XznR4lCm7ECcAuhIbiihQZAE3NVlqTrBN
         opjdmkSQL2Ktnxu0EZYBXORnawryRdBfixWKOLedtwaONER6SAX7aEbrZCICzEtMbbXU
         73eINlDe2l+aPhF1HlnOyghIGf8XM+G/XZwY+MLbdtNbTj4TC57NW8v416Y+oiz1xCIk
         KxdK0gJNNq1jt/nkO3SudDgj6GFyiXd5mIEsge0dzCAHwf65ZZ/i55h71pqRDh0L6I/e
         exJ6nmDZFJ184OOEX+MBJGT4gDpJ0zkKZdCjGosFlDGo+MJh0ZPr4TWZba1B+BF5fDVl
         IcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629677; x=1791234477;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hiL0qeixXa4oLwE6fqQAOzFaxdQ7/jcwOb7u6Pi4eI=;
        b=Zbxl6jxpLF/BgVJoiHSe6VR5Xi1fcgfcWVCu8Wz/oWu84MXkQI9zuGPrPMpE40vvna
         0QFzHiUteoAS5Ojop544zbqfEDRaNDS12nsX+RRHwgqJKDnliScygEG9QllDg7R6IZTf
         0nD4mvmt9P5eeOylLh/qs/U9uKYkftJ8k9DIIBe+7T3j4n4dzCzdcIQy4TGx9tc2Y91C
         55YkHc5f26gNTyd0vF1fAidAinWbv9HWSHZkk+pdJF1Z3nwdqW6VieSFyqpau9i+/Mt5
         eYs6lWKhNeC4WKbthVH9QDTgwqMZOsqTOHwPfGwcGTASIM2++l88p9jd9k8SSkJpf/pD
         XaKQ==
X-Gm-Message-State: AFuF++mFBQwsNktkqjXsgms/pcRZJRhyGWRMwbVhR7bjG8kCdO+IzEkR
	Dr6Ka9ovJbAZ0DOUlmoraCa1sYl2iwB/iyD2jpBI6PQZuGGE33P+OuYnDr/YC6BVmZjQ2UnTV2v
	XReThxwsnVfGLRylsHHsklV602orbMR7c6I06HLJWj8fHMH4JiKFg3wbZFKoeNj/74muXBcasWc
	NoENE=
X-Gm-Gg: AYBFou36Avm/Y/kDbnA9J0D+AajJVrUBEYV7GnLpg+hHwTqGmqVXUykpvZXmc4Qoh2R
	a9xgxJTAVDLKstdrTgNBUEH2ilFRwvJyiOLujHSvc1xkbIrYV5vks8vjbL+qAzlMvzD0B8yTbk7
	6dKxtz6Bmf3Pq8mEhLckyxK6F9CUewITAiCldJyfRLpqTj1FAkAErWT5JF7ElqsCukzf43O2JXF
	VEnIxj2oPVOrgyT6NgsLBTIDFw/luWbYOswekhhdZemwp3shRFZtWYfWDFqnhaVc5nGN2CbIAHl
	21f8iMc2ERhr1pXTthuxOHNVyHPPtAOQRBI7faioYFEwsmCicu0cxY9TERqqhtMqWamQYiucKKq
	QKdsXRmkG+FBD/hYKh3Qa8FD0dw==
X-Received: by 2002:a05:620a:46aa:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93c8bf00b56mr125014085a.17.1790629676597;
        Mon, 28 Sep 2026 14:07:56 -0700 (PDT)
X-Received: by 2002:a05:620a:46aa:b0:93c:6e1d:96b0 with SMTP id af79cd13be357-93c8bf00b56mr125009685a.17.1790629676077;
        Mon, 28 Sep 2026 14:07:56 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00c0d538fsm31156575e9.1.2026.09.28.14.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 14:07:55 -0700 (PDT)
Message-ID: <c4d482cd-a670-4e0a-9e7b-a0d383d0527e@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 22:07:54 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260928145122.1337186-3-srinivas.kandagatla@oss.qualcomm.com>
 <20260928150404.D18611F000FF@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260928150404.D18611F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abad72d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wMfHEhPWk0epOlVY32wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LG9clVqvHgHQUNjixPvRLij4QEEXkJof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfX/ulj1GMFVxOf
 KXhJkTLF3d8wamIPmZ4/4hC6kG/37RWQPspCCcaqBVxvLP+g8Qui+Jtn0xBQS9LOJfcq2vIXR22
 AwhOEB2TsdQpX77dBKKZ844FCRxRpfQrL4QgdO/L4JZHpyi5w9tjNLwPPpxwfpLGJARgoBhAVoX
 6WN1HgCoKxUb03UkcgkNm/IDoR4xyvnfcNujVPywI0NgzgfQQ5CE60e37oQPIgLyxkABa9FkUMl
 FrF1GcMXrTB1Y+hkGqA1+TneoAmH9eXPDSd/4ue9twjaSLAMA2hckcTZKQ7QIHHQmZB7Y5anKfb
 q2nl3IsZ8a4GuV37lwTD0qy6TfAVNu7NPw0lukxbSu2M0NzkmfYzR5v0qtRy3iPBhrH1mhTc7VL
 6q/C7980xepTLcxTxf/+oFAslm2zTJKeDytMFgkWUbo+dDLduma8nzkmlyyczKFmVLPVxhtilYs
 /8rWqJlHR++1BGP1m8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4NCBTYWx0ZWRfXz84KvECYZzms
 a/b3oW69SxRuI1rCR0BfZkZUAyNSCgxZw4lClgU31lJ6QLzWu1hKpjN8Nlj2od4QXjwbzps3Hc4
 F7qULylSAICHNlBfMIcS4CFATHirkdU=
X-Proofpoint-GUID: LG9clVqvHgHQUNjixPvRLij4QEEXkJof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280084

On 9/28/26 4:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dts: Reset GPIO conflict between ptn3222_1 and ptn3222_cam
that is correct, I ended up sending some stale patches. will be fixed in v5.
> - [Medium] dts: Panel power sequencing issue due to premature backlight enable

this is same across other glymur dts.

--srini
> --
> 
> commit c99537659e637d229456f818bb7c8fc0b3d7fcf3
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
>     
> Introduce a device tree for the Mahua-based Lenovo ThinkPad T14s Gen 7,
> a Snapdragon X2 Elite laptop.  It follows the Qualcomm Glymur reference
> design used by mahua-crd.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
>> new file mode 100644
>> index 0000000000000..26d6d8285e040
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
>> @@ -0,0 +1,1272 @@
> [ ... ]
>> +	ptn3222_1: redriver@4b {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x4b>;
>> +
>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
>> +
>> +	ptn3222_cam: redriver@47 {
>> +		compatible = "nxp,ptn3222";
>> +		reg = <0x47>;
>> +
>> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> 
> [Severity: High]
> Could this GPIO assignment conflict with ptn3222_1 above?
> 
> The ptn3222 driver requests the reset GPIO exclusively during probe via
> devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH). Because the GPIO
> subsystem prevents sharing an exclusive GPIO by default, assigning the same
> GPIO to both redrivers could cause one of them to deterministically fail to
> probe with a -EBUSY error.
> 
>> +
>> +		vdd3v3-supply = <&vreg_l8b_e0_3p3>;
>> +		vdd1v8-supply = <&vreg_l15b_e0_1p8>;
>> +
>> +		#phy-cells = <0>;
>> +	};
> [ ... ]
>> +	aux-bus {
>> +		panel {
>> +			compatible = "edp-panel";
>> +			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
>> +			power-supply = <&vreg_edp_3p3>;
>> +
>> +			pinctrl-0 = <&edp_bl_en>;
>> +			pinctrl-names = "default";
> 
> [Severity: Medium]
> Will this cause visual artifacts during boot or resume?
> 
> It appears the backlight enable GPIO (tlmm 18) is passed here as the panel's
> logic power enable. The panel-edp driver asserts enable-gpios in
> panel_edp_prepare_once() before the eDP link is trained and valid video data
> is streaming. Bypassing proper eDP DPCD and backlight sequencing could turn
> the backlight on prematurely.
> 
>> +
>> +			port {
>> +				edp_panel_in: endpoint {
>> +					remote-endpoint = <&mdss_dp3_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
> 

