Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423917;
	b=QNIf15h/PqdQ601dPVtcNB94dYEXX49YCsd4Xy+soHBtK+NyvoexaPPovc/ZdvgWm1QF
	 xMAdecqMoPhYcJgI1tBfDEBA0umH7aD0AIwYM/XwFLaNU87Iwu7fWE1eZmV/UppmhKKw1
	 7G7Sqf+6YEFSDNecffYt7SBc/Rxi8YX3yomsXq8KPQWca+eGa6nBL0ZnC9lQ7TYiyFlM+
	 qUKH9Xty5RXR95RJmSXhKgW6HWB34A7BPQLU+F1jzVwEPLGBBHbSCyau36gIJUciwzJTL
	 dEG0JaxrZTrU7Si0wF0df+bkzIXFaTw4YWl37lwTsBYC2Bad17oTfOisphnPKclgP0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=;
	b=fzizkO2MtmeodniMRWwJQTpHGQVK8QFDy4zolV1g3h3eBGMQqJ3U7lJsxODMAMJSCc3z
	 A7WCcg8yWxEDBKX9x8ZCChUu1FqAcNwecB+0eMlyaiB1Fmva9EgxkPI67WKsQvCYa0/9H
	 QSKm/6iz/5YEGKU9IIrAF5UIXZq/gfe5huLwgAcMIXLrt4xFnOKuSDjT78KID4+ADfUDW
	 BsiYuVZV/HONsaExl3wiSdCx29BiELjRRAYuCjKTxzd1uhC7Nkqm83wsB0sA108Yw1amE
	 pVhlWUIdRxefQCXJdUb8ph0xaD8an4ZmTrtTX/LBBIh+ND7SFjX5balRYgJyn5rLZ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WA4r7QNw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I1cJkD9Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B244606A330
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B244606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WA4r7QNw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I1cJkD9Y
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIpCE13186600
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=; b=WA4r7QNwYdUWzD1g
	ik1urAHVhkUJ9bk3VXGgwlhcsaikJWbfCrXBb6izH5Gfe06Zx4kXTHnfndj+3Sjd
	5JRFprhF1M1qhbxvBEzVhlOAYHET9SZBZaVdom5T5ha5fgbZOD/4DAAIfXC+tk16
	pt/mj3d4+7WEWUIQkp/RvUsEu8dGMdUPprrekaTki+X99MXMqONYMLQsVU8lTevD
	B+4+JDh3lIiVAhVdFBV8pFzU5Tw7V4LQ3cHyvSa8i8fWudR+K+zwptxCxeGzKMgb
	BFaLCsIhkbpS1/FpZQx8F7txXChQdWsWZhTJNMzQwtfdwThxx+4eoa9vNP8EEnYY
	7YcNcg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdkeh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 19:05:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ece3cd5a00so2663723e0c.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 11:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794423915; x=1795028715; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=;
        b=I1cJkD9Y2l8cgVk4r+bSJLEujZpOrcTLVduWk+mJbPRs9140UeTd3pZ7z7VEgGxGz+
         YhJLHqDBDaivlML/vbGX5eXlaETkP0sI1nsHrbMr1B4Rr+g4J/xJh/0Nyn9S3R317e3a
         YaBOh6jByoz0QN1u+tiNiAIHJVr2V70R+bQUudKId5vLLV3C7z33aeqRu0hvT5h2HPw2
         rkfNexNPn2gHOf74SxKPeUB6peGzOQMxuMJQVHkk9I5hX1wQqsVsnFwNxQNluDPzt6dV
         iQuuZ5i6Vd10nzuEuZ6MtAWC8Yvzw9hVdDdMfPJwIOIdNfZiuPy1IC87QedfQUOq63tI
         Ltug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423915; x=1795028715;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHQpceOMVqrxK4K5nhzSoZfKVb5Q6Arz3ZXzuTEVYQ8=;
        b=qTzl54jSEs0PQNmSXBHpg6MLP6H8G4R6HiAuvknqDWyI4xT0i9QchmDyO78Lgna0vu
         G7h9kf3d9Ncu8H0qsTm8BJRQ2/xDbMum+qj/r2g8BfkfF5rbWdCe6qqZ6e+EOnHGTJHJ
         1M4Om6jQUOkj42KtiEpzF2U/6sc2waAzI6lbJPlBKCFRSC5scebluXg5qg1MgZPz06S9
         9UTA+leik9eyQc8TsYDIshRl80zs2woaOi5Ny6HN38mHXnwM5jUb3iTwR5kLrh5wxNYk
         s3zGzNMeUvDIsgM9SNuhAEoDTAXyL97RTRHzC7dKlzuuqyoFUVouudSfX3F/OAUfWI/g
         d1tQ==
X-Gm-Message-State: APuU4Z+VvNRAqHzGl4T6S6l7oNIO7oxc1ukMhzhDA+OLxBEuqkdgYoPF
	egOUudY9Un8xtVIMf1iFBgTNBQJYIgik3PYl3uFhBXLbVh2RD+Ha5sxjph3q4tIwSEYO77nPnmH
	1/EjBnZ6Pzy1szmyorsIlMWSMi+hd5HVipgoE81tnQ2UgL966omVbUnWy6Vtk6ZO7d6JTftzMWN
	7r+sQ=
X-Gm-Gg: AYBFou0qNWS5dGrLiwP0Za6iYGourLDbtl+vTDga2KTVD3u5XgjvsZDdc0WhmhdLg7h
	KF8hEBRA1EmF9NyZgvhXtWIBRcEYBS8F8LHnIbzRyeQBjeaPVZzjP/Lk1UGXH8Ouhsak4ZW8MmT
	Y7YVSpAiIUKZrEbOdr6w6ujCmq+Jope5deAjCdNpj/qlbnp9cg5EfD6f2J2qnPJgdFsW/WsJQmi
	Xw9C8ASnleKqjOJJBV3TMa5+yWpnM7oAQh8yHpSAMjU+TRZQe7gH/8W39nl1xjyTQCY8nqikq9q
	/9hXrXIk1XOabjP+E6hSYYOfRPKK/UJG7imkcuU4FHmRXfEyLfpkvui7qOUr8I1tbjBirdADvZN
	u5SzTk6kbY+z5ec8WR6Rh/0FEN47B79F2+YMJJ4snG6PrkFNr6X3vgmbfqjJpZqLOaV7g8PyDZt
	Y=
X-Received: by 2002:a05:6122:20a8:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee1c42fdbemr1303136e0c.13.1794423915169;
        Wed, 11 Nov 2026 11:05:15 -0800 (PST)
X-Received: by 2002:a05:6122:20a8:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5ee1c42fdbemr1303095e0c.13.1794423914770;
        Wed, 11 Nov 2026 11:05:14 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f5810sm9023055e9.0.2026.11.11.11.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:05:13 -0800 (PST)
Message-ID: <9e2aba1a-61ea-445d-ba32-95ec57ab8139@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 20:05:12 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robh@kernel.org, conor+dt@kernel.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
 <sashiko-outbox-209493@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-209493@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4bc6c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=nhleFx_QHpCl84HZKpIA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: F34HLIzFO5pegGcM-_WbSjHmHM09OYj5
X-Proofpoint-GUID: F34HLIzFO5pegGcM-_WbSjHmHM09OYj5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NiBTYWx0ZWRfXyMdNTWj4qGzj
 Uo6OjVmlSv94nv5IWlkUsm0q7t4CJCzDNv8X7hvxGmBq46Rxp0vAdlhzOoIT/ihcKH8rn7R67fo
 +8I6EvnY5APhDtWJRvPO6uVtkWRd/oKVgNVx0SZzGZHEePmN049g84c1NXaIpU+S0vkavOsuqUv
 DElbqaQq20byaCa7pXzpSYhHrAvELq9ffhHcvSY2Hi/MmRHnCGCHKrW9/oYu39Emj1k2r/cyDyz
 zQS2jqEhEN2QWovcyYoXZWNKeaD18ujznIxKQ9Evpe3a0DMFYiBJRRrFAAm/FdqzTexG6y+c2RI
 xKB15tvCFuXYrBJfr24eePI6ldPJl0n5SdB4cG2HWWk25HLPUGMNwKk0svoef1ZpPNbP2kyNeYA
 0oNzl4S3Pu2YxboU8eYy6vAeXFrmDtnYbhgAiK8wQ8pwz7pzm1j9fOr2qfBhe6hmwa2emAAKrYh
 ciMosId4grEv6nPsmfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NiBTYWx0ZWRfX4p3VwT+wRiOP
 E24vao4HEH/6Faw1E/7EGnsw/2IrJnKRkkW5ddKBwnxxeVlI4HVmflt+c+WNvlCpur2Yj10M28q
 0t964BeBq8oViErg1xRqYnlPhJP1ua0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110076

On 11/11/2026 19:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: msm8916: mdss_dsi0 left disabled on apq8016
>   boards

I swear these were enabled... ehhh...

Best regards,
Krzysztof
