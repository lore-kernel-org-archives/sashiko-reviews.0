Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515047;
	b=l9GivH8IolW7+pA/B59uJHII/ggu//rRnJx2qJwgjdlNJRFeNKruX3KCeqrkV2DpGLvG
	 0plk0Bo+oCyyyEakddFs4UWy4xSbsux9z05DIWKncWac9KPDAPCjyo6ytpJdrIf9tNGgb
	 5dR8RpsxWjRch2OwCbD3lf7eCarJ47PbKwaYDW85vXtpsPuXH/IPJMB6+fO+LzIOSIg6i
	 C6G15nxt6BnDDy1cgW5xX/dNxkgbJgu5Js3ccSG86KOThsyDueAuJCE/jpems2pMQJ2G/
	 4U6bdl6aTGI8gO+sRE3HZUbNU7cS6Je2zZK4I/o2Bn0Ah7Vcri/8bT/VlhjbxDtt9iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=;
	b=FfRndeOuort5q1O6pBZbktskNrZqbOqLmi2cRyBU2WKd/Gm8tppNZLH0OF8nKZgNYR6R
	 bOc80mlYdDe5Yw/5S7NqmPNFtj/ekO9rbflIUM0gEzkyOzuIJzMNOmtQW6fHJvOOHi1Lr
	 v+zlmsiD6x0m8kTg12+060uvCtVIBYia0/tF8/GWgBQIRz+DLBwwdblaJq8UlobyeUNDe
	 TRrtENOj5bhsd+QwTaX1tiq2+Oq/Nw0s3VT6wUwOmlqiLARVKFFZgHOvENm3Os9Q/1wYc
	 Q/H1p82z1npvLFWVW1mbi05tAHQnJjyyLcJ79a/9AtMWnc+RnR+2G7yeIsPQBA5+Biw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGTTAVfh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bBgpUGlP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B5606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481B5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gGTTAVfh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bBgpUGlP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8bnqU646316
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=; b=gGTTAVfhkE2/7bab
	8/3BbUtguMN50ajxW+idpsmL6mypl+jX6F1Y1G0V5NreQuWatfHQ68Q3yksoFKk4
	j75I4gLvLNiLNLKTinwNFy64pQoTaEHamLYHZHpFuWlYpC9ZiTL/fkTvsARDT0gd
	1f6c0ys7H2ZFAkQjJenu2xWjdyQXXLwXE6ZjUQK8Apmt7n1DPReVMPFzutqYUpUW
	JTJ+en5Z2lzcTXzyPgtkoeaLnxPBTR+7nkf7Ah7FkirShj19JnEQZc0e7DjMaDVe
	so6jEy06uDJJ8x+8iU/6W1oXNW+sil/7it0vQPJkQtXWhlaLuvPbr+Jsm0ArvkB5
	mN/rsQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd252x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:10:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so5973118a91.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 02:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515045; x=1796119845; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=;
        b=bBgpUGlPWWvhXZoxibMD96qTmvbZoxugM3Lu7lkMLUcsSlS0M3O5fNTryFEcFhF5DU
         l+RC9PD/QzJFbJVByVSbPGd1gC8n6UETCQxRHbvYU4ffSzH8usnU9j1Ii2IkTM9iVqMN
         Ru8f0nykhmZRRIiUWl496rLvH02xx04xgYsgrT1kgTKTZLgkMpUOvPiGcPzDBiSmT0W+
         yDrrAaLXKuso6t45+U9FxY/In5nISoyCT+p6tHq//wVaJ+pi64XIQfFcDKRQsMjUJuv1
         tQ/PmGpo2GDHLkW0f8Zjg0vMBiBCOwY10Rkh0IsSQQJjqd6EvX06PCPKmF+joOjS1rQQ
         5qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515045; x=1796119845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8fOsILZEnkS42kQGRdkOwT2s6KzeYLd7+z7MxZ/MAU=;
        b=ezbUnnu1TiwQz37pQ/g+PeWQ9/7ONT7CPBNhzz65zjMpgf5HlySLPu/c7bTSROrhrT
         voIIla9HbUNEXDTeWhgw1vRJDR9FZjsrFAZPXo+fiot/nWIgLX+9x7uNibTW/IZzug05
         skdsCuOjJ8c9LlB9QTnUIrEfQFhRnUVP/7Qxa89QBQr8JTDF0zbCle2FU0ND6zPEcjGd
         G2gTh6XeVV7fkH9/1XZIKV44PHqu14AtMRO1dMRZp/pU5AQYM8PyXTMucBuJoSPZcZhx
         k+a+FDNGFfuuYgt/J3zxIwOCspW6d7bbXs5Hv1rzwI13UWItJ7vy9nqbLZcjpnnK5Nz6
         Gmpw==
X-Gm-Message-State: APuU4Z+RI4RzpymSpm+nv4ntNXDFEXYbA+MFpbYHwa1A+BNS3EhvrN3a
	8tsFIK0opJwcuVbnHA/q1QAMOawpVet/mK6BcZaLPdO6bOTZLyq3lxbHnyonEH1BUMV+4QnIiqn
	DToqbAYMZe9Cz/0eNYAzfcW6oV2vPO8qevLW0Z3nGXpK/YY59OdY9m2SFMIyDz0uq9LS6c0Amzq
	g6m2/6zg==
X-Gm-Gg: AZFdTZcJsUFDSI4gBzTYYi+jg8R+14Ui5lQW5KC7FPAZ27HtOj3kSPoJWSCZbkFB6+W
	EeesWP8kMenArIWKnr36CeMBsl2UaF89/QcxQ/mXRGBs4MfcO32HPbBiv1ngl2Q5qWty4+UriXw
	g86qSqRkbvo7rK3CHBCYMRDl2TdWeJ5rG1c3wzntzgPrOZwr/cdlyacAsoGRQk8PkkhSM+6wBPE
	f/1uQ1icJutZY8FQc84c5tWp6Zp3vxgwM3NYnuBTitPJny2aDzBcijQmrHQtXUL/ezYGtlPl3dC
	bL2Q+pB8Wex6rZ5Ag52Ek1T/0jscUDINYV7Xf1O37FD57MZeeOoDvWjAnLuugVvoBwNkjB+HYda
	HFKs0CXJVH97L5vLdgYvsKRREaXq6O/CbBJ1RVRR72rwpeNbMErzPgS3xi5HwFl3SA7hgPb01rr
	d4BdGnvjf1HuiiiCmrdfeMKhfbhsFaCLq2uxGl784=
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr12380532a91.26.1795515044862;
        Tue, 24 Nov 2026 02:10:44 -0800 (PST)
X-Received: by 2002:a17:90b:17cd:b0:3ab:884b:65a8 with SMTP id 98e67ed59e1d1-3b41c9032bfmr12380515a91.26.1795515044360;
        Tue, 24 Nov 2026 02:10:44 -0800 (PST)
Received: from [10.133.33.142] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc6130sm6882899a12.7.2026.11.24.02.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:10:43 -0800 (PST)
Message-ID: <1c9786f0-913c-4f89-bf46-b51e1b6cc69b@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:10:41 +0800
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b0562a5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NOqMHipF7Z7UA0BjjVMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXxz0D9sEhJysB
 J3rt72qbm0ndblPHOboHjQ/j+MlvxHP2ud2FL8DxMZggOMYVZlIgqxtkTj1DwFqH7klhste42Gv
 JQm7XbDE0U7f1KdMKR6//41oBjhr43TYaMJES2o7AH0FRKEMNxxKmonu0TXINLp1qHKvB2WgnKe
 uLKRrNHG3CRJJKj+tvn12Jm5FkmBPHGENz84mgB4UlNdnXAvRyTUBrP/7Swp4kf+EWe1Pcx/1yC
 AZa18V8XoNtr46pwgR8SU7X/prjXVcMr7+naVX6rHHXoJJpNKBwlqxV7wOZuruF8or97OJPMsd3
 ej6J2xkqQlMeli1rg+S20NgEzCFpaaoZRJr28X/pxKNA0+ne51bY8/EstFVSzgOQaI9cstIYUJE
 oneyEMhF/ednzsq2KsXPn7iqAjEi7EF2tIEuNEyMvAbi99PKsFvlUTL3a16HAkUMpJ9WFq0p3qn
 5vFaVwk8dIcymPx87VQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzOSBTYWx0ZWRfXw66jasR8ykHL
 RTykfmXYz0mIGb28N1UxdORGqVNIaP2KGgxO3v2AodWnjFD6aSaTI014f6nfPoWI5GssngPZl/O
 2WlrAuqm0ZLcJtBgrn48knDFnTf4bcs=
X-Proofpoint-ORIG-GUID: Lbmf8rcFpSJCi-p9lQzLbu-tNq066oGJ
X-Proofpoint-GUID: Lbmf8rcFpSJCi-p9lQzLbu-tNq066oGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240039



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

Valid comment, needs to be addressed.

Thanks,
Jie

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
> 

