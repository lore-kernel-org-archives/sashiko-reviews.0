Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516399;
	b=RaTsb/FxikGvC2g3AR+LOjn8iUMcgLpuDTeNfLZbovDhduFfBJIeu4olUyCjqsBC/+0+
	 r0eZDMm1V0EsACAdkl8XBLXIvAMY9q9CJHDX21B7yqD4GD9FlzKlq+qXFL71M4btPSoaf
	 4xOAZniCZN4AJ0N8q7oqsmmee4E4QF05lkbo+wumItBwmLrKZyjw7wnwZSl01UV3/+gIW
	 jkKU48a7PqDlqiJN3hFnaubTiaKZI+tFPMV5PIYcV7PShZegTr67wx2lbWpHiRhArMKq+
	 w/OI2NQfRIn9LiF2sDRD/qhaHi19VBj2DMmSgDgyDp4J1DvGiNJVjdQnGZcX+qRaSHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=;
	b=u0ASwTJTVxQyiYBOta1niQFA35m8twgv+aU3cQyl4Rx/AGVZPZJUe0G4yeaHXJRyQLXE
	 Gx7c08+zTSLbYqADqKLeT+4wAVDebXX5iG2d9ijW4iXeLGtQr85CjY88E16aXQm69rvHH
	 Igrh1NRWNrrSjCwsQWoMoqNmX5qvmSdf2irUbZsoV3Zf3pqK9sPTKuWIaLZADh/L0hxb8
	 BSQD6laiPLxFZBB5TwOVtgsFRahXTuWdPXnuX3ilshdcm4lSCAU6RIECJ2Y3fPk8A67xJ
	 +qIf7z8wk/kgjmvKMiKzwbkGVYs3LLbYMqoNrZIsOnh6wzrh1Scg2p/iFTcH7pMBonQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVjdWauo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwkyde59;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B09606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LVjdWauo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwkyde59
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8evoi4128981
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=; b=LVjdWauoyhZ/uSIq
	BEb7n/QlYwSxCO11t+jwKKq4fjF90in1+PzjDRbT2fE/w4FcjAWSaCV+cONMGBuA
	94F4vdbc1cxSNDeNQ3LR+yykWJuy8pOfaH+m1KaBfYegIOzALJOzWDR7YMnAMpk1
	6Q0+j2JJZYftiIUKMPDk/NF+EgDg+0+VSmwJi/I/pcEYTPjVKPXaV80tKoazVbU/
	4NS3OlfZ13qkjex8o+JHjuD+uGyi9zX0A+ddZrEVNmE0HWa/PSB7YMegyeuz1kZV
	g/RUGmFmZ5Q5cptAYx9h8LL+sKoHMOuWPCU5sqm6LsCrin3/7nFkvKbA+DQI6XyY
	k1UREw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt27sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:33:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efdd509c6bso54615245ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 02:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795516397; x=1796121197; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=;
        b=jwkyde59PIsOk7U/8Dy4kQYmKmrzK8Gts/WnijWuZosau08LdOIw/Ob2FtKwslKbq4
         szJUXgiSjrRs1IrU908RlMrKuir7FLPwReGjs732aDEXXPL6lxhIaOBpGq62reREXh2B
         YG8+dG3/gwG2W9nmgxYziYOxDAFt2peNGfKkPYlWXnL0AyNCN+ViLue2gLmMSyqJirYh
         X08jDwMiSIpqb1OxQOspS9fbSHhsvcUx1Nyi0aECzT5kQFW0eaQrPVYDOTW2rPmbLqjE
         lJFdyxD+61sp4YDAkWBebtmAe/9q4OQraEXBIwGW1DzM1wIcQf7NIByM+t9aSky4BrOb
         P3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516397; x=1796121197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBaVPtvwJ2FyinGm83fvovT4ijOo/0WK439KB4KzYUY=;
        b=ugIdSK7ojtMZ24NXAhbTAW+RxPFczn4MXBF0Km8G/Z/FJZn1gl+5M/NOlRuQShNoBK
         LEp+cqNIAxEc/Z6NEPrpnq0N+4huqiShUawSfTwLy6+hPQm5kD/gjAP2fW9z27OboTa+
         nVG/xGCUH37/J2UGgR7P1BOcCKQu04qSnJjqf4ILHlmvaZcCW0Brok2PEczrTB9LqYuk
         OkcpNfRXQz7DKSHKXIKBUT0+YxuMZcOCKSDNogKaeeXwYfqpL0JEB/cyrK0Ib96BmElj
         swYJiZgH91KJ1CQieGinnu75t4P/nqV1lAqikINWcBz99MPKFigYukWDKLJOUBSKvqqV
         t0Mw==
X-Gm-Message-State: APuU4Z88sC74/zNpumxQdVVR9fRQlGURXLWq52pWy6U8JjdMVuQK1URJ
	+jW+snqIG2p3guLA5RhNyYhWeB5eSJ8BSpuKkIU9bvnSazE0/3pYF389ODCTeLNkwzWePtz01fO
	R/i2htv0gVlSnWj1B5/bgyJcK1GEVv5RHO49TTDbM1/ittsd5ZA/2bHC9IrtMwh0LoJWniRP4A8
	5HOPmh7g==
X-Gm-Gg: AZFdTZcNwg0LI5N/pM4ubKEUYbPeQ5rFQPU/fEvojxzWWYzVzIQgxeNdKEj44xc7ph1
	7voBjQm9+r4wEIqFIRhXpnr7gwhjEMpf1psfoyu2pY8Af/p7KIWD1o4n7uPo9Hdc4QFq6KDafIM
	3Q9vsEy58QXj75oxvCxuYUEVNFRl7VZhE8bbwohM2fNd00nYKx8FHWO+UZGQWJ+qWL8PEj7PVMC
	NfyZpkJY6I6hH/hCutv+Bm5K0LfV7pzxcXoVW/zprkTHAREh/Uhtw5EllfLGvtRbaZ87CB9XH9w
	Qqb5cYyjU5WEobgyvj/mi4dOx48uU3jV9abEm9e/+zM1UheImSJY3Y6eTdewA5ZqcNMPFStEZbC
	d2jsF54zz53oVVJCnA6ybEdVWILsnrnnMoGVB/aS7aRVdoHnTCmjRmmvddAZzzuFjNYvDAcbmjp
	aDAW9IxIcl1X9AdqVovZjdlny1w1gyZr63QGBSsw==
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr132507045ad.42.1795516397363;
        Tue, 24 Nov 2026 02:33:17 -0800 (PST)
X-Received: by 2002:a17:903:3bcb:b0:2f0:44b2:648a with SMTP id d9443c01a7336-2f044b2674fmr132506795ad.42.1795516396925;
        Tue, 24 Nov 2026 02:33:16 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm66044105ad.9.2026.11.24.02.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:33:16 -0800 (PST)
Message-ID: <1c385845-909f-4e1d-b1ea-a17501e641e6@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:33:13 +0800
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add CoreSight debug nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
 <20261124-add-coresight-nodes-for-eliza-v1-2-e1679ce78547@oss.qualcomm.com>
 <sashiko-outbox-230893@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-230893@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX8eUoZpmTIAfT
 dfym/8aKrBGcPNX21M4AIsaHrDtW5RS5lOI9vu/9qE94n6Z+iefs5J/k8CFKMTU32nTPpgdDbU+
 LgKWD5vlwaNP1Bo5IRNhmULyevTmxJI=
X-Proofpoint-GUID: VwQV1ZSiNHJLbIkUF0l15IkvRRcX_hCe
X-Proofpoint-ORIG-GUID: VwQV1ZSiNHJLbIkUF0l15IkvRRcX_hCe
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b0567ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NOqMHipF7Z7UA0BjjVMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXzbXW5GLwZKaP
 hIQxDzrVP+B7+UleOHVb4aIECny1hYRNv9GajCV7VBGr1G0mI8bPbfUriqPLmjoTXAQWwAABIuC
 F+l0zG/6nqZSJ/89CgC58yYCqKIyG3UkwvInWFvIrB3fZ80Veg4O2kz8d/kWscKU6+qvoV0Gvdx
 4//CLREryIAcnz1gES9azrlqNVcBZZ7MvL280MM/vJxQl/Psy0Vz/bwDPjVai9iVOU0dFOeh2S5
 iQqWVzshgJj/MFNz1q412vgp5HBtDxoypczuxS02BWwjqhmi7KnW5AEJqvDEwig4gIIInSURRP5
 dbyjit/JwWQHu0j+ZIrzBwSkT6QpXq0xHj4Ectgib3iMlDxYcGDGmzjqAEbyRwym0RcUmsK3U5m
 HBV7TezBGsP/fIIg8tPTRG8lfwbpRF/oB7d9gHe/7+etx9y7t8/hS5/vt0vyDHh8Im9hAYqkk3N
 wmk8V5Cv0e65cY6nHHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040



On 11/24/2026 5:56 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: eliza: missing element-bits on static TPDM
>    nodes
> - [Low] arm64: dts: qcom: eliza: wpss-replicator port@2 violates DT
>    binding schema
> --
> 
> commit 54f1938fd654d770e58cbcb66d2760184479af8c
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> arm64: dts: qcom: eliza: Add CoreSight debug nodes
> 
> This commit adds Devicetree nodes for the CoreSight debug and trace
> subsystem on the Qualcomm Eliza SoC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index 4a125ef386c02..7bf58daace9c9 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> 
> [ ... ]
> 
>> @@ -5430,4 +7484,127 @@ timer {
>>   			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>>   			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>>   	};
>> +
>> +	tpdm-ddr-lpicc {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_ddr_lpicc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_ddr_lpicc_out: endpoint {
>> +					remote-endpoint = <&funnel_aoss_in3>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-lpass-lpi {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_lpass_lpi";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_lpass_lpi_out: endpoint {
>> +					remote-endpoint = <&funnel_lpass_lpi_1_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-lpass-rscc {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "tpdm_lpass_rscc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_lpass_rscc_out: endpoint {
>> +					remote-endpoint = <&funnel_lpass_lpi_1_in4>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-modem-rscc {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_modem_rscc";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_modem_rscc_out: endpoint {
>> +					remote-endpoint = <&tpda_modem_crm_in0>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	tpdm-modem1 {
>> +		compatible = "qcom,coresight-static-tpdm";
>> +		label = "tpdm_modem_1";
>> +
>> +		out-ports {
>> +			port {
>> +				tpdm_modem_1_out: endpoint {
>> +					remote-endpoint = <&tpda_modem_in1>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> [Severity: Medium]
> Should tpdm-modem-rscc and tpdm-modem1 specify qcom,dsb-element-bits or
> qcom,cmb-element-bits?
> 
> In static_tpdm_datasets_setup(), drvdata->dsb and drvdata->cmb are only
> allocated when the corresponding element-bits property is present.  Without
> either property, enabling a trace path through their connected TPDAs
> (tpda@1080e000 and tpda@10803000) fails with -EINVAL in tpda_enable_port()
> -> tpda_get_element_size() -> tpdm_read_element_size().
> 
>> +
>> +	wpss_etm0: wpss-etm0 {
>> +		compatible = "arm,coresight-dummy-source";
>> +		label = "wpss_etm0";
>> +		arm,static-trace-id = <44>;
>> +
>> +		out-ports {
>> +			port {
>> +				wpss_etm0_out: endpoint {
>> +					remote-endpoint = <&funnel_wpss_in2>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +
>> +	wpss-replicator {
>> +		compatible = "arm,coresight-static-replicator";
>> +
>> +		in-ports {
>> +			port {
>> +				rep_wpss_in: endpoint {
>> +					remote-endpoint = <&funnel_wpss_out>;
>> +				};
>> +			};
>> +		};
>> +
>> +		out-ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				rep_wpss_out0: endpoint {
>> +					remote-endpoint = <&tpda_dlct_in5>;
>> +					filter-source = <&tpdm_wpss_dsb>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				rep_wpss_out1: endpoint {
>> +					remote-endpoint = <&tpda_dlct_in6>;
>> +					filter-source = <&tpdm_wpss_cmb>;
>> +				};
>> +			};
>> +
>> +			port@2 {
>> +				reg = <2>;
>> +
>> +				rep_wpss_out2: endpoint {
>> +					remote-endpoint = <&funnel_dlct_in4>;
>> +					filter-source = <&wpss_etm0>;
>> +				};
>> +			};
>> +		};
>> +	};
> 
> [Severity: Low]
> Does port@2 in wpss-replicator pass dtbs_check?
> 
> Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> only matches '^port@[01]$' under out-ports for endpoints that carry
> filter-source, so port@2 falls back to the base graph schema where
> unevaluatedProperties: false rejects filter-source.

Interesting, I have ran dtbs_check and did see this error.

Will address it as well.

Thanks,
Jie

> 

