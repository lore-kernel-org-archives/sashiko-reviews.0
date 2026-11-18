Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988082;
	b=HLMb8d0gb5vjcJjY/nGTzFvM8kDM2yv3hQE1f2kUO5VPatnGXEH0VgGiRuIdgrVsxa5R
	 6zcWivJSURCPYQ+9dqmsGap5mE4R11tbIQmLe6QULXu/IyKPKS8td4E/Yr+QkKQ5O90OT
	 KQEyGYIzk0adQqN2/d6dCjGBB00QWoCC3ioiAg1aLpD4m6CBNT++d5PvjKSdPOvGvJqot
	 1jCXJmly4CutOzlRIuXnG94u+qN5ZAB0rkHJWe1+1MTfKQkmYIxNjaVnqQqBlf+jqlUtS
	 a2DgVteQveKIBKtWDh/zOqlgLMsspqyWooaSScDS5Xug55ModPJp1vXJ1Xfq/pv0JKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=;
	b=x+poaouZ/Rmxirtkjrt2bZq34Sc5YV23moujDSQev/Qe/bBKRh6nLshe87Vw8BQip+v6
	 nTuKggv3G3mu9fxsvT8iVx9TeEKCDEZNA3HlIrG0mWxaKH7nLa+MFRZDPGlGxKTG/cVLi
	 4YdT424YVQo0Mq1MLYgHfLC45j+0ZzWrgvoHE85+zJbgE+zO8pI1ZmW8hgQO0FmSfHlOj
	 gxncy0s/nAKu+WnQo8eXKZYqZnCCmXaAcNgjAT6lksvnA9p0sqlTKGGvHrCnpMfk9IEer
	 IBDz494bcRGfgMDOQkAh1fsEp03ps6bAZPJy1p3VWnC4k06nO23fv9FNv81TAprU5vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMoIJ04z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtliW+m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FC3606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FC3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMoIJ04z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtliW+m
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2WAEH4060200
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=; b=EMoIJ04zMJ+x4Dur
	nu7Q/vwSXSXeJKheGCEBsks/aA+GpUdVImCiuZVi3wxG20q/5ZOYDrXXAFjeDjXR
	OoA1G7ECZE7RToacBh8icG5ybTSecc1YpHmDMRW/Sceh06Jw4Cb5s5ovCS6VKwpo
	/Z0H28YESEnq4OXfEEkf1HBqRLMERmxCyLgPAfFnEVsQYaXDXIVl8aTygtFZbBCU
	7v5rmYjDRDv7rig8zWVNNfTiM+/ACeyKV4VcD4aTKH+DvQXr7TLzopF3p+X9omlm
	ddy2HNrMeTrVtMD+O/2cvkdOt2AJNzYCky+/b0WNfmBvKIbrYEOUWvIOzfN0Wqsd
	uVIFKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchwms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 07:48:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efad644688so6537705ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 23:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794988079; x=1795592879; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=;
        b=gGtliW+maFrdpIdRUtaW7LNu5PMgwFv6hRH6sKKzrkQaT2r/nmBsQkOsn0YcpmbnaP
         Q6YmrVWO4jyLZFBFRmLL7t2t8yaWC5DVM/a8G0OpUcySlglio3XGPD2TH89q1EirivDP
         ErQEFpvSQxZTtktFMhJ98ldjI+xzcEkQfAy/5M3BSOoaaRFcFoeXtl3tKsQKAR05Gne/
         FNUs7WDjbb+eRxBzQI7pMUMNUS/2tCRZp3UcZvj2+T/iMWU+OKqFKRwbXllJ3Er6B7q/
         wHEVOX+NSlqfbKKn1kkzTqTxGr0DQAvOgP/YSDRs9iD+ObIjMkPiDmy5ISZT4e0OLcQS
         WcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988079; x=1795592879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvc+bBzzP+Ja0Kt8fwKbYhV41RIku4RbGFRhXc5aZdU=;
        b=C7ixMEV0bNoJ0cU7ZzoHhuHrg9hh/g1s4REZCnmueZpH6U6QXpi9J4Pnpdfqgz2w2T
         n/O4i9EBi2GSMX52M3BhgvRPGZU0Qmu8BnU0QfPWhbY3YZUvkL2pJtR3779poLMehnQk
         zj+SKoUbVp0xPglFXgxomKFfwWUMzLOTaQimscO4Yk+hLvvs2pSZwRLQTvJoMYIe3HXc
         /rWrMaoCq+8c31RlV8aup54KAeWnYfNQ9BM2jMCnSWe6q4apGO2c+pr71fcb+IlcFFKF
         L1t4NAcqJ69Z0/9JJBymZfeG6eDuUT91FSpAe/wjSc+n7JA33KEIdetBdj1DuYBQ6lJk
         RqmA==
X-Gm-Message-State: APuU4Z8/TG3GPOnks02+VvYsNgPWMfsFckMTQd2ETOU8CI+UpHGLfWdt
	unkAc3sH+ZSFFNvmeVnYSy28FBf9CG5gvDzMovpcfUDTB7ElEIIATtoHRjnTQqWOh5hji4sSB0c
	qtkiw4j5zDIxG0oUG2YsostKc2KB3ZtId8kbAvNCmS/hEvw0ItZh4QcuvT5W0oS24yZ2JN2CjFh
	fY7GI=
X-Gm-Gg: AZFdTZe5BBWKG8RC+SxKZpzSFDZH855YndJuvpPKiD+mA743vFl00vN7QInnWVoxU7w
	wcUuvbH4Xl0Omk7m2TvoHXUcSEs1DqVlghA4HMWOVhDFfgmQf04Kqok2Lr/0VG49/gWZ9LkWego
	nzZfMhZU0jX1ARqx/lSzZHvMMO5Uo7RPf+8tmwJ4nFBBgkxbTdhIGJU7dDiJtLUei+cQBV59CvF
	GWn82OcWKSSJDZbfyVeD5ILEbOJWvexYRrJL9qpYExFssrImA01T83aQFl4Ck+s+lr8qdnK7Kz/
	FV5sDhyOvJr9NqR26OSdF+WIPdhLs77oOzKJyOgkurMaNKFQ/mhp44HoO0R7JeICFXhpdIcpQJY
	eP9mKaQW1SGTNcANF0TfI38oeKDwZ9Jy4qP+TQkTOuAmkdA2XeLj+Q3xciQsgwwyRu7+nhzdUTn
	raSfKrwyUtyDsmyRBL0cUs+bqO44TR
X-Received: by 2002:a17:903:41d0:b0:2ef:f51c:7b09 with SMTP id d9443c01a7336-2eff740853dmr17435605ad.28.1794988078998;
        Tue, 17 Nov 2026 23:47:58 -0800 (PST)
X-Received: by 2002:a17:903:41d0:b0:2ef:f51c:7b09 with SMTP id d9443c01a7336-2eff740853dmr17435445ad.28.1794988078527;
        Tue, 17 Nov 2026 23:47:58 -0800 (PST)
Received: from [10.133.33.36] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff611630asm8883545ad.17.2026.11.17.23.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 23:47:58 -0800 (PST)
Message-ID: <d5a60d18-b467-49e1-8c1a-809803c4ca66@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:47:54 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
 <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
 <sashiko-outbox-220055@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-220055@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd5830 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lllB74_2-GDN1I7oraoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: ygyseVb6lCYZRD1xTIk2DHuH58LHSdbt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX9qo0e0tx6hFx
 xVghG7Fh1TCotKiEoAMyJMKBcLfgBtTHjkDUOuauL6kqejq92kyKcyOyRhfDk4xRtYDUY57Io/x
 OBQCeIw7yy9roZT6BY9igQV7mkCVhqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfXx2Ijwcrq+hIT
 5zen3QX48KZqdyQ0h9B1bCu785MlhbPJUBJRPOzfCBz1YmFKbwUOuF5OcCnIs3POS+qK6GHvzaj
 4rWVFbe03IilmFjiu5I/P3JLpN+V7S0kI4GbHPbFQOKidgMVuOMzTkk/H0mOSDP0JPplrhcKBI9
 PhvUnSuvA6CMh78F/8/PWWcFA+zJ9XkFo9K/VKC7D5MmjxPQLGYMb9Y7REBN8sgZjS+Zhu6TOA5
 Fvv0tx1Jt1BRkG+JSuw6dAjS7s9WDuWgY+gHbuFC0OMnOtKOfZPaTWVmZ0mWpdtq5dUypqlVMcw
 idhzOtH+7YDAyH0900vn6CMqT6jru4xrI8ngydEBZANq0d74oEZIcT6zUGCDa2XU72+dyDRRkcK
 qd/Ka3SwQuW4XQM7gRmNkZGmAR6gWJiRPp2AW0soAAHFj3f4v6BEUuPU5eUoYkPzMGMrxEeY2H1
 t8GYpbUUxz6TZm2fhTQ==
X-Proofpoint-ORIG-GUID: ygyseVb6lCYZRD1xTIk2DHuH58LHSdbt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030



On 11/18/2026 11:53 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: maili-mtp: wrong vddrfa supplies in
>    wcn7850-pmu
> --
> 
> commit 0117df6375848f6603dc465badcac7a530d4ecbc
> Author: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
> 
> This commit adds the WCN7850 PMU node, PCIe Wi-Fi node, and associated
> pinctrl configuration to enable WLAN on the Maili MTP board.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> index 5409d0a7ec2e0..a3c2016eb9053 100644
>> --- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
>> @@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
>>   
>>   		vin-supply = <&vreg_bob1>;
>>   	};
>> +
>> +	wcn7850-pmu {
>> +		compatible = "qcom,wcn7850-pmu";
>> +
>> +		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
>> +		pinctrl-names = "default";
>> +
>> +		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
>> +
>> +		vdd-supply = <&vreg_s1j_0p8>;
>> +		vddio-supply = <&vreg_l2d_1p8>;
>> +		vddio1p2-supply = <&vreg_l4g_1p2>;
>> +		vddaon-supply = <&vreg_s9d_1p0>;
>> +		vdddig-supply = <&vreg_s3c_1p2>;
>> +		vddrfa1p2-supply = <&vreg_s9d_1p0>;
>> +		vddrfa1p8-supply = <&vreg_s7g_1p2>;
> 
> [Severity: High]
> Are vddrfa1p2-supply and vddrfa1p8-supply shifted off by one rail here?
> 
> vddrfa1p2-supply is wired to the 1.0V vreg_s9d_1p0 rail (duplicating
> vddaon-supply) instead of the 1.2V vreg_s7g_1p2 rail, while vddrfa1p8-supply
> is wired to the 1.2V vreg_s7g_1p2 rail instead of the 1.8V vreg_s4c_1p8 rail
> defined on pmh0104_c_e0:
> 
> arch/arm64/boot/dts/qcom/maili-mtp.dts:
> 		vreg_s4c_1p8: smps4 {
> 			regulator-name = "vreg_s4c_1p8";
> 			regulator-min-microvolt = <1808000>;
> 			regulator-max-microvolt = <2040000>;
> 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> 		};
> 
> Because pwrseq_qcom_wcn_vregs_enable() only calls regulator_bulk_enable()
> without setting voltages, the mismatch is not caught at probe time; instead,
> vreg_s4c_1p8 is never enabled when powering on WCN7850 and can be disabled
> as an unused rail by regulator_late_cleanup(), breaking WCN7850 bring-up.
> 
The supply names vddrfa1p2-supply and vddrfa1p8-supply are fixed by the 
DT binding and only reflect the nominal voltages. They don't describe 
the actual rail. Which regulator feeds each input, and the voltage the 
PMU needs, can differ across WCN7850 variants and board designs.

On Maili MTP, the mapping follows the board schematic: VDD_RFA_1P2 is 
supplied by vreg_s9d_1p0 and VDD_RFA_1P8 by vreg_s7g_1p2. This is 
intentional, and vreg_s4c_1p8 does not feed WCN7850 on this board.

-- 
Best Regards,
Yijie

