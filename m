Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795758549;
	b=Dwtd73ax4dEFjJCCOS4o+7iWpEs1qSrQurbjUgFxFSGwGG5H2tJymYCkd8lId6bHozOA
	 EOlEF1k8YRPzaA6TJJBfs2kBAoxqPCF0Mc6GurBSmZ5F/QoJMEeUV9q6zJMYZJHnI3EHp
	 3vpR7/aTYDQVKwyb7OTlAXiwJgmcmdxGg8KefCPxmrQPAhDfsiOyEiLP7rAFRSrHhJpRV
	 mLZhomelo/ZdoT+5lj/5kn8tSgg1UlL6s3nHLUYwH1AcBTklUu10KNMcIuHjsPCYK8TLr
	 Dn4cjjo6CTPAQIif0D1xCdrICJYkew+PJFgzFeki2rt8OmC5QDWA32/dlADca/kKTgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795758549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=;
	b=LKxT94vWzqdZOwKsLiIbWo0uWmMzm2WHw1svCMisDDigNwjz6lEPUTDumv9HABajxq3S
	 7LFl2aGQWVGGMj0ps0wjiVnoRFdcVVuT+9JP1WwNMVDsYkvVLRX2dgNvxgCX9F81ntG4J
	 Sq1qENZiXuhqp1Y5dAyKLCIQ6UXosrjqWkyOpZJT8FuSn+fOXAnToRPlf1pN2W7KwVQWw
	 EgUQjPmGbZ9jTgtdcU2BzNcif/mGJh/wbz/hDCmKn0GAkYIe/5t2B6TNzHoq2dMFkJ10R
	 HcGnYxkzJOkdqRlpzJv05urxSUMry9UDWSOxle9Dx2gLIHKHwNqkW0O+uqXs1zzZ65A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Tz/Rm94t";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5BN3hSd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8440606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 05:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8440606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tz/Rm94t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R5BN3hSd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJvrts3339622
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 05:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=; b=Tz/Rm94tgiqXwDEN
	uP2jXrA3DvlCgsru70ovxcZhMicU6q5ByvWYzz5f/nA6otkegSGhs+wBUif4LL7J
	hyo5P791CdvjAJHfs0Evhi/WChrLNRfYGYe/YUJi6MRzaBwQXIdVNcmBjaUylDwi
	GTxo2PA18Ayt8KS9ULW5ezUZXvfojT0TVQmxG4GVVQCZNEu6q+QI4Ct7UBmJxfhN
	idMz2v0GQUOmrby1nroC+b4Tutdn80M6vs8slaP4uyF1WIWN2IfxuEJpYDIwXrBT
	xVDcUZwZnb2dqzGcwbgczVZxsYs7g+BFu+EpkUYUB3aprUdFdvRXmzdEOuHWRc+n
	nXBf0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqjcr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 05:49:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b4cd0f7abfso4728453a91.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 21:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795758547; x=1796363347; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=;
        b=R5BN3hSdSx2VPu8n6kfS7/p2WH/yRESZgTxnerAG5LmCPlXelGb2ZrJdSLD0WKAtf4
         nwmY3q1oA14ZMKAjVSF80nih25OsCK4Z2Qn78aaSKOdjw4++qjVcmm8VAD0S2KwrSVNR
         k6PojawA22CdStj1b3iRBGR4g7Y0o4zQgrIsDhkO0ycIspAnYTWUzp6fW0WaolBPkRr2
         F+GE1N3mfiJWJ7k7STRr+1UQ/MKa6BTIvAixb1ZnkN2nkXkhVGpzUZCr4kn7yFkwsEwC
         pcPHCL7CwD7qEJGJzE5ezD/1eIIBM6jAxTBzErnZ5zwLvEivJWM/nPd3x9XrdUyHMr04
         aKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758547; x=1796363347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GfQs4vr9UyydQ4+bgkQHB6QahvelFzQkYoZoBIDv/zw=;
        b=1Xxs/JZ7mvbn+sqTvPqxPvb6++HCkjTZ+eW2yDIZpYoSl99wpvEGPrFcqi3tJJkC8J
         nv6rQ+m5Zphq55gTWVjjnd8jaA8uh8L069f9GvcDo5tKiRso5EEEl/5Iwm/hz270Nfoq
         J42ZQSEAZGPpH6Xg6eunGJZypCvOARhMRJ4qB6bRTGPwYhS2H7hEKtafgw+QVhHuYwVX
         t8wHFZnnxVyQB0BrmvflEpyZCPeaveKRqw0LcXKg5H9+V+cCLPv+JCc3bjpvDd2rITfM
         EuCfgFO6tZT237XNDjn5u4rva/FvWRuQAbt80ydhhvVQNfeN5YH/v1l7MaqtOMFpOHUX
         of2w==
X-Gm-Message-State: APuU4Z8f4fzNLNXf0bfDIXp9fEMqXuz44q0u3X2yaXL8WOqICb7CRAiq
	zxQtrrGh+7wXDZvKxXsVjL5Yjytkw2FBusBbjyunGQqFEg/tQOKbJQe8IWlo2t1WIz+XyTUjcYD
	um4QImVNrwa5wI7sUrDk1iqyRK4qto8MqpRZIoiYY0hzUWIPBiB0m5jP/vxTV7mRqP9RurUkO8G
	oFZ5GkTA==
X-Gm-Gg: AZFdTZcLBx8QY/HCsGR8Oy9h6VvYc23A3qQedz9Kws6yvN+7bltzC31eWTj29q7LPA2
	giNQp7lCtxNrVnu6noRmzy+c7FdzqJW/ymSraPi8nmvVgko4tRu2J0m9DaYUnyB8/r6JXn9ClcM
	3bjf5GxRbmPdU78fK8EFeuf2I5WtFe/z6bmo0zANoEh3wP5F3cVYppHtxnvumBD0XaiVmZvHxa/
	FS1n36Ac7l7uleanz6lVebeItbenXnavNOld6WSpkd0jUFYPdh/G4A0fe7n9Ugq6cuy70TYsS7d
	9/yp5/PgB1l/q02enXy6NOxe/L55aGdeIoJeoDFWW7APFzZE1G8TtmHXq9RBFs1Pf5iEZT5hIOE
	tYDXzaQYghTFT03kpZqqpW0kJsqBfpy1yaSQARbAXIWcy2quLuF2IBm8RHXTy68sRkSeQ5xfT+3
	DHj5XhcySK79ve1j4eSL3aP970cI/mV85LzQ+f5J313hp0cuW7pYsFyPUngZJC7swIzpEO9JGP3
	5rB
X-Received: by 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr23485255a91.53.1795758547091;
        Thu, 26 Nov 2026 21:49:07 -0800 (PST)
X-Received: by 2002:a17:90b:17cb:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b41cb20b9amr23485235a91.53.1795758546535;
        Thu, 26 Nov 2026 21:49:06 -0800 (PST)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11203285a12.18.2026.11.26.21.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:49:06 -0800 (PST)
Message-ID: <ab598791-650e-4f7b-a52b-8c1143d4f7e5@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 11:19:03 +0530
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
Subject: Re: [PATCH v3] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261125-mahua-surface-laptop-v3-1-875b9c63d4e2@oss.qualcomm.com>
 <sashiko-outbox-234804@kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-234804@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KcG-fNrieACvgMHxy_IbgZCH6glm393R
X-Proofpoint-ORIG-GUID: KcG-fNrieACvgMHxy_IbgZCH6glm393R
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b0919d3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FdlVxMdq-3g6CkBdzlkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX7BZSRYDcXX0K
 MvkIWvazltfinId9pl/J6GyXU4nm2pnJfc20IST0DMynC6OTw+Q+gvm7Jn1PrjQ0giaV7fEcBVg
 YV4oH0zi4J9wAr6+ZZOE1/kN7sA+TD4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMiBTYWx0ZWRfX3IV3WoLFWUwC
 eONi1NOh2ZeympDcxtEMrAAxZJ/ASxOrF0KQc6K2E0Ocu28R2GsBhcvZoVkyvLZBFmEKuhpb9N8
 E1LjoZoyil4aF/ctwWu3WhZIOUXP1p9g0qz6GNyP4InJDjuKm8GdZwGzSSqHPmCHTS0dnhhU96+
 KFxYhB8yK9LwLxXJ1Edj6pTXSaMWU4kefeRVAlrg9JrHWt/CKLAFgdN4HgIyj/n42Hx+KbCW7UB
 0YJQCbpbX502I4rv+SxHKYywRLEJH3w3hFyt/074QanrhuRGec1iiYkUClmJrTwWY1zhFG1xc5h
 3nfB90bEbbAyT3pBzRqX0OA3GHfCBuoZUudgu1jOFIev4dh1lALqJ8/M6VOaM4fZVPCJoj/BA/4
 6/k3tRAh2GArjX28mYL+tcVuBQDixvke63g104dyY+zjnulePOwhTcD2aFz/EuoGK4IQiGfRPX2
 GLPf6DkfvUwmMadfirA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270022

On 11/26/2026 11:13 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] arm64: dts: qcom: SAM compatible mismatch breaks
>    ssam_platform_hub_probe()
> - [Medium] arm64: dts: qcom: duplicate CoB PMIC includes and stale
>    regulator overrides
> --
> 
> commit 5ca42311513062b6586cdd08dce26ed93bc509a5
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition
> 
> This commit adds the device tree for the Mahua-based Microsoft Surface
> Laptop 13.8" 8th Edition.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> new file mode 100644
>> index 0000000000000..2f8c93d900df8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/mahua-microsoft-surface-laptop-8-13p8.dts
>> @@ -0,0 +1,1146 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +
>> +#include "mahua.dtsi"
>> +
>> +#include "pmcx0102.dtsi"
>> +#include "pmh0101.dtsi"
>> +#include "pmh0110-glymur.dtsi"
>> +#include "pmh0104-glymur.dtsi"
>> +#include "pmk8850.dtsi"
>> +#include "smb2370.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/input/gpio-keys.h>
>> +#include <dt-bindings/input/input.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +/* PMICs tied to Glymur's cluster2 are absent on Mahua. */
>> +/delete-node/ &pmcx0102_d_e0;
>> +/delete-node/ &pmcx0102_d0_thermal;
>> +/delete-node/ &pmh0104_i_e0;
>> +/delete-node/ &pmh0104_i0_thermal;
>> +/delete-node/ &pmh0104_j_e0;
>> +/delete-node/ &pmh0104_j0_thermal;
>> +
>> +/ {
>> +	model = "Microsoft Surface Laptop 8th Edition (13.8 inch)";
>> +	compatible = "microsoft,surface-laptop-8-13p8", "qcom,mahua";
> 
> [Severity: High]
> Does "microsoft,surface-laptop-8-13p8" match ssam_platform_hub_of_match in
> drivers/platform/surface/surface_aggregator_registry.c?
> 
> Commit e93536b1fcf7 ("platform/surface: aggregator_registry: Add Surface
> Laptop 8th Edition") registered the match entry with the v1 compatible
> string:
> 
> drivers/platform/surface/surface_aggregator_registry.c:
> 	/* Surface Laptop 8th Edition (13.8") */
> 	{ .compatible = "microsoft,surface-laptop-8-13in", (void *)ssam_node_group_sl7 },
> 
> With the root compatible renamed to "microsoft,surface-laptop-8-13p8",
> of_machine_get_match_data() in ssam_platform_hub_probe() returns NULL and
> fails with -ENODEV, leaving the SAM keyboard, fan, and platform profile
> devices unregistered.
> 

The wrong SAM compatible in surface_aggregator_registry.c is fixed
separately here:
https://lore.kernel.org/all/20261027-surface-laptop-8-sam-compatible-v1-1-022cc782b0f4@oss.qualcomm.com/

> [ ... ]
> 
>> +&apps_rsc {
>> +	regulators-0 {
>> +		compatible = "qcom,pmh0101-rpmh-regulators";
>> +		qcom,pmic-id = "B_E0";
> 
> [ ... ]
> 
>> +		vreg_l4f_e0_0p3: ldo4 {
>> +			regulator-name = "vreg_l4f_e0_0p3";
>> +			regulator-min-microvolt = <1080000>;
>> +			regulator-max-microvolt = <1200000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>> +		};
>> +	};
> 
> [Severity: Medium]
> Should this board DT use the common CoB power grid from glymur-cob.dtsi
> instead of re-including the PMIC dtsi files and redefining regulators-0
> through regulators-4?
> 
> Since commit 6fdce1f4a17b ("arm64: dts: qcom: Consolidate Glymur CoB power
> grid"), mahua.dtsi includes glymur-cob.dtsi, deletes the cluster2 PMIC
> nodes, and wires the common on-SoC supplies (&tcsr, &lpass_vamacro,
> &mdss_dp3_phy, &pcie4_phy, &pcie5_phy, the eUSB2 repeaters, and the USB
> PHYs).  Redefining the regulator nodes here overrides the consolidated
> glymur-cob.dtsi rail voltages with old CRD values (such as lowering
> vreg_l7b0, vreg_l1c1..vreg_l4c1, vreg_l2f0..vreg_l3f0, and
> vreg_l1h0..vreg_l2h0) and re-introduces F_E0 ldo4 (VDD_LPI_MX), which
> commit b7ff5f19bb27 ("arm64: dts: qcom: glymur: Drop L4F0") dropped
> because RPMH manages it as an ARC/RPMHPD.
> 
> Dropping the six PMIC #include directives, the duplicate /delete-node/
> statements, and the duplicate on-SoC supply assignments, and extending
> &rpmh_vregs_b_e0, &rpmh_vregs_f_e0, and &rpmh_vregs_f_e1 with only the
> board-specific rails would avoid overriding the common CoB rail
> constraints.
> 

I've dropped the duplicated nodes and kept only what's different on this
board: the rails CoB doesn't have, and a few min/max overrides where the
voltages differ. I checked on the machine and the regulator voltages and
probe state are the same as before.

This will be in the next version.

Thanks,
Gopikrishna
