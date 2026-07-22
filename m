Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0932D73B8
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700936; cv=none; b=HO4yq6zpwskCaQMZU/zz88BBd86FGebaeb+cBx0LkvQn+0pVrP9oxkuPYMbzLjwvdZQXZouDoGfW0UQ0tEij9vrjq0sBwfDxJ3pQR26urSf7SYHVaXhkpdpE9vYwutT72oRjGoZJl07AizuT5Uz/sGHhpU6TacSQiLKUSzEwvnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700936; c=relaxed/simple;
	bh=qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Le6iPS5LfEqj3/Ce/vmeU3uJOE+GW13DkJVY40wB661Lc/OTpFpFHuxvHwV4/PsloAfaKhI16Av1jzAG06QK0jvy1zL//20mS9wVz0FypQhoovemFNiP39sG0c5V2L0y4zSqT0HyyciotBVCn4/JJa+rwCIICpsHrNoZewmtWUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zj0fP83T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnVYNGOo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zj0fP83T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnVYNGOo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53jrU4045320
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=; b=Zj0fP83ThECWDScu
	Splw+uXGIh8idRDBRA9dw42YzeadaO4GnZkXSnkjap48K85AFAxBYHNN1d9s5jBf
	V5jm/zffmmzUvh4oLpPRjnwNlaX93OgRC9mBnrwLD98zRrc1r2sfoYhyPbcFcnvF
	odQdssDozPseIO0lXYCeFrSvlRmu457oMzv0IJMkr9tahp6Psp67e6vugSqi77jc
	yNKvVwelryZNV1vgP8jPHh8aDr3kp+FB3UVLAnJ5qTAF1Hi3f+FLRcKvB8gbANu8
	nnUfIZTVBIPkyGRryNmqOms0NpzISGolYefA1HhlfLGCUwd+KrZuBNGFgOPYz1yD
	f55/xg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6dajje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:15:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso33577591cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 23:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784700934; x=1785305734; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=;
        b=gnVYNGOo/x59v/mFZNWQR0GO1eagMSf78a+Wud8/IQHguPeyOVwCgk8+PTyJAo+qtQ
         qFXFXLFcipQwZGfOytaVm9zeDVo4+y0qT08fyxIMaL9CdDqY85zDlE78xOQxT0cnVGNc
         CUIxyAIhrmmB+NIUFBWAqHbsYkmZvK7leC/NaUom6HYXOyh4VjZ0FmENZFEnYhEb9qj9
         ZgsRlPQTQ9er0+zNXH59z13z2gzPoyWXHtFDx0kyrI/N4qqzyUbbvzxlDfYrQa8pLp/I
         KTBI66Rhq+19eauR3fUMr/Y7VL+eKUEbsUy18SFjGEVJ0w5Kzi36oIBhMBEAKOVO6jAC
         j6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700934; x=1785305734;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbmS55a4/XsEyhh0g0JM08u+BWNNaItpw+EELnt4P78=;
        b=CzVnTjJLbp/z8sKWC1ukPeU8UcXmYaQBKng4XtgY6J4YaEWhl5DGY78lfTJX+wxe5G
         T1dxgWqcqXP6KLYt4IxPSAHnz6x1M7WGQGesXKgJIKPNQ/fCQfjgCNaAgZMuXrouvVKA
         BWBhfHAiemo4whykFWcCZ5/FC0to8jimxVc4DX+LKVgXTXD0XFpfkISg33dyTP4Oy+/T
         8kf4eYO0C9RJkmj20AvsO5YstStzdh6HiSWDJHsOdFKuiTV5LP8zSy12Y3t3+1O2DvWs
         ntiRkwQm7Kp2ny4yUK2KFE6h8HOawaliAZzzKwsMhYmn5jjBhgT9TqZ6ZA9iPMsy1y/S
         859g==
X-Gm-Message-State: AOJu0Ywct3qmLFhnS083iEajQkPMYLaZ7Z2KVhlT1u6BCuGRwDXvvOhI
	r+K/uYSJ5yPiMipSUdagyVjaNvKo19KppjlPN5+DRNL+y5Mv2jgcE/FyB72I9ejVsa/WnMax9dU
	Y4Qo9U/TYOTbkQI+zXJjC3Eh4HwfKuX186dRKtKgL6SI7W56ZClYpyTLCZTnL4fMfTFO9hjxH0X
	LpbNc=
X-Gm-Gg: AR+sD10ZDmV6nhBDU8BKF+8hYw6uCNEh0Tl/O/pVanYBzxN15QyX+EUBQ+EBkHIHAx8
	wza+INfu2sM+2gskvF7EGWubbqUiCJW37kGf3mQQFk57sAZUjQhc0lq4Fy+Orw9nxk9Y7Al4ulQ
	odq/e54JyhD+SvMYl976+OJWoXRfEX2EfYKtKA3OtZkQDNyJ0spoFTpmB8FWjRFafIrioheA7Ac
	eYff4jHWdFe/WbYIAPreUOcwHV3LniGC0KZ35YlUYuKnPKNem01vzejcLT65Za//FjRuo9GSRfu
	T2x1UiHSWdflowJAPwkWTH7mmWZty8R1WBLHYMYzsKkzufHMwgXY3YkthG30QbVD169DAoFXQU9
	y1twQc2FSPwQLPbiKn/fivAXLI3HlHw==
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr35464511cf.25.1784700933684;
        Tue, 21 Jul 2026 23:15:33 -0700 (PDT)
X-Received: by 2002:a05:622a:e083:10b0:527:631:8d6 with SMTP id d75a77b69052e-52706310c66mr35464491cf.25.1784700933258;
        Tue, 21 Jul 2026 23:15:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm124219145e9.12.2026.07.21.23.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 23:15:32 -0700 (PDT)
Message-ID: <898004b1-45dc-400c-99e1-7ba109e81265@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 08:15:31 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: qcom-soc: Include Eliza,
 Kaanapali and others in SoC names
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260721-dt-bindings-qcom-soc-naming-v3-0-8f275c9d3412@oss.qualcomm.com>
 <20260721-dt-bindings-qcom-soc-naming-v3-1-8f275c9d3412@oss.qualcomm.com>
 <20260721160317.67D1D1F00A3E@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721160317.67D1D1F00A3E@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfXy3z2BI9G40uD
 ynmXDKDZevZwUrIvWabYyqY8r5G6TafZ9ryY5cxXxYelN5lRlgtKcdhHNhglGu4K325HWTFfDF6
 /GqgXQX4c14WfTxoOmbGMvZ1PQN1j6o=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a606006 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=n0SlpFEdo9-6FWldBkQA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NSBTYWx0ZWRfX5Twpu66Md8go
 Bl+clc3z38Gt850GuimwUTj2IwrkuzZYYwc17NGPWrTQNMKlPH6GnZZHkyKq1wAJXPkjkrm7QJr
 jo4CZAq7JROEAVBr7+iyU5fftofxCRBeq26VvuB1GHJHcytAcRcJLDFq7eHd6tF/VAhcZBpVULw
 4vgWFSAGZNc4JkLJ/MleL4CSEDyKZjQnQITHn1MdpVqckbkVyCd3WHcRhN4Im447rRsjGZIFpu9
 s+My+avrRz3z3S7bBC06G0xVLEbygmW0c/2TujsK3IT4X/T77923wDyJG6CM/77AK/bkTMQ+6lf
 90aj2a898blnH7sifaO+lJ5/xPNv0iF/w/BZYYnZVceI2vpCGoQP7QlD/ItiQurDSeUbNX0It33
 ISrmJe0J+AePhrD+ychWSJMGzJ+QGAh8R8EijLZu4PidFsPVfrmsDsOVGCi72MDX7ozPuaV2z3g
 0XlZ2NvmQhmmgE47x5g==
X-Proofpoint-GUID: YHO2lBGoVCUSqyT0u8wc5wEriKa0l2bo
X-Proofpoint-ORIG-GUID: YHO2lBGoVCUSqyT0u8wc5wEriKa0l2bo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220055

On 21/07/2026 18:03, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Schema validation regression for existing legacy compatibles using new SoC codenames
> --

Looks like false positive.

Best regards,
Krzysztof
