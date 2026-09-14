Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FF5481FD6
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401038; cv=none; b=IrOQ14IBOa8Q7j1u0QeS2pmYm48Eb/uw3W3+y/cGeIXCGu6RIlOCGsOuK1CVaKIwktsUVh8UMDb8Ee5If10JH1C63y3tmpxon/65uAyBPbToXX8p8q9MdQZiZZQ2Lqb8h3jzW/1sqvC5ZIcQHOB/dcQrJq74oDLj07mv+VFpOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401038; c=relaxed/simple;
	bh=k451+gMOysD3Eraruqh9nJz/poTGrMEDToEArn6yRI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CblUeM7H3IzoriGxNVqHVtmCe9zWLS736gaalldOxCXLUAfVE/ZB19g3dN50K0nF1j6dP9sx6bf77p4W8xabJQyTogVzyGau4LOJVtB/kcY2Gs04vne/QmtQHkHLdXWDgp6DVL3uog7rYWvsfzcT/KBoTkSsVupGjRls4FECwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2NdKtfO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5btawHz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2NdKtfO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5btawHz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0haF135640
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 15:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjWmSI9LLOuF7sYbpE+FB6ICXzIryi3249bljTKVuPY=; b=f2NdKtfOUYGVlnBz
	sKa5mCo4BlYuw5G9NPaKCRUph6mcjLxlgTV/yUZ63Zgjtse65IARtI1F/svI66CL
	/ghW6/jH4lFsw48ok1ZU9vHkqRKz0iujyibu9wfQI0s/E+04+1g0Jtw8wpb4ESYg
	qZM+AWEVG/qXdkrQ3n6YcLND9CgTiyCKK7LfyvudS9Ts5uFdj/wbWkG2kiedNwNM
	Z+rr9MaORAdx+i+X9v6bwaiAYk9q0zslcRum3IxbvFjcuOmJebg3QDDxEjDXGDOY
	Q+4RQ9bsdsi8cJP0BB9dJjqBVw1lpYVU06HnV+BLG5RUG0ImxqUkItD/UmfJ1DD5
	bz574A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq9dk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 15:50:36 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7909e307799so3225789137.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401035; x=1790005835; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YjWmSI9LLOuF7sYbpE+FB6ICXzIryi3249bljTKVuPY=;
        b=N5btawHzuSKjCdfo9rTOHZPuTiP+plXdUlsC1JcJ5JPNePaeAU35oof/EfOdpzN5HF
         nZNGFWakJjfazQHdlChmK3/wnFakw2lOeFNIpKt/jm2SlKSPIYz4jYsgyEfb5MBTaGZO
         i1K5zsgSr6GOHAp4dWdK2G1tb06KRDiOOqGgruVdUvFqriYSDPKcl9tLO8d+G/XJUf4P
         k6YYDc9tz58deXSsIUzimzvCoGhtpJz9Ine80m4yIUspeOt7xkrY6oD3cUGBurdYQM2q
         JejjAfTO6GwO6mVVg922RDor8+InbhaGh1SiFmfeEY+rUgcMg3GzmMeWn23aIcxA8iDK
         Hsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401035; x=1790005835;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YjWmSI9LLOuF7sYbpE+FB6ICXzIryi3249bljTKVuPY=;
        b=nQbRxQKRh4MYe2rGUB3CHG0osZimxYAttXcX86th88n1biOkUDtXpr/cdUdXIJgPQP
         o+WMtAwEQ0xc6JzmAWU21IRyRK5JUk0l+VnUeFLRD4kSxgEcQ/vOs5LL5I3AmH1e6iLI
         pXJxOvztmw48O26bOX6B91cv3RSKelolk05EA7YZfpicPntCAh/hfdLgNDOAJyJWscR5
         M1Y8Izs4X5M6e7ed2sxcDdxkiGDyD4o57oezjMA6Fhu8xyzL4qdxjiuwaOeRAeGrp7y9
         0nnxjIRWCzDc0YaVlsUux1JT2Q82siM3bQ4UX4bWoJ1p/aWyw0r7GsKnGVkSi7r8Q+8v
         222g==
X-Gm-Message-State: AFuF++msfLjfctCHIQE81AOFDQNV01Sil1poZxNaBlAR4MoUVcqBtzCQ
	cOvHFniXVzYvnpNnaLvSl65ENNz9KiIOHmT/qd6CjI/XHkkEuJ+YuwuOXZpwIKIJZhuaUXslLYu
	yEoLAIbQ+vL8RnfXCgqGxdm5q1PBcdQe5jGW3yBgqMRh2FS9PnKd5LCXZr/Uzl+9Vymw69Q0s/X
	KL+3A=
X-Gm-Gg: AYBFou2L6V4zG70MHk8HzCrIq4A2gfS/8A5MgrqLJD14+G2hLhXjDHnIbAEE+pU7Pxi
	alHEn/s4uTBGUE96ePn3Nt3yrr8T3Cdk9mKYLGCOV3ofxNoBt/fVQZ0xE1W7poph+DWxrcdHLhI
	hDdeL9fd/WF/vIlRZKrXwcS+Q7WkXCOx7sry2aueiP5lzPIGua2T181/ZK5wiBsQjNXLOvhUFTK
	gKbuaxOdLGzuQWLie1Tbl/JR8CcklEIJCViI1aki9W3g+YySxAYy7WL59f6v0JLjVlPXwuZGkhv
	HCTdIt9zYy+bg+JkHdlXJxsnsGUMRcuDrYEMLi5YXHuIvv/Buroi+AheIQmE/p25llYaBtqZ1CI
	btlxYa0j6QAaWdy/Z1Mlp6XWoNx1/
X-Received: by 2002:a05:6102:160b:b0:781:1ac:8232 with SMTP id ada2fe7eead31-79b58393a7amr2922900137.5.1789401030222;
        Mon, 14 Sep 2026 08:50:30 -0700 (PDT)
X-Received: by 2002:a05:6102:160b:b0:781:1ac:8232 with SMTP id ada2fe7eead31-79b58393a7amr2922808137.5.1789401029651;
        Mon, 14 Sep 2026 08:50:29 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm717375e9.10.2026.09.14.08.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:50:28 -0700 (PDT)
Message-ID: <c4eb78c2-ec82-4246-9050-74c59acf0615@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:50:27 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com,
        dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260914123106.44CC81F000FF@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260914123106.44CC81F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX0yPh/djAVL4Y
 mUlETi1D85T8zRIPiyfhDYFhF38+kOaMM/JoI1JXJufjUZZMB5SJLKfYfAbEC+0Mb61NF7mEeW3
 BN+kdisEkqzs9wl1dYBn9UJLPmfOsg79dV/pK467u1LbEmwzRz8HOWB/eqxRcRbnxtxCu9kjjpr
 W5LspZfRB76oYX+bvEfzR2q2W4/TFA7sexK4C4VUmOgqgS2lMDJ/WzoQXlGjQaJCk+QfupTC7Ts
 /kiQXLSjwIO5M53Bw1HghLbF3D0GGzX5UoDAYaa6Coti2fGT/xtODHeuMbc618HMmr1vM5gTh/V
 4y+baOVydewSrThkh7lY+ETcBqdbEnhGKT5maA9ztpa7gq/DkELflj+MX4upoCF5ieUhYt/TMet
 MVfc/WWu6jDiltk2uhJHeRh0m365GfQgycA9P2y2TAbVWxih3uBosYDX4f3J8KBFOlITs8599qW
 0DMAsqCw8zy4+Zj6EvQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa817cc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NWQlD2WTGmgqaikU65gA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: eJtx4iGp_W49cvg7xoRcXw0BJy6Br7oM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX5aV0eJP3JLbl
 CZmF9MJ155UdPKQRW9140ASrU5HyWj9cw2YDb8qP5ozt0dx8wk2QQTII6aqVCzQpuC1tOYzKTHQ
 FJ8f+yCyJALVRIO+/yC6UE/LETzeUBU=
X-Proofpoint-GUID: eJtx4iGp_W49cvg7xoRcXw0BJy6Br7oM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140226

On 14/09/2026 14:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `mdio0` block containing the `phy0` and `phy1` node definitions was accidentally deleted during indentation cleanup, resulting in unresolved phandle references.
> --
> 
> commit 3067fd6538b78515dc2a63a2028de505854e6496
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> dt-bindings: net: Use consistent indentation in the example
> 
> This patch corrects the indentation in various device tree binding examples
> to conform to a consistent 2- or 4-space indent style. It aims to resolve
> dt-check-style warnings across multiple net and wireless bindings files.

That was intentional, just forgot to write in the commit msg.


Best regards,
Krzysztof
