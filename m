Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541399;
	b=wOhaJczhYX0ZpABfrdZQE6GM9Urt8uw4CHzl2bg3Sa3bfsBvY256R7dzzIpJOMZpFqHQ
	 U9fHFQCD26B6MyFoJ9uLqYTdMdd5Q6XxPuz0zYweQ+VZZRK7qfn8BcHXT+kgINu7pd5RW
	 8+SoKvJbP6oqE1AZzvfOjyjA+iAc2s2h6hmHXa9wjVO4e4URxYys/pdm7e869mH4LSJMp
	 VCB3xX+Z1RdEE4tvdUJ1Ha/2Z946+E2LixLWNrJ+Rxx089MsyYtPtk15k8OhwQihMKgvU
	 mpWeA8VrLBeF/EYfPpA2TM5fHjukqujWDLy6Pu4m4MBDdSwAbNtXckfqmlHcDEXJ93Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
	b=hOnDmwWAGFPdxWcyNU67NqvRHyDHnXGr0kGdCjcuiUKi2TkJ6wzd1Ni70hH89fq14M/W
	 yC/klPJdRuERojz+dcNmMbp9W+sBW+fH10FIfH9tYU6z6LpxHLXQz0MNQgF0rvECEFFcw
	 bo2rGM43LSTYyqsfEC4rpquJCEsH2Dh4Qf18TEfkWB9UD89Ts214zbTR2+RZcHJKj17db
	 Bbt76+Zik52i4nyJvAedyjgpXc4jVsGgBPsaKD95k3gLQHK6XjLmiFWT7vbX5xW0MB70N
	 4LfgHu6feGkXZzTrJiQ1ONrHrQ1Z8mq/txzR3WzPzJt6NxouRiYRsO0kOhD8EVRx5XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWZqkKJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HH1JuL15;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3E6606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 03:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C3E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWZqkKJ3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HH1JuL15
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KJZq3826486
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 03:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=; b=nWZqkKJ3CLkwxq5U
	8pRfvFrg5fA2zwANer2P5rrsm3l06Y3TxxWLYN1Mb4uRUq1MiOzWMo69f22sdn46
	jSWX59YUz8lkpEIevAXUe4jDEbILWsXbyobh+WoQDoJle52wJnU3W4b661hZKf13
	Ndrcl/gqiPOKTITBQC0I6G59c/NSGM94yquZRBVfpGetA+y9enkHtCmbnLlWDplu
	lXDT1ua5azMvNW3e0/FuxfUWzD3k/UhWRyZw7rPYQ+WZSXDFLcV6MJ/o3c8lbb96
	sALT6+FXMS/SRffsSWB87UZ85UemyWUoBzjlbRXgxg5OoGY1T5gcoC3jLoATTvnA
	7alIEA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs03975-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 03:43:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed283cb5b9so8743275ad.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 19:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794541397; x=1795146197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
        b=HH1JuL15pFV8FvtT4nNycLrhEgdwAE3OQGEx20dm3JWJo4c5i47SP+TbedCv9T1zDJ
         AdI3OhZcjZPYMipxjw+MLP0XxRfT/48vwV7ZEtye3MEKidDN3ETnumfp1ISNCFxZmttk
         YL9YVJrresiIx43OujipIv75sM+mgyHdvQXYb3orT6Xi1ZQw/D3DYSVprn/kPBTuK+s8
         8NUk6HzBKpsRu4WlrSCd/odsCm+drzlcuwvJUaCEV0HNAlc4ZSfSHUkNiJqf0zvayIzP
         USCJWABqwMkpYA5PU5LmPpiHFiCA0B2Ku6DDZW5e2OPGZguxh79YWF4UV0D0+KchfkKQ
         xEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541397; x=1795146197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
        b=q2xgF6937qhGDN9VJXnbWACuzN6P3sXn6FYs580ClVW9eLN+5zN2jf2ecVrwygSvwk
         WfwzoJs1s2QLQ1Kz/YUwnjKEBjECBe6YNZA+vl1tkBitSu5dUWJUiYPVsPCMgapgnAaA
         JLlGKwO+VNItm6XEDsOfyrhVxqDJ0YLX3LbnFmGr5f3wqgm3fOgugvvZqbtawdIznkEu
         lapC4Am9v8h10Ks4k9HitqCHoRBNtRVynv6RDSiRkPWRmhhUkwT80FyTtUY/LBkL9DC+
         ubbLy4sr7Y2C9RFhIfB/Xq5nglyU0lhPVfZVr23tlf76j/e94USVetA6De01wwAKhTVA
         c2yQ==
X-Gm-Message-State: APuU4Z+FLmEQ0oXuFrSJOhxynNyC8AwSfjkn1tNRAN2XF1m6Uff9hS3i
	UXojdVypRLvaqVdujvej0rHTcijiedpVQ18exUPCh1HCWdkP1o6qZlrIhyP9U8hXXrHqGbpwSxC
	fmzri7CYGgm25P96use3YNqwrUog9L8dILDPOdTseyf7psSqWELixScJlF+fOhVrjEc0lbNgwYX
	QeUQU=
X-Gm-Gg: AYBFou1psY4Lxl6pkBjpRncmJwdCKRiBedi8mIEt8cqI+4frTGKYwGhd+QqDTb0EYKj
	5Th61l7iYR2VuAREph7Rtk8LnKcI9YZ0BdXwZM9J25/ZjeCV1yMg+/GZF2+W5UEaa+r7hmVfaEF
	LS/BbxeR0xNJtAUMBL66WsjErca2hozFIvdUwB+twcKQhYIKLGB6LVwBGdzSxowFNDjfm6k1J+2
	bMDSCYMWwETMyWsiFdCEZaun4zXhUUAguc/CRk958XnKRIIjzp8QA/0UEHijnECeQVwS5aV/wb4
	XnDTEHvfsYBIYWUVtV3h6GxpW7tbC+MTVjC/NC/BSLncsM+ORrQxQeVS+jduBFT0l0HYWwxre4W
	v4bdJ+XIpvVpRvnrk2MzjPRxS5tjNnQkn5dAicefML1lR/GM6arA13Q2hAUfFjpQR7dPrAA==
X-Received: by 2002:a17:90b:394d:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b1b0b9213emr653708a91.17.1794541396652;
        Thu, 12 Nov 2026 19:43:16 -0800 (PST)
X-Received: by 2002:a17:90b:394d:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b1b0b9213emr653696a91.17.1794541396142;
        Thu, 12 Nov 2026 19:43:16 -0800 (PST)
Received: from [10.235.8.108] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm2309528a91.11.2026.11.12.19.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:43:15 -0800 (PST)
Message-ID: <ec0a8428-b7a9-4b7b-ba0b-bd4a8737153b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:43:11 +0800
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
 <sashiko-outbox-210918@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210918@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfX0JAWU2tz2c04
 wCHem0h6QYYkRHS1PV4RXsRuOfbEHNBTmDWhgY28gZ/ayEa1Lu6j0j5ELUn2h+XvuTqRwzEcz9P
 Ho8fSYuq5ZD2x4m0X5AS+eXheKFuc+AHBkT4ujYsaQs49EYOb//hRNYxkHCs6O5iL3VuCQmgB+a
 Fhl4BEhA27zxVcFbcLjxbvhFgYu7xA4SG3H6FDIMIlF15trqknAIfuzxgxSmei0dpUdHAVhmAc8
 owuMC6HdTiBcub50J3r95oolwbR9mraihamxwv38sVpwDX17EZdTpBi98hI2Jg/UzRkhT1LERcZ
 N1WKV9ZyJqFT0ShrWA3P4oBMVun0VCjiHrPG4R7lD0NYwYY1wQ39ZAmyLXJctHizd6Py2hkTYvm
 9fu1JJmKYorBOkX9WdQ4CB4CvTgjoZ7Yyfx6+NtKb16OySr4Hcj5X9aVeVZ2aJwkF8Wc9A+nWGo
 1h58L4ksFvWHSXVZhuw==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af68755 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f0regg0dAIW5IDvKWx8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfX/0npJ5uAnqrS
 vbeWi35OC8e7frpOd0x004+aiASoswb2MAij9usg+qQ6d1gtJPFWgh4TzheA8WO4HlcDowUzK07
 UdrGA+ZaP5pKIWfDPGqN1NsTeEWmePA=
X-Proofpoint-GUID: wFcU6OJwgUM4oddMqQueYIYukMyMK5a1
X-Proofpoint-ORIG-GUID: wFcU6OJwgUM4oddMqQueYIYukMyMK5a1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130014



On 11/12/2026 6:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: qcom: ipq5210: xo_board uses xo_clk instead of
>   ref_48mhz_clk
> --
> 
> commit f6342940567706c16d7408b991562c108f13f6b3
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> arm64: dts: qcom: ipq5210: Add NSS clock controller node
> 
> This commit adds the NSS clock controller (nsscc) device tree node to
> ipq5210.dtsi to provide clocks and resets for the networking blocks.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> index 0c1ede0f73b21..11915f8eb1567 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> @@ -331,6 +331,46 @@ frame@b128000 {
>>  				status = "disabled";
>>  			};
>>  		};
>> +
>> +		nsscc: clock-controller@39b00000 {
>> +			compatible = "qcom,ipq5210-nsscc";
>> +			reg = <0x0 0x39b00000 0x0 0x100000>;
>> +			/*
>> +			 * Note: CMN PLL output clock names below are reversed relative
>> +			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
>> +			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
>> +			 * to the PPE hardware block ("ppe").
>> +			 */
>> +			clocks = <&xo_board>,
>> +				 <&cmn_pll IPQ5210_PPE_CLK>,
> 
> [Severity: Medium]
> Should xo_board be parented to <&ref_48mhz_clk> instead of <&xo_clk>?
> 
> arch/arm64/boot/dts/qcom/ipq5210.dtsi:
> 		ref_48mhz_clk: ref-48mhz-clk {
> 			compatible = "fixed-factor-clock";
> 			clocks = <&xo_clk>;
> 			#clock-cells = <0>;
> 		};
>     ...
> 		xo_board: xo-board-clk {
> 			compatible = "fixed-factor-clock";
> 			clocks = <&xo_clk>;
> 			#clock-cells = <0>;
> 		};
> 
> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts notes that xo_clk can be
> 48 MHz, 96 MHz, or 192 MHz, which the WiFi block divides down to the
> 48 MHz ref_48mhz_clk, and that xo_board is a fixed 24 MHz clock routed
> from that 48 MHz WiFi output clock divided by 2.  Because xo_board uses
> <&xo_clk> as its parent instead of <&ref_48mhz_clk> (unlike
> ipq5424.dtsi, ipq5332.dtsi, and ipq9574.dtsi), on boards with a 96 MHz
> or 192 MHz xo_clk, xo_board will resolve to 48 MHz or 96 MHz instead of
> 24 MHz, supplying the wrong XO reference rate to nsscc, gcc, and sdhc.
> 

In hardware, xo_board is the 48 MHz WiFi output clock (ref_48mhz_clk)
divided by 2, not the XO clock directly.

I will add a fix as the first patch of the series. It changes the
xo_board parent to <&ref_48mhz_clk> to match the hardware clock
routing.
