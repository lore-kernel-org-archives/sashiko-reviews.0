Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395341;
	b=okFD8HcrOz9DyOds9fIycWP4/fiR1cXKyDkWaycqIewA1A0D8erkV9q2HarKqHcCBZNh
	 4fCF6qtZc94hx+08HfM9KjDlv9bT9w3OsCM9sZbDiR0HgBMUGo1MrC6K/LzCbLsFQ/etI
	 y57CmFS81as2PvUygDqR5+msbgZEVu83UgysbNx2GNUOHG3OZIYUcHx/fHcdozurc4ie6
	 Nz7OkpNC9iRT0USyyxGeQ97RFPx38vC9nMUxAw3JPJRrx4cnMFir4d1qm31fe9qy0WGdp
	 Bh6vpQvVzSewv2PLK/q/PDrii6H7wNl6Sm+VmhW8IiSkKiuVAw3sy0h2iGxGPaBJdlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395341;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=;
	b=LJ7iMH1bsA1BxUBJkkxnbBnhd5FzRC02ZMka/ny4xIQ/My0Iq3GMDIjpBB+/Vd+2BZik
	 SU9BgTVUCyBRtpPmTeB9wMgLb7ZmLHG/jy4gCD5KvRY69/xDs4FEPvJH6fZr5uGbCTArF
	 L/bAYKLcrRs87K6SLruGG3kw8LvZlOsIqkHkK+jgtuJXmd3ddaloJfGD3Ai2BY8TqIM6Q
	 q8rxdhdsxxhFh1jfIIIoJLab1nYl3atuZlI4v0oV0vQQUO8geBxcSFlJu+Kit6c6ARGOO
	 ww32lj3EQV1kjCijtyKuaSqwiW59PEDbQTMXLxhYm51l1c+VIi/tsIV5VLCNDxzr7gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdPiRGuw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPvGf1Cl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE3606A331
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BEE3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pdPiRGuw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPvGf1Cl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABB0HdJ864185
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=; b=pdPiRGuwcTbIcMax
	Tq6emJJtjaQQrkh54EI8ETC+6YJLtePSWgVq+RHHyHbk5pSSGaLVzx/7Kz44RS4T
	urDVBRqyzjAepsRPX4mxvDxuYmQQLuRWm/tBQZGQZr3KajnC8IJPn4OqhR2yDVRK
	Rj6Ww5FRbIkfpqK0O2PVewf5i5/rIcus+KR3XbIyFgnV80XBvqAhQDV/ZmiogdKD
	Fbg8wUIHQ7N2tSucPrQUnyW5fL1LJ8yldTouYtux4t+/Xa5SOwCiWO/JzcNU3Yqj
	8UDLb3D8ULEW6VIoBpzMn2t+eDhXGnx02yrknAXhDbpYAE/N7rC8z1uHlQux61Pc
	aR71oA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawhurk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:09:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-999bc06bfd0so2160628241.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 03:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794395339; x=1795000139; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=;
        b=YPvGf1ClM1qZLKGR22sZESTd4DDLQU8E1nFFcLeTYH7XeG8ociMlNakks4+NmleLIi
         0GC8ywD9ErLZn4JLRL/E5BVSq/fZwJTesI5ShznoWec1otzlSUJpJ7LXrISGj6HKyJNj
         CATCajyCIGnk4dUcdaODdS2uDZZeq0bnNnGjxeIzC/KYhQZ3qfNhJxUH1E1SvKgT5U0y
         qzzQe0ke2YyYTtP85y+E26F1OJfz7480p8KDfcQRgsZKJeRAdRjz+f2eyWPhOXP73/be
         GrIk4KoWeUlgwCkQw4wZ8aa9ZTg4vhS2Wbi4iMCWb9vJMFt/0InRpqTPM5pZg5FIwn+a
         V9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395339; x=1795000139;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHF7jRXM+zw02VGvxhRerWYbgHE7/+sznttGm8ywh6Q=;
        b=j+l7iL/+9/1tJ2p+NgBk45/OturnMaHCWgqgd8F/G0wVku+m4C8KevphpOs/KIm4N1
         tKHEfzPPEiL8E4MI5yt67vDoMUm47cZz8IVigIMKL0ttqoPIzdHlf2cvurl+afwy87yx
         NvWgFLsKphqcjVKtI2lNiEgkOcmAxrSj1Mn1GSxFB5W0shLYzFTx/eHYtWAzb7Nvozfj
         bXc+eZU1QdbUSFRdS/f3bWxdGSVXG34EKz+zI7MhS8BzWmsMjYl/pTnCwippvVF7aYWe
         kZMQ8xOx8+q/5tsyvCg0CQqaxT6pIyxemcgZ9QD1JTmDN+f4ZciVv0fw9N42hMWi28Rv
         GX6w==
X-Gm-Message-State: APuU4Z8r9ctF2XMz8wD/IZGdvLINhNKrgVyhYUQ2eeL+MPucSD4ZFIFg
	QO9NyzDDIGbzkh+Jp5TcAlnd6EbaPWVrj2UPZtop5ANUS5BI3uVQj8yjc2Yk3laq66SaU8drulc
	6PdTTR2fxXfdXZOK3YznMEEqTU5RVj+y8+VSkce668lITkihkDecKFWD9uJZa3LLJRjPeNddXrN
	V6HtM=
X-Gm-Gg: AYBFou2yB+jey9hGy7PZRwbFOYvnuz99/E1vPveyXCf+1w1/3xcbiPa9PCSB+6kNMga
	2qDdIdzWXtWXviKTW/8FppCFAY4kHvVofL4yaVs4ZdbMF20U6zF37CAnS6GTM2OM5bKbZFc9au1
	Fe22La0UaCB5aj85XgUqNn+YjLZqzP6ZjaEvElIb/TrHrGEYLIm+Z1pmpd9tZA2f8WeZUMSwDiy
	+YhTmY3XaeAsDB62kyxkOLFGULORMLUqlNo1CAlZZJe7tM3Q2xauR+Y9EmmlomTB7BOYnFLPDOp
	SN7Gsi/goAGpfZ44YoPrQcxoT7RlYIv6oQT5imQ7HHZEpgdmimPouoRR3Y+0LRX2U1b6kh0UNVM
	a6IkzviYWNl4Bos3wCDryAB9/JKuwqhH3XHEzOrlOFDY1Dh0VXPlzg5EJcprZuBbz32SvcWgTkh
	0=
X-Received: by 2002:a05:6102:3ec7:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d4fb2d76aamr606142137.20.1794395339223;
        Wed, 11 Nov 2026 03:08:59 -0800 (PST)
X-Received: by 2002:a05:6102:3ec7:b0:7d0:5688:f507 with SMTP id ada2fe7eead31-7d4fb2d76aamr606137137.20.1794395338779;
        Wed, 11 Nov 2026 03:08:58 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e423dfsm51330085e9.1.2026.11.11.03.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 03:08:57 -0800 (PST)
Message-ID: <3b2e2b31-cf65-43a8-9a6c-f5111aea8ec6@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 12:08:56 +0100
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
Subject: Re: [PATCH] dt-bindings: example-schema: Show example of
 dependentRequired
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261111090449.53511-2-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-208675@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-208675@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfXzZpQph+mK4pi
 HXCWu3NBQCpRXxyl8OdJVfYOgcQGpo7E8mhzhBGAbQJvTmWdNNj9tJBxBgj2XX+WWW/JlK9+RGg
 6IqqwIC0Y+FqMjK4uZ+2FB4VYlau88M=
X-Proofpoint-ORIG-GUID: ZXrP8NBPqd0_VlhNW805qAaEJOG3FUsb
X-Proofpoint-GUID: ZXrP8NBPqd0_VlhNW805qAaEJOG3FUsb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NCBTYWx0ZWRfX1CQivmWM9MS7
 vaQm1ldQooC2qTXmCr+eDFOcgmROfGxfIDm/P9FW85a4KNxhw/B/a4qGSaR61H+iE+xAvS0S/ar
 b9koeQjV9jaCPbsk4sQwwI8GXy4H0IRJszH/sIC58XzX2lFu/zcX4Iw0pLYq5SxbhskMuTQvN1e
 CeIlNCN7kwAY4wVPw5ckIy9A8wCLdmpQsg5IiT0uLTbFJsIyb/wS3axbxRO3OsGJJMoVQ7l16pY
 RbU/dI+weAkcgkyhdYDVuq+TV1kvTMZvAOWber71os+GemfLYYCS2MGbBXZdoJwGKqzR8xnektu
 2/8FjqrPanNQxQ97dVGIlBUP/4lN16M+snj9RQw4LrCcwC2J7N7WWjXdOdT98Y7g3zbFBjOIvdD
 cuHlB+nU4EGfM7d4fo4R3gTPLU4sJ+6ViRfixU62Mrj9UbKkZGVAJNLSU3/BsZ/PV8+nkI9EDet
 Uc3+FjmvKJpna0hbiqQ==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af44ccc cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=WmuVTcnx4i-heN2spVUA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110044

On 11/11/2026 10:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: example-schema: conflicting and duplicate
>   dependentRequired example

I should choose different properties...

Best regards,
Krzysztof
