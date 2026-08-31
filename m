Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3E6443E5E
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185629; cv=none; b=s09qrO6HTvx+MCGIO4sCEFTXu8Jn6SiYLkH7Ln1xqCqBkJ00wlwxMK21Xe6EsL/48POnQ6iSniU5CcWvV9zzN+KcOeRwFUJ2HmY4N7Z2ncHS5PaJ32QS/tch1nMvWFhOHEZEnx2N+ncdBUYoA7Lik68gy9s0KljRU2miMFeJqyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185629; c=relaxed/simple;
	bh=E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkGXgdG++jYSB1HNa1UfVTBmAw4ltfuzXDivRoOn2pBRuSqNlsSeCAmrX3m6uskVd1Sincc/vpvMpoKBwNoj2WQAOMCiKfbVfc+o+8LGPPqlmSKuua+BXc7G/uDn6QcwqQX01hMGIfgkAClNKnFpGn9gA5mBxOaHSDKHYTJYxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K269S8Jb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=he3/cTdi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K269S8Jb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="he3/cTdi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VB9vQn2762695
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 14:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=; b=K269S8Jbbty1RrDC
	4bAQ8DH1K9WJrF3+VFDrmx0T/+EPPDFh49Fsz3D1vSDqe2u6IWgtJFUrJTwatCnW
	zGJmDxJ7ao+wCdxmgZjmwKkcDwgrx6VRZ0D30k1QuepZV1SwL+lkUUdcT3al15BB
	0gGSFPLLWl50TydZHbzAZuLf0Ax2IEXyyVmoXPOHukJySl2x94FqsQrKVlHGghye
	JEeWmX5e8Z5gpIM+aAwEf0ZCGiNVuGgNVOm9qMZdDfF43UeBQaNdyBwlUHHSpQf9
	oDc3RNfqIZE9L2qxfHLnhkjlq+hsI/asJjWPlYrneLCp3JX7hsQzSzdaReY+AsCp
	QYkdTw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcs6re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 14:13:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so691972685a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788185627; x=1788790427; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=;
        b=he3/cTdiPsr/NXq/nzA8NTBRhevZ+8GEQRZjwXFNk608VPLmWu13GmDztZvtzXa00w
         pDD1MhApvi6TIDVBDCCEa+JE1uOXhGxMNgUYkdq6yENRXO6tSYisNNgLTjcWFM5Zz4YH
         qaPdNKZMHRN8RyX/KU7RcHRmhN0/E8QTKoQ4/eBFaCMHiTgZ+Q7pj0FDpllHgmOL1wmN
         btpC35VveYpqxNVrpEg67JUeXPzMnphiM9oas4R1sYjGCfEbdCs3f+bS+1ulWm7q5d6V
         PfgKOCRnrkie51LILqDl9yG7BGNbFjgmkXyFXnV+P2wLtNPK6EvAQkRseqQ3EnIhAFbI
         PhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185627; x=1788790427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E78ibfppvvm+3TfkUryYoTvM0UqQpmxLebovV8C4ws4=;
        b=G1ugZVcuhnBm9WZVr7/UzkELIepdxVq/1ULt23/Q2m9gC01CWLlrcjXM3v9V6gxvaH
         nepetO6BrJOQnLcvp8KCq/lrQ+5NkoxgHXWC6tFwgO9AWlqQ/qWfWcrcLBiIxmM1F4LW
         5MpyJJ5PLeoXZTjH6dSEAB4NIDzUoPQhZ0Dt25okwTvlavg4odjlb5QfHbQMjDxZkvKe
         JN4OJUwFedUB1XqMFtRnFv6cw1D5VqYZAMN/ZJBnS5/9DIq07gXu8iHOQ5EezFiQ4dax
         MkSf8P2WlEBs5w33E5pysiCiqO5ueuHbZwNU5Hjc8oVHIYnwolB7FBPUHNcfc1DbTpmB
         d4uA==
X-Gm-Message-State: AFuF++l8f2vxenGzOgpXu346pGek15YVTZ0wLKlULJ/V8VLvl9FB1Eb1
	FBL4DNGsVyw2ujJvjZAcBYACM1iNNRTDJZQC/n56bCfLH6XOwy676p/q/srXJ5HPnA7qFbeiIpj
	YVpd460hTsA2hKfJSGga2hHaR4YUghOtS0qO/bSOdDJR5A14e+m5R9yExzFaKuD4bWeToJVyckx
	MHhw0=
X-Gm-Gg: AR+sD10+cXv0t31nHqMp3078xouivvvJuit/x9naiQNOTet0VZX5p3e2w017CStACu9
	8o4kH3E0Az0xkGr45HAXVfrVxDbhVjvLQobZmkU7O3TQ6VMPji+JXvbhZ3MCPNCxNW2ysuL/9U6
	l+/WfcGEW0S4AwQKBYzvrPOZgRI1JPDRFO95Cj2SbRTsdFhG6kyV1sDsxgXGCWhR7B6sRpWpjYc
	QEDHt7qW7KUGAtUAXwAmhIuYxUxm39cE3uZqPDSLeYmCydkulQP9opXtJlZ90vW24losoj7Wdh1
	k6VuvISHyAeewp6p/Y8+VMMBCkXx/Ac2Rab/Pq0zg4/IRdLZjQTQAehUXnyBdssmcFPNDY9cH67
	qXMNfWjgcy+GxQFW+zSmOUrBvenTq
X-Received: by 2002:a05:620a:469f:b0:939:319f:d6e3 with SMTP id af79cd13be357-93936bcaa24mr843605585a.5.1788185626839;
        Mon, 31 Aug 2026 07:13:46 -0700 (PDT)
X-Received: by 2002:a05:620a:469f:b0:939:319f:d6e3 with SMTP id af79cd13be357-93936bcaa24mr843597385a.5.1788185626367;
        Mon, 31 Aug 2026 07:13:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee7335asm429888266b.27.2026.08.31.07.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 07:13:45 -0700 (PDT)
Message-ID: <d95ff41c-dd13-46af-8836-e93ab0926288@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:13:42 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 06/12] dt-bindings: display/msm:
 eliza-hdmi-phy: Add Eliza HDMI PHY
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, olteanv@gmail.com,
        dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-6-67843277de17@oss.qualcomm.com>
 <20260828141031.CF3071F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828141031.CF3071F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX+qLMHfcelKFg
 CIu6uYq2wd94NQOYF0WF9hI4/3qSXf2DFxuePqQt9N++48sUA2t3HOBJYJ70w7ofEiLByjiB7D9
 AlxJGp4e4i+NmrDRxvqlpQUv3p92BUpuqqMRpJ+BorqHMr7mU8UpNbWydFQ7pw9W8AQBT2FXaBx
 Nv+E+MhqDVyCKRfsd5+ug1p4+HzdZoRviFzc9Nznz7ulYPQlKGqEcDzghToHK+RU/sO2WZvEAqO
 WnAvn0A7Nl2BFdX2tA8Hsn519tSW1t5uGoF8y4NHs1Pp1fneZ58RwCQz4/XF0025Q86ojp2Vklz
 Z+MuggVjlo4MXdtKAIr3JZejIbgoz9JXnDeWFNThA3VPnt7aJsde0aJqdWC0lj3UZMOAcRksiVV
 LvtY154HcI/CWlzvFDNWehsMw3NHHXENoOMjFIHyroelTbt2UvkT1yZJZqJOiI9qKxX1BfFyHz3
 Q6qGiQq9kP+WSl1IE6A==
X-Proofpoint-GUID: IPF0JE79M8d3RriayddMV-U2iHSorjFG
X-Proofpoint-ORIG-GUID: IPF0JE79M8d3RriayddMV-U2iHSorjFG
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a958c1b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=AWiUa7ILvgJRdtSgjkkA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyMiBTYWx0ZWRfX8MO5zsgduO0x
 iqVH3QeBJ4VzxfcaWeVDrlzTQQauSCY4xRNH5JbSK20m2upyKsJ5N1EM9SDNlfeIcwXNE0qKzR9
 1yXPjmqN0ojyW0noqd+8dKJM6/8d/eM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310122

On 28/08/2026 16:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Devicetree unit address mismatch in schema example.

copy-pasta, ack

Best regards,
Krzysztof
