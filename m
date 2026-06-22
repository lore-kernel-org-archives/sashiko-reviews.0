Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E940D56B
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134593; cv=none; b=FnfFzfXCI6AsqBO8BZSeT6L6lZrvJ3arrkxKl+Nntg2gu+X+2ZnB8DSVsmURbFs/Qr63m+3rr1FtgEeGpYfI+fAuxrdogXeu0r8Ycd7huIhiMb5EVyTWLAs/7DOMD0zZu89acoBdJsIqm+zEM0pJaKm2ZxO+HbWCkF8NIKql9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134593; c=relaxed/simple;
	bh=vyiHaAQGthQ7vAmdOVzz6QgYwvMNWkcqzr2STeD+EMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVUTo/tcpJR83rlM+zxcnoT2Iv4dml2rSYlKimv8XHMBEjtbMQgjgxVeKXbuY8kjDAJC5cO7k6t6m/YeDJW10lESRMKAq2JRsLa7/GEqcRYYxfAWAP5xky5qx1difP+B9WX4S3pBg/FlZDfY7KA2EdylLjGmhq5Fk4NE7S7r8Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXmV8iUN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5lOX3NG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXmV8iUN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5lOX3NG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFq8V1059973
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CphGddleZtR7hEzVNCHN3RYvRxeTDa6IKrCwZ8q/dJU=; b=CXmV8iUNNMjpfiwY
	gGasiUzLCR8+U5VzGes7i5Kv5P0noNtoD4UvQrKA9zcUUtSCOrmVsGYshLRK9LLS
	1zhebOrFndOr9zAJR6MWktOQLNj7kY1BH049lBVVvLEgwsMn+LT9pwuvf2NaqBkD
	kVyJIDepXDL7Qun87fY7GQ5V4WuwSquTvmny2eVM6LQAH12rZ7DQcyp0FqRZTxLt
	vYlQRb/x/BVTFPVDbZIBicaFDBPNhVYvT1ZGmSOOdX1Ua1185H9f51ODEyIkHJ3L
	2OfMAVdLV/WgEHyLSoWDg+V8eLnxdADxmO91wpPZ3ghcmQKBWPdegEUb3dZRNFLi
	GM8kEA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4exyn1snyv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 13:23:10 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69f03e6079bso4744911eaf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782134590; x=1782739390; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CphGddleZtR7hEzVNCHN3RYvRxeTDa6IKrCwZ8q/dJU=;
        b=I5lOX3NGxj/tOtyURcMGjRxmwB9DJDqKvIJ8Hvryi+QMLi9DyVAx8FvmdbZzv7dEEV
         UlZ0k73Gs/wu+XAdfILvNt2/7xNpCbJovmv+rkkQ3ihhkK73vB1c4NTVL/IJj3/haUdZ
         95tMQdf71z8+qZ7Z8l9xnrl0HMNDMtH/tdUmdqO3kGxeddrM9TsGhUtW/SWDmuxGW/tv
         cIHuUl7VCYNNxt5LLnZJrlpkrsWFLayqjP6kTu4q5ZQuo1ujnhT2pNyBBnquCRVDDSLO
         Dn6vCjaHih0GXQT1g0bmds2XXt/J/368Oc3j0KTxGnsRS+/lXoVQv4sijWwtOb+V+4Eq
         4fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782134590; x=1782739390;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CphGddleZtR7hEzVNCHN3RYvRxeTDa6IKrCwZ8q/dJU=;
        b=UKk+5PCONtW1eFWIuN2JWL1gy+T1rIyOINKZddgrx0tBsgYkHNHree0qcH7GWrw/FC
         IzBEI6xPRGpAB3piLPa1URJYuNABqsu93+uXG9lYGrLUxyBVCJ4397gmbUPkBhJpT543
         HvtBrei3F5KRQt1g0LLq1i+DK24MhtT26v59a0fih68/FPf8arOqbgcgE9qfOqpPdxEO
         X2jc8KtIwHTKHG5Xm9vy0LkZu+ZrisSFaOSv3bVDr30NffmVB1D5CAPUlI0/iiE0p4gc
         ZkjGXwo2F3AHg5wrDzDRniDy6nqIo3HtRREm7iBwZ9A9VjXlv+N4tpVuBlAbWCp0Wgz+
         ZEXw==
X-Gm-Message-State: AOJu0YyAXtdwtr1LDbiGfX09Jwd8HJKnHdwKKZc7CJmPiBIuL1+ab0pv
	hn7m1hIIekCRmW9cLYZj+814adjZrwWV1UBEwP8zKF/CiKfnnUHKjIDyu7Hj0K7XUW7ruGTg64i
	Z+kYq4Z4adDxIoWJY77xOezi3EA+yXSU1vhDSBeloTsEMsr0beRncaWMNwzLmr3ewKrdfezvtZN
	4OH2g=
X-Gm-Gg: AfdE7cnBT86+/xqtkL6sHi9/dN+DZvYKZC1y9RPRFACQxfYvzE75TbB/9IqEHmqPRmn
	E2hTQG9lvGmE9mltSn7QqOts0Rqa393uKEF3fta+f2sjTBFbNNY/Ra+v4v9wmf1jAmp4U8dgFLc
	XRYaSEXRUqa5qypswS19IslzyPC7F4XpENauQydAYkMSOx1/K1Npvql1ge3cS8lk7+wzYYXWqKD
	WKwMADsNdwvmA6aI89U21zmOcEAe3nBzvHgGuKBhx3rSsQYYIH2QqaXMDOqtP3nv6ayYWiUAvUI
	RWt7kDaOAZBz+M8JiQv+vj0R554W5XXxTnJCfiQznck8h3g/oNvbQwH7mIlhqnjYpv11toRgRSw
	7vyzSxV5PDHVTMpRdaSabEMWB42qcM//esxtLuejy
X-Received: by 2002:a05:6820:1999:b0:69b:5486:e85 with SMTP id 006d021491bc7-6a0d8935983mr10656625eaf.36.1782134590301;
        Mon, 22 Jun 2026 06:23:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1999:b0:69b:5486:e85 with SMTP id 006d021491bc7-6a0d8935983mr10656589eaf.36.1782134589908;
        Mon, 22 Jun 2026 06:23:09 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm362337866b.7.2026.06.22.06.23.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:23:08 -0700 (PDT)
Message-ID: <0a6f92ba-de8c-48ae-9025-a7570e53e453@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:23:05 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, vkoul@kernel.org,
        dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org,
        linux-phy@lists.infradead.org, olteanv@gmail.com,
        devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260622101959.37DB41F00A3D@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622101959.37DB41F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QgMWtedIelaF0M2SJ3D_3ma6Q7d08n8U
X-Authority-Analysis: v=2.4 cv=EOU2FVZC c=1 sm=1 tr=0 ts=6a39373e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fqWYVyBuAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5ID31NFv_XroeS7ycB0A:9
 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22 a=3EkFFxAVN7Xjp7FSp-fE:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX+yoYLh/D4Ki/
 pSzxhDxr3p+0uYekjOBGU8Bir/CGtSOvmXKi0UjG0htsLTwc4GtoiLEW7hoyKTkrR9oFPUKp7QK
 Q2YbS9bvwpawnCUdHFnD5fRKgUAYWQQ=
X-Proofpoint-ORIG-GUID: QgMWtedIelaF0M2SJ3D_3ma6Q7d08n8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzMyBTYWx0ZWRfX8WwdOcM7Pxjl
 W5V20M7KTaG3kxidjXy3wh3sCDRq1LCDVddyIJqqECHlFp2XgXx8AWXqlzAikKXPuUEJWTmPxVZ
 0q7p0ZAmfgkURsTZ0G/AQftUBCKftGEWm01zX5uwnd5y/EQUyiEB/vO/z91vAwe7Hl4Gum/DJWb
 w9s+PRuomDED38fASENUI1n0pQi9ke1/5CH41Ic0kCk0yUJN76B28plxkX/ZPIDwy02I4URlbML
 pQ+AaKWaIlsWx/SFde+zbchbdTUIU4eG/uYrs95HB3rzuw+zaGWJEEQiQYkH9DtcwRMtk4fMqly
 BrjC/WVdM4uHvZxQzhVrB7x2zvhJS1tli1KMN6OgqO5eCCdb/pURBAgwNySVyYwP4mvkY/DXVp/
 H69yLkaLWBLPOvp/nBQtlTfW1Gl1UvkRA6g1HcUeyGTy+7IKHC2S92BPj2LGXwbycY7duznXlfL
 kSBSVFxN2Kb6jEVouoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220133

On 22/06/2026 12:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Unintended replacement of BNF notation `::=` with `:=`.
> --
> 
> commit a9fdd0b065eb5b6394a9c33ffba0fd5194e80115
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: Drop incorrect usage of double '::'
> 
> This commit cleans up device tree binding schemas by removing the redundant
> double colons at the end of descriptions inside YAML literal style blocks.
> 
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> 
>> diff --git a/Documentation/devicetree/bindings/mux/mux-consumer.yaml b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
>> index 9e2d78a78e409..769243a2bf046 100644
>> --- a/Documentation/devicetree/bindings/mux/mux-consumer.yaml
>> +++ b/Documentation/devicetree/bindings/mux/mux-consumer.yaml
>> @@ -13,8 +13,8 @@ description: |
>>    Mux controller consumers should specify a list of mux controllers that they
>>    want to use with a property containing a 'mux-ctrl-list':
>>  
>> -    mux-ctrl-list ::= <single-mux-ctrl> [mux-ctrl-list]
>> -    single-mux-ctrl ::= <mux-ctrl-phandle> [mux-ctrl-specifier]
>> +    mux-ctrl-list := <single-mux-ctrl> [mux-ctrl-list]
>> +    single-mux-ctrl := <mux-ctrl-phandle> [mux-ctrl-specifier]
> 
> [Severity: Low]
> Does this unintentionally change the standard Backus-Naur Form (BNF) ::=
> operator to :=? It looks like a global search-and-replace for :: might


I wasn't sure about that... and indeed this should not be changed. I
will send a v2.

Best regards,
Krzysztof
