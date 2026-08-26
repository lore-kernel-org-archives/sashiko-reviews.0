Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C883932C3
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725387; cv=none; b=ukMVzATgGfZBfMzZDWgxTJzpXzJlqwodsIeZZUm2qwSxDRGDU2CYSg+tnsvOD7i15EJenslerzGGX5GPMGzbK1LRuxYnrDYXawphlwfosKkMx0HAXsexechxWW+vmH25ma1le07RzvVR4Zjp5NvlQXTZRmecSCAEltAdO9Iq1Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725387; c=relaxed/simple;
	bh=3QXEOD1U0Uh36+JdrBhCR7dYz6qdtWtA1IGp7Le5Eoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIsiLTFglPLp4oiJnXKag+KerRGTkbEWj78oaZ4onKe8iPJsJ7uBTAbmFrZkYzIhOuZUf78rIBz8nAIVsX50Vmyu/rdfqYvHoxSm0zOc1008PiHnCYIXiOVkKqxVLM6qNWb0WRJI57Tjv7JQe8qy18TVYxTpVfVsGgOoZGWbbrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=esGKyVSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoL9EMU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="esGKyVSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoL9EMU2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3H9RY3275587
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 06:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSehP9pZmD6wqvYGE1qE9kdYqMW6BBNpVtJye0hLCEE=; b=esGKyVSN8q/2O83j
	6R84fIT6T1X0bT1SHeSAvXe5GWsvvvtzlpigYTSWCXYSVYcAVEkSZlh4KDJ/ylTU
	SStGXchTjIpaLjW8Q/KUMSiJ2cPFPH6iSI/ZJzWgKWthHTn7Wsez1Q7vw5l6jUb2
	7Dr9HkPLHSqMEVWteHEJNCdEO5j3DGhsJCtBdTYmyQhbTRDAHLeBnmqghSL0sAuA
	Y3q7Qj8pAVOVlacYCS3oUZzJWxS1Bk0pcD/gWYqP3KnAX7eZpHcYN8RRlPEaZUxV
	DitantqsECNbccyvKFt256fxi4BmQcuOUBQImsHeVSlR5OVrUCe7+OfOeua7xUU/
	0+xZBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn2brb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 06:23:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so1030124a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 23:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787725385; x=1788330185; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSehP9pZmD6wqvYGE1qE9kdYqMW6BBNpVtJye0hLCEE=;
        b=AoL9EMU2VUgkPIn/ySg9+KiaKg23YjzqNmu8oegW3403vw5DBw5e4LHEAYnFu+yRZA
         LYSfsuBUdI+vGP0CvAZMGntLvTmP/wpRYQ5sWqKsg+lAXKjQnJ/godLGu2EjqnC326vf
         VZwJIfnnDxmVU7+ZbzGV24/RTRameBg8oQ9ANhydTyJjc9fFibXmV4sp0Zu73T/PBiOn
         J+V+XXskjxwN7Hn55mvF4+qW98yVbNjlq6dw+QIUIQhPehExswoZqYkMqLj+QbviMUYg
         MOCUaf6LXk3w6a5hKtxzakHy5XI7BRRC+jid8HH8NtJ3SzNvjAw7QlgU4YbWlJ44vlvL
         8NxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787725385; x=1788330185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSehP9pZmD6wqvYGE1qE9kdYqMW6BBNpVtJye0hLCEE=;
        b=WVxqm9hya4yyQfwd262zldqBHPB2MUDnWSAaF3KuGXj9yspetw3A545EID0t0w4djl
         TrzjOcaTQ3cddz7y2k3AqGBdosgSvBDp40Th+oNzWLncnC1ei/tJ+W1RNnwrWQ0CIUdD
         kh47Y8zcr6IUdNq5Ic046fwvi9UuqoU3FQkpUuyJ8oK5RMK8UoG9Xg93JSSPXkIcEnZ4
         NEqrktUHn9NB7hmoBea4af8mvwapPI7+tT5c81V1yRbAf4EHqDaBe9lDod9BUAVNlg4N
         ijKv8nwizbTPWcgTjkecXWC3IPonHtC/gIUzn7sxTRneb7dnPiQXrhYWW8qVY0B48tBM
         xeOg==
X-Forwarded-Encrypted: i=1; AHgh+Rpxj0R7IVMh0ymwZaEfzF9L66omvaKS2fqyalg2pf7ia84cdT3OwoEhpnagJZ82EsOE4MaDM0VDB8i+/AYXsYA=@lists.linux.dev
X-Gm-Message-State: AFuF++kVbJyIekOb4Lx2vc5u4N2c6um9ffpQY8GnyONwL5Ka1w/ytk9K
	AXEYSXKodxzpxNOR87iOtcWil76hYDAZaaTpqjNcY5bmgwy/1pMzLfxAmYpypfDWJojvhWpqo+y
	e8uUeu9shSsfDoP3dOX/H6OJxrO635re0OGewUmtttKRSkzR142ygOHeu5D6Ba9kkPlxwYMw=
X-Gm-Gg: AR+sD11NzgEiKXMyUy2UGrV9GXiNM/oZObfQyuzRuPa6XRKY+0jMMSZZRUJqkNsPjn/
	sNYgMdU6JgTBFIQWlhgkPxa6WXCZ/QvM4ld06YLAwb6+clTEK0eTnvscWHIbBluk+TAZyrqQ2Mf
	r18TJkqaTJfsix767CM37Vlo9j9AB7l2U+xngW+Aj814UbRhjSEd0gqFOys0rzjpX5HLE/2+WB+
	W+X0AMZRahu3TMCm0K9QiKbNOXoSehL0C9UBg/4irdPRgcKCnl98RWYEPa1OrmKXSADt9ZOWeMY
	0NsL2bowGhqq6kzrs+8GEeaRejxlnjh8lRXVX8kh23bpJtv+AUHjtAh2XEgeWXxkY/mfxrstQxR
	oQ5Fto6rleQhAmw5Iof5fv7NFfNleLdY=
X-Received: by 2002:a17:90b:43:b0:393:1cf4:d972 with SMTP id 98e67ed59e1d1-3966d160f58mr10170215a91.3.1787725384745;
        Tue, 25 Aug 2026 23:23:04 -0700 (PDT)
X-Received: by 2002:a17:90b:43:b0:393:1cf4:d972 with SMTP id 98e67ed59e1d1-3966d160f58mr10170110a91.3.1787725384241;
        Tue, 25 Aug 2026 23:23:04 -0700 (PDT)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8eefd98sm8837621c88.3.2026.08.25.23.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 23:23:03 -0700 (PDT)
Message-ID: <cb9a4cbb-b90b-4575-a08f-9695ed4c3461@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 11:52:59 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmaengine: qcom-gpi: Add I2C High-Speed mode
 configuration support
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
References: <20260824-i2c-hs-v1-0-8dd94e5c6113@oss.qualcomm.com>
 <20260824-i2c-hs-v1-1-8dd94e5c6113@oss.qualcomm.com>
 <20260824113653.402771F000E9@smtp.kernel.org>
 <ao37oOa-EkMe5qXH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <ao37oOa-EkMe5qXH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ekr7HxofoUrJB5x5d618RiIH0z94d-BJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1MSBTYWx0ZWRfX3EE9H3Ab17iv
 Lk24O//A8GOdHAX0v8sfOtEk1zEnwKeaj780MCNDYZb7l33jgdlMJ34dtAtkI4gwxfNx/TOvzCJ
 QkZ4jVQpsOFWgg0NVScOex/AjDb7ejA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1MSBTYWx0ZWRfX+Vagaq4vbHLA
 1cYax8FUV3TdyCVLdllkKxOXOuA0AIrwQsAG41NeIZlSR1Qs+4QEMSoxeiDYgj5NCHtfr1DpVPT
 A89iEL8/Ih7K646ufOK9QF1ehEn4ghS6bKLLnXvBLT79mr/UKhyzT4jmpbdvMgRYm0gPZZOb1O1
 uSGKocLOk1VX2uYZYS1q6zvDKty0c5tfvKhqSB9mzht2L7AaN9yXNhGs0iFuQ0qA1iY6s+P3ANS
 LxROBjfD3norKfv30+IkjZ9Br1c6zmKs+epUz4v8PyKmyz0taWncXMtLnnulKRi2dNfKhMgigVQ
 JPl5BwlEoGwRgK8hs1fJSB/wg5IpMSmDoP+VA/gOYXuOTWsThJVxw6VoaIghcJUWdsspuuSO+H1
 0RLubQNaN/ZlUoEjaNDaEyiuiy3ryh/rppGdFMPXGdB7eQZUWlN5PcqEIVIRbBx1cIPeiOwnBkv
 hb3UtGgNQHEn6qQS3Lg==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e8649 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=sfN08KZEuhO3BiQOocAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Ekr7HxofoUrJB5x5d618RiIH0z94d-BJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260051



On 8/26/2026 2:01 AM, Frank Li wrote:
> [Severity: High]
> When I2C High-Speed mode is used with both set_config and set_config1,
> can this cause an out-of-bounds write to the tre array?
> 
> Looking at struct gpi_desc, the tre array is statically sized by MAX_TRE,
> which is defined as 3:
> 
> #define MAX_TRE 3
> 
> struct gpi_desc {
>          ...
>          struct gpi_tre tre[MAX_TRE];
>          u32 num_tre;
> };
> 
> If we generate CONFIG0, CONFIG1, GO, and DMA TREs, tre_idx will reach 3
> here. Writing to desc->tre[3] would overflow the array and overwrite the
> adjacent num_tre field.
> 
> Later, gpi_prep_slave_sg() sets gpi_desc->num_tre = 4, which would
> overwrite the first 4 bytes of the newly written DMA TRE, potentially
> causing an IOMMU fault or bus error when the hardware attempts the transfer.
> 
> Should MAX_TRE be increased to accommodate the new CONFIG1 TRE?

Thanks Frank Li, you're right — with both set_config and set_config1 
set, we generate 4 TREs (CONFIG0 + CONFIG1 + GO + DMA), which overflows 
the 3-slot tre[] array. Will bump MAX_TRE to 4 in v2.
