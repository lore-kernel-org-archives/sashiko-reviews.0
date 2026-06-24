Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111F345CB2
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290103; cv=none; b=Spql5uLzvO467h1jzNj4bxiiX1iBt3XcrwtlhoUMeGLxh/Dvcf0cmIhaLEssf14hTyhhX4bVg177HganqmuWZC22XhPBrTFE0l2xlTvACAKi5LVq6N0ZDHu25NSmOls8juc470xVcjzbEQlkUwjBfVcR1Fc0p3/ypPi7B1o01yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290103; c=relaxed/simple;
	bh=htoxQB7Zr4deDUOX4Mg2XTgZsnaZj1b8ci5u3iYnfP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otrbwXS/peU5N+/Z8Lo6bs98g5TsJJfJJtsu4Z0z94VHIItpn7xvIWC5NmHZBKBcpnQwY6e7zF/mkTyFKs/zsn0mK9Y2pi3Tt20OtPpF8wZgBpvHUYtl6U700PptzmhPIz9llgnRr9J1Av7zrul4gH9sWPQ94kPKFQJglQ0RH8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhSKEbPH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwK7R2JE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhSKEbPH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwK7R2JE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7FtLH2440420
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 08:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5mrd230kpk0uUu17irqvk0Ds0ZSnBgyPtN1TTgwZ7Z0=; b=RhSKEbPHNn8q8j/e
	lguLjB8G1nVkkg10CM8wZv7GhiT4Lo1Kmz1HuUTwjC4JHkfUqJTV6uBCbb7WVWQl
	ne8p7cXcbfjslXvAqYatgyXP0dNERwSRpMXLLbTFKv1Z5qyqk3CcjfONNhsS/+uP
	b7uKVVMp0mRt2r6BURikDlmZ8VDYOY/rDACDaX11KOxRGrd4wunDZT2waN8iVlIV
	QwA8Bm0VoPMmDbC1mnbyqT84iaIxYTJvxVtSGiAfulYHd2GQzfVnDQL/qzRlyblS
	cVcVw059dQfoHO2TQBeyDg6jZ2BgNq0Ol+m6jDuH53FEwpp9l/3fXCBNU5mQn/3Z
	CVIKzw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq08xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 08:35:00 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842211d6e48so1095650b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782290100; x=1782894900; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mrd230kpk0uUu17irqvk0Ds0ZSnBgyPtN1TTgwZ7Z0=;
        b=iwK7R2JEWPhxBlkSojxIXb7VWcnwN5xgKd+uvgI6dtRYzGeMtzAPiVdAV/MXEJB1hm
         Fr0nF2MtpPf3GMpaAd655zt+RNJXkFToZbdGmnVjZjdzeyGu2QGEYHUReoKrtj3NEZN3
         WDej+ir2cQKC+Jj8SYDQZeGt3nQ4FfTOjIPcopAoPi15aP6mhgYTJXGFzlFZJWpyIYHL
         VErjcInZlytwvlHBoc3JthBQKi2xZdQLG20BPuAXNoUG7/vtFCbuohDbt33OG/dJLI5N
         G8pSdaCXSU+tpcGoKBymFut6EQVuRrdN508DiUa675gMSGVL3Sqp0HFApw5ccq93Verf
         AIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290100; x=1782894900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mrd230kpk0uUu17irqvk0Ds0ZSnBgyPtN1TTgwZ7Z0=;
        b=oehij0fZnLDTLhVW438oFPLT/qpSRuonKK8Kwn77xIPe54ggYom7UPa3clHfWQk8ZD
         fGPRgfoeicsj+lK8+QNw6x/SUfvxopGZQXB5STtLc3cuxlMihbUt2hGFkdL0B1SmwZKU
         A7LXInJne8JAKEr0j+v/QndUZ7YVpTvMhV1bnoWWpcutW6KeMhQ2FtAXY9DPivopYVhC
         AOU+gr6PlTiSIbYPgmeEzlqBVpI79GrCSrvHC23y1vHESOX0KACd9eT9ClFar0swj1fS
         adpG1EEiBoDMppqdWZqrCWXvLjxwN7IRIV8slf4r7QTorspZgUmTNbDXWiqz1QV75jQ5
         ixYA==
X-Forwarded-Encrypted: i=1; AFNElJ/c8kUIMMQjzwRRefNZTPgcRryHb/p6LkBl849yGCOhQTOm9cifROVdqkQylh+gR7iDV3Zl+2LF40pidtgVpmk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw24xAE5lZAJHCKPmUb77P9FXjIjX7s+lxt6qujnQLQ2etlyOEF
	xfhHb40HVAB/DLS4rvHiCwT5Z+am15zZ7sGTwei43OQtKlHiuQOYompad9zRRnpyx1uqlOrmSCQ
	CdeFopaMI1LaN7VW+T3SpOT+pvIE3HYNj3B0rp7mjeww36RKRDoE8mRT4j0NqVR12lHV5z8g=
X-Gm-Gg: AfdE7cmyqvIkE8juKnsR1SUQG4RYvODgtYQcgtlQvgSG0mS2RmuC0ra/cvYFHdfr8ki
	s/p9CZLeVcwkVsB8PzP6eTSdsj/zAuKG9vfCUDttZAYDlcJbrEMcuGpVHirdbTIcxuaaj4+HP2l
	6DSQWmAc/VRJOvpbqJu6JbWhgX304opYEdFlLeaWB0GbZXutXfCYKyPFBy1mr/Ok0v+NR6C8m2T
	lWO8mTJNeCCRrilQQY7GUFrZWbLUWa7itT7Tayb7oDuBbd4mi2OGrk9ticnJpHTlnpi9Q67ZbvV
	rVx+lMVpaSwy5fW02hdHssfN/D9FhbjIUJIGDEbz8UL0m+3IvgV08/8EnYADyzZ9h0vfsLgmV6z
	g80iPpGmpAaYxwJvmMAvIO8EyUaMf72EoK7U96RVTqfy7Kw==
X-Received: by 2002:a05:6a00:b46:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-845a2cad138mr3014609b3a.36.1782290100040;
        Wed, 24 Jun 2026 01:35:00 -0700 (PDT)
X-Received: by 2002:a05:6a00:b46:b0:842:7992:bdd6 with SMTP id d2e1a72fcca58-845a2cad138mr3014577b3a.36.1782290099604;
        Wed, 24 Jun 2026 01:34:59 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40f4722sm1628731b3a.43.2026.06.24.01.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 01:34:59 -0700 (PDT)
Message-ID: <c2bb7a24-e1d0-4308-ab53-208901108a5a@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:04:54 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 04/13] firmware: psci: Introduce command-based resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, sashiko-reviews@lists.linux.dev
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
 <20260514212353.881AFC2BCB8@smtp.kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260514212353.881AFC2BCB8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2Qv65kL_rneY9CYTfW_u5lt1HbsXJrcM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3MCBTYWx0ZWRfX7n8CluYgOnNc
 FkxSCJg4kBdiiwiQCECJoO7mhhT+RaMJRYZK5T18qdvxvjeYTckWCAgmORx5tebnAY8a6DY94DU
 dj3FhDDnXz5E7yiBGHqcIQGkn4JTWcd7HQp8EFKcqrp6foMbgEEEs66mioJq5O5kLtzpqqceUea
 fFojoGSWvYjjp6pQjDhqHCI8vuLhKzmB6tKkgJSHpIHS76/39fV8j5DyFY2X+ZHr4ktMZCkclcU
 Jya/MEem9rlQrw3qeUebHOk+AVWOsIx49UWM8ZZwnTzsY4SuzePTZ7nO9uvBbogr8qVDlamXP8I
 oWvmYcZzndvATAbqtC4yejaBhl56l0jj3uBJuFvQkm5EucBOkTwHbRBmx74d04xAro/HwUt1EX5
 57alKLh7c3hSELauJx24iJsDKFrcRzXaPHUI1NxhyNC0FQjaGncxh+/k6hGQgnjtN5jQJfAydZ3
 adq5W46Pd4Jlm+mN2Cg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3MCBTYWx0ZWRfX/xxy/PeycfLf
 c+TLIE2PJrojvFl5j/DHW1hfikwoggmKuyInK+V+4f3hBE9Pn5gEyAvpNchkzapcTaRbqO0Og7b
 pCHchQPktXac050mPN/HOQmzcf7Yemw=
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3b96b4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Mda6OO27nty_hdtp-zcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 2Qv65kL_rneY9CYTfW_u5lt1HbsXJrcM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240070



On 15-05-2026 02:53, sashiko-bot@kernel.org wrote:
> - [High] The API illegally truncates the 64-bit PSCI SYSTEM_RESET2 cookie parameter to 32 bits, violating the ARM PSCI specification.

Hi Lorenzo,

Was going through this comment. The patch currently uses a 32 bit 
cookie. The spec also talks about "SMC64 - uint64 - cookie". Can you 
please suggest if we should add support for 64 bit cookie here?

This will require a re-design for supporting about up-to three 32-bit 
numbers in reboot-mode framework.

thanks,
Shivendra
