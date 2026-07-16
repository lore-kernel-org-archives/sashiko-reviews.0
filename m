Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAFF1AA797
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784171246; cv=none; b=QeIZx0wy1APTzOMGWVwZEhlmtcWFHXCTEcKRNSXYSLzDf9Ii8NeG3JIO3j3YlHLSqIzQkyclrXnylMaxC1ykQLmNUku/L7B9ArMHGb6/d0RFkW6NJkS9FYrnxWFiiSP1XCeABWSl8c7gh7QfgMR5XIdn8khykv7vseOjVrmqLB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784171246; c=relaxed/simple;
	bh=/UJRK6D3yVufqnwJNnfHrdC4GBbWgiY71qr9c8vzhts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKklUuDE7vZRZdjJ3qcsbBNCIoG7d/45AVxsQIGW7m8qjWIn7xsrcTpkqoqx2K6AXjKQncc28O8uBEmkVK/xmqpKvbxfNW2Sc5P0iusCXEjUnoUchrQK1M+8xo5Q5UMach8lOROt1ddtIxsS6J+FFoes9yro+w/vQNJsW3a/1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBe07Y/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ke3Wtg3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBe07Y/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ke3Wtg3m"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0Xap01305020
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oQ1KIuqWah4dyLVQGgcaf3i7K09sCl1iS5GhyRguhQ=; b=cBe07Y/Zr2n6PGwX
	edGoy3DxeB+jXCK8AXrpLCKQInd058pOfMznb2ZIBW8qMoWCcfbnrWrmz+V5SRKh
	izMhkbl18+ptSmuYDqn3pwDSu8MnrC7bHyR03Qcb0WnyKf9Fh2cNp94PDzzNpt1O
	8r4HDuuankSx4oocgEgoJXTcwKmvrsHW/TnQDEs6Qobzobx1hH67u9CQWQ5GYx1z
	UcaIdpoMQk/02q7+/Ynvfh/KAqeLQYX+r1GQ0cteEDkY9wa9AORCFE2a3pO3ZK+n
	/xMHS/hMuZ/67wlozo1HRs+m+E4PbsYJaiVm7F/eBsx4EMmbNDrqg7rjpXdaKFLB
	Un+sVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe855bpqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 03:07:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e2da7191fso1054020a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784171243; x=1784776043; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9oQ1KIuqWah4dyLVQGgcaf3i7K09sCl1iS5GhyRguhQ=;
        b=Ke3Wtg3mnIOCIS1ISrcqHvpnMVqAxqeF6j7Rm0fQW4zvHSRE0QLl5+7JdzgsmaC7sf
         SF2gTxI31skRGpolnxk684FsH71zmDTL3Q0eHPWiyID9VSplMUh6wfJMH2nK+VXkoxTJ
         fuJoj5wUAmvjJQX1DMCAwmeXlKFlus3hT5FrTfQmIT2q0NFq7fHK54AUtkwsPTup3Rv7
         JJWkS0P2w3f8EV0UL/ZLU8Qqh4woxIOV45f33tMxg3w4lfJJQi74u3F2ner2HrgoGiJm
         6q5B9QIzFgDjvotDVY+9NRZweia+m6ewqpRs0j7Der29M6ULU/SgjKV7WsgddzQcIVnB
         TCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784171243; x=1784776043;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oQ1KIuqWah4dyLVQGgcaf3i7K09sCl1iS5GhyRguhQ=;
        b=JljAvnU/1rNW5Hra4i1v8PXFSwjB/npsy+cmIJuM2fV978gB+Xc3QG0WyMFkHvRxUP
         lpi6UHVeV8Wd4iKys02bs1yjpwefaUaZjcF2K5iGrAysXoL3yR/1wizwLrZcWfBxnnoj
         FqO6gSXzeGmzGxQrXNuoLS0G30Jtg39+VGUR+GHk308P9Y731jSEpn395hnEbUW+S1G7
         8v5KfFB0zcyTyKyXiIyBMtyAZHVuOXVnEAXRLAvGjW+FBqCzBPGZAeARZb2ViAuNNcgl
         GiRVrNTK/j5ZdoOsjX4rWFFIwDy1ZB9kRf8faHXbb8+vG+1UPCgWw8qIxvvFrGfxgHm5
         DJJA==
X-Gm-Message-State: AOJu0YwzvFI9lY/z7kVTNQO4plFfucHz6xsYuj2llGCKP5v/YIzA1g/M
	OhX8gb8JiI/VSi049VcKjJsZJHCFL8i0I0FKzqk1zUytItwVKdOKomCJXrThdr1uf/j/TGcSuS3
	jNGgaeLwWcngIC8ykVsCJ9vXNqE9f4qNig2AYkJgb8XZ7wru+b1nQWN6rnsL9qX6DinBOJjuGa2
	Y9nC4=
X-Gm-Gg: AfdE7cnbBMQ4ku9yKasa85VuOD+/Xs9k9Isr2+uD/C0457LGYSQCOzntTVeqcbVf36D
	/bg1/qSyNDQ+8uFIFlu0h4m/FGNs6yOIZqaS+KMD/ZqueCKv4etrFfOwBvmENRVNfERiPwXQK6K
	WdbFrbl6M23hXF7bn8Aa/idkMr+pHDh7uowYWeS6VbXUmWZryIoz3+T+FKXMrH95GKR+Gjx989P
	z0K/IAZdr4NAKECeOAXQPOmDZiAuHKbTsCaZ/mM+MXqic9gjOnudiQKpOSSsJ6JrdyFjdMf7fu6
	8vygsi4bJp+7ChoXCxmXZdQ8tP+zP8SbKWKu71t+0AUzxQLbSCVK6cri1DLMHLV1K41A3vjm+9K
	Im2Eig/gm8ZRwfxgVb63W+zn/hE9O9ffF
X-Received: by 2002:a17:90b:554e:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38dc7bb6bf8mr17608482a91.38.1784171243106;
        Wed, 15 Jul 2026 20:07:23 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:387:e0db:bc30 with SMTP id 98e67ed59e1d1-38dc7bb6bf8mr17608445a91.38.1784171242540;
        Wed, 15 Jul 2026 20:07:22 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c10dcsm6946343eec.23.2026.07.15.20.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:07:21 -0700 (PDT)
Message-ID: <b179ac7a-af91-da67-3232-e9e41203ade0@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:37:17 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <20260715-glymur-v9-1-8cf2cbe12a07@oss.qualcomm.com>
 <20260715142224.5FA721F00A3A@smtp.kernel.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260715142224.5FA721F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hEN7Cu8SQEON7bdZXxIY6AjrPdOHgsFF
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6a584aeb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KnhrVl0X9m98bs8rsNEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAyOSBTYWx0ZWRfX/w+gTp1iXKLE
 nLaHiJj06yVG2B5JI6j3ER97vdKrdqOaqEja+QBKJGO1/rPwKN7Qy6PosNPGIfPSqfQkDL8pmFP
 8Svs9kyYZJPmL35Vx19Qts2IkCkDL4SDbgUq1Pi2EAXXZDo+F40w9wcjcXRJSafj1UDl8ZnlzpP
 UgYGvv4Kq8JEn5S1fLK4WYOGf+Ve3gw95Ge2eWxbuJw3EjOdBgOpDov9jR+eZDcq0dFv+7kVzzi
 DB4eS77yYPtGNDvC4XTmL6i6zl+sWim1e+DaGJurVuXvwkL1ynGyvoRWSwTrL8wg+DhJfPs7IL3
 qmM3nHVI92j0GcyG2fG30ObcJHD1Jl/vomv+OYaKSZUKs8sQusJ5X2Ef68LgSdkvCyqMng3T5qY
 jDlVp0PBmgXhN7f5daU24wc/6XCBD3bYoTMR5kxDOHdg/XlokmubcoVXoxighZtYWZzPSfGEnMc
 nGb8MMFSccvMXcce/Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAyOSBTYWx0ZWRfX84+eWwCHz3Ri
 53vE3/qSz1EqWVS3etvxnca0g7+wdIh/E2i/7F2+ykDuTHVHxopwd9MM9D90/S70z10/xrPdLBQ
 PnvMnU5FEeIBNQo0a4W9wKzwf6s/TZ0=
X-Proofpoint-ORIG-GUID: hEN7Cu8SQEON7bdZXxIY6AjrPdOHgsFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160029


On 7/15/2026 7:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Unnecessary `#address-cells` and `#size-cells` properties on a node without addressable children.
> --
>
> --- Patch [1]: [PATCH v9 01/14] dt-bindings: media: qcom,glymur-iris: Add glymur video codec ---
> commit 8ca344fa9395fcf1d13bd1ea93de8bee21a5c176
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
> dt-bindings: media: qcom,glymur-iris: Add glymur video codec
>
> This commit adds the device tree binding for the Qualcomm Glymur Iris video
> codec. It introduces a new dual-core architecture requiring additional
> power domains and clocks, and updates the maxItems limits in the common
> venus schema to accommodate these changes.
>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> new file mode 100644
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
>> @@ -0,0 +1,255 @@
> [ ... ]
>> +  interconnect-names:
>> +    items:
>> +      - const: cpu-cfg
>> +      - const: video-mem
>> +
>> +  '#address-cells':
>> +    const: 2
>> +
>> +  '#size-cells':
>> +    const: 2
> [Severity: Low]
> Are these properties necessary here? The schema strictly enforces const: 2
> for #address-cells and #size-cells at the root node, but none of the child
> nodes (non-pixel, pixel, firmware) define a reg property, and the parent
> does not define a ranges property. 
>
> Will this cause the DeviceTree compiler (dtc) to emit an 
> avoid_unnecessary_addr_size warning when compiling device trees using this
> node?
>
>> +
>> +  non-pixel:
>> +    type: object
> [ ... ]
>> +        resets = <&gcc_video_axi0c_clk_ares>,
>> +                 <&gcc_video_axi0_clk_ares>,
>> +                 <&videocc_mvs0c_freerun_clk_ares>,
>> +                 <&videocc_mvs0_freerun_clk_ares>,
>> +                 <&gcc_video_axi1_clk_ares>,
>> +                 <&videocc_mvs1_freerun_clk_ares>;
>> +        reset-names = "core_bus",
>> +                      "vcodec0_bus",
>> +                      "core",
>> +                      "vcodec0_core",
>> +                      "vcodec1_bus",
>> +                      "vcodec1_core";
>> +
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
> [Severity: Low]
> Does the example need #address-cells and #size-cells? It demonstrates their
> use without any child nodes containing reg properties, which directly causes a
> dtc warning during dt_binding_check validation.

Without #address-cells and #size-cells, getting the below kernel warning prints.
[    6.953615] Missing '#address-cells' in /soc@0/video-codec@aa00000
[    6.968288] WARNING: drivers/of/base.c:115 at of_bus_n_addr_cells+0xa4/0xf4

[    7.440909] Missing '#size-cells' in /soc@0/video-codec@aa00000
[    7.447044] WARNING: drivers/of/base.c:142 at of_bus_n_size_cells+0xa4/0xf8

>> +
>> +        non-pixel {
>> +            iommus = <&apps_smmu 0x1940 0x0000>,
>> +                     <&apps_smmu 0x1944 0x0000>,
>> +                     <&apps_smmu 0x19e0 0x0000>;
