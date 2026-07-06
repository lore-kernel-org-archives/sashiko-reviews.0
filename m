Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44D73ABD8C
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 16:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354171; cv=none; b=IWsUBtnSsQRv12BJ/UOPuCsgVkW3a8W49SvileJZGbK9QssgK0IxDlAYpWBO2KZ2xjj8ng75vmggueBVjUant95EsWEQgMZxtLbjm4Kbq+WSiWjupqWCz1zOGB+d9SohseF8UQSKsX1EOptVDNeoq5zbl55udaHy00SEiAOpOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354171; c=relaxed/simple;
	bh=H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWhrmOVWOPNEbgGqfQplXA7mCsOpM7iKNN0kNvV5YYCqqOSUwJYJjnPqSNm8YPBVcY42DXD67eKOsGZWqtrNcDktlemsinKaOYXON+uMJgpnv8wRluKeRSo7N3Dsj2OoJXXMli9fXVQ8vza8E2MbMS6UzMpv46BzGY1A3b5BfyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5out/2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1W9B8dC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5out/2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1W9B8dC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF97e947387
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 16:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=; b=O5out/2d24k2qMay
	wDHql2FmREAamhZVzZjgx/AD6jqzbBZRB3qPKMIoTFEyx3IIrRWfphkyuwVA6cFY
	nBud8K585JLnHP+xJRPzvhqmJl4BY1T+vmexxBebtr7uMmw9RI1DaRtV+1iBTu7i
	Qm2e6yqVVOds4Sy6KWpm0K8+Oc4WT6bpYf8N2THghH5qdIOBvYMXP/4ktVL+ia2X
	wFR704UYp/X8mq1Kilm1KP/tNWa9Ccur75QFa8r0FJilBAUNiYpSFG2vYE/wPubX
	5Y8rpS1QdSyvn/+F0hRAZYvhx9aky9QaLO27DEsws5xd5VbH4m9P+Sc8EAPokDVY
	DilxeQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h525nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 16:09:29 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a1912d5c85so4034809e0c.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354169; x=1783958969; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=;
        b=g1W9B8dCKUAIsk0Y1JGBnOK7IvOJrfpilbf5BA75WixFB2CdqHnA0kz1KTq1x2+Mj4
         P04GTlSazAb/VdQmRvro6XDYEqMCON1eRmjRsZ48XW2drUu3s7laNM9xqZ0tzOKDaVFv
         w7jLzZbl2m8f5FcXuNykDu5fqjCKpNgpm7mK+nCYeYOeQEUhE0jnzx65Z0B5R8msA0MU
         iZ5ZylcXj8boV33BOBDQZoxnrMDMRbVS/c6TMCizQ2oZlC87mDU484V0fKu8X33Cm252
         b7Il1qeqIAelgTE1bAx/dn6UuzYRkJxTKklx4fnVvsuAAq85XWY2ZNp2rcvBHshdtaHa
         iEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354169; x=1783958969;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2tdUNFpzn/6ESWBcmSnoi7TGh31VsVyBN+/LBxJM5s=;
        b=hqGxY3wQX56fM4PXC5D1uqW3eLl+5++DLVWGtEkR09crGcHPdmSPq1USGogHqnbsOP
         lft8bwokY4Xbcgp+N8kArqobzZiewKI7ZYV3Wrw21diDbiavzKpmMeebUUfiKTfoC02c
         L8RRdLd2xzfRQ5YOF52m5cqfUasj/KxvG5Li79yaeJgbEJscTViMMAiVsp41bAtazrUy
         tqd8sX8R4owUzWqKBrCYLw2VK5nEBBn/vmpGDiYx0bymm4FZvITqMcjK5Y/TmP7c8D+t
         PnrlBgJsKRUJ26YuaCQWZsT5p4qnQnljQ88bk+3WW/C7hAWVdGijMmyK0bAQAWi219zn
         psoQ==
X-Gm-Message-State: AOJu0Yxe/sYIGPX7atQpYrnxV+xYfwhiTVASkCWJOUOMlCec1kyeiXTu
	b4e6Mqzjg1xPn1S3eQJIquBrp6C2bY2Y3qnSjdtUJSblw2nMw3KuAb1Pb6EC+Uky3muO9zdBoBB
	AhiTWU7ZgTC6Lf4u0hIFWN+qQpjcaJhFbis2tq8sscC6sMsvwsGw3xbNyaMcH1DR7YTPuVUO2cm
	IKMd0=
X-Gm-Gg: AfdE7ck+myWBiSeJsUlvIZvXPde1gHuKMzcCuW19pQjk3OIOIW1u8Yu4vPvFM77PjwF
	L12B43pgAq+Ef2zn3M4ovVl1oEYJEKTKlPnGHynraa7aE+wNLQpP+go/vTEyVZq1A1sz4AknHSG
	A2TdlbuaSln4CLmU5nzR8J7v0Xzhe1RFzy9cDaVE6zsDQ/DAHX0i/C0Mq6FlHF4wlwzH3ZvlSbm
	KU2u3Vha28VZMGNu5MmRxwPZE6yOzsLUxdfDMrKRBZ2eWLEN1rQZxXbVW4ccNmVzL8w9dwjpdN3
	yLVDykktww+EHP6lliOvI65Vq1UjP2pdv5UMuyM90J482x/CNYijJfUf/cJ+R41VM9CLYeAKdfi
	3p24Wo/sI/Ymq9M6I3JD0GOfrkoeZu4xwoaO/e33x
X-Received: by 2002:a05:6122:4f86:b0:5bd:fc23:c9d1 with SMTP id 71dfb90a1353d-5be9074fe2fmr746915e0c.6.1783354169147;
        Mon, 06 Jul 2026 09:09:29 -0700 (PDT)
X-Received: by 2002:a05:6122:4f86:b0:5bd:fc23:c9d1 with SMTP id 71dfb90a1353d-5be9074fe2fmr746881e0c.6.1783354168751;
        Mon, 06 Jul 2026 09:09:28 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa09608d4sm26808465f8f.25.2026.07.06.09.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:09:27 -0700 (PDT)
Message-ID: <697f8c98-1ad7-4669-a19a-875acd1cb94a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:09:26 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] dtc: dt-check-style: Expect first device_type
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-4-03ffacff9226@oss.qualcomm.com>
 <20260706160725.07FD11F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706160725.07FD11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6nLL-rlU0XmIr81uDtLJKyAcyH83QiT5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX5MYAJVHInIAc
 cUTX8ggCFm7l+XhL7bcPmgZQkStvAdQQZMfT/YP4fL5R1063GbDnq629M+cRyP6xsn7nUOV15r6
 ZNoQmbbfuuzzuZ2YZbkwV8FtYj3WD20=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bd339 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=zlX9MPiCl0rqbHuUTTgA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX/wo98qgug0vP
 kkAS+nETcCLi14krfWI1a9JKjMNfRutK+xVHNrc70cytmuHCaWQOYlfkuqvh5giBo2miGhnLGAG
 h3Ed0pOYR3nacHsMj5EmkPteO5cEunBUarF1RfE3QjaxiikUuUg7Fsx4ii4C9SidlOd0NUdezUi
 ZX7BbrxiNCyrZi9QVWx983NKY5sqwtxNAaieeD+Ts5UgVXtHnuqL9SSENyjegdBkz+GMqLz0az8
 JJ9oIMp+ZtGerYTPrD8qnM2HLRe+Oudtmnn2lo4lni6PTYBE8yQsUYlenkdpxgiDpPHbmnSMQPk
 zszhLBR8aXSn1hBoG4TPcz0n4bgoZQq0Mmgpy9o5+g2Y/irynQqZQgZrWo4k0YNugYVdGgs4K+t
 a+pG02lLGf+ORLrYwmrQrG/HSPVSQdCqpdJv4l2VXHxBnASoDY4vUCvGOBuKHQ+U/H6EZTCwV9L
 1VhWzYxB2iFmWG3uTXg==
X-Proofpoint-ORIG-GUID: 6nLL-rlU0XmIr81uDtLJKyAcyH83QiT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060164

On 06/07/2026 18:07, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Docstrings in `dt-check-style` were not fully updated to reflect the new `device_type` canonical order.
> --

False positive

Best regards,
Krzysztof
