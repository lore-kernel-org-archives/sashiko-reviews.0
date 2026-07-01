Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBB246AEE0
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904785; cv=none; b=mRalVGABI1quJ0OGFueEhG4xRenpSQRS1Ecv11jdiDF9HNzlUri06id+tPeSnENFT/dS6n8syYJhnQZXwpcQdOWyKVv5hLXpApBE7/NfdmuhiBrdbaCMLOY3IvQk48F+2UgvO6dTySQPckp8x/LWlN0x37pf/Toid8GyYpmQRhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904785; c=relaxed/simple;
	bh=XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0ZazM4zocP5CNbWe56iNvg0/skmSdPkGypkiHrfvER26WFN2vBhGm3La85dWTEaKumzhwy5dGT2n9QmmbpZr7SBY2L8eefzlolGC9Lq+MgaUuse+HUi7rePRI+IMrHU39ocxJCsjd4x2IZ2jiWh5zVzUoKz7jeS1QwRJM0xMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bWKyGNd1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtUi8UIh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWKyGNd1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtUi8UIh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8WJu680973
	for <sashiko-reviews@lists.linux.dev>; Wed, 1 Jul 2026 11:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=; b=bWKyGNd1XvvczpUe
	PHrG5mzfEqT2e0thbQlHw9hoCJUYSpgCfKP4Y4ABWAeB+sb8PM4aR1CeqsqmRDDU
	eHebo8aLkCUYFtJ/DpMHBZ/UCNoWHNOTBW+3sfzme7PbwKNZK9Ldey5zEqpO4MTf
	q8Gd1PRlJVfLSMECv83Z9YvfAe+kG3vTHYPm5aMBP8JuVrn065fz5zQKvsQK6/f0
	zohtyqpezRyPD2T1Sdumh4jSTA7YB3qGZPnhfEGgnhstMIOBud1WfMMHJa+78ZSy
	ufyaNj2vLbT5gNiAIAn7S8QDw805c51Jzev6eZwmid7+R9cd7nJAcIizp5M7mjkd
	3zqJrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3skvgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 11:19:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso47727185a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782904781; x=1783509581; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=;
        b=CtUi8UIhTwJxLmD56kscRpn9AkhTs+JCehUdALP9SnsDimAqSQ9Yy0Tw2Npi0fj5DS
         9yfhgtKDwbPNxKqZfFRGhK2HzM6zo0krBaFNnSUX6NdQQZix+aDAa9YJYxFKAJ6lb09i
         a09Kx85eJpRkwzDr6YmSzCtSliBakqBP1+sncbgo2WIqyjuxbrCFF7jzl+vRo//gnmGE
         87iMAPl8U+IQFxtMgrQ52L/tD+PZkdGwlHmWKk5ESaVk9JB/sAJkk9EhIK5DbKukvkyH
         uwGfBJJL3i1dLrZPkjvMktHopFhvU03kWpiJ6vH6WML/tG9YUBH8qurBbUZEZ5HwP4ot
         65xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782904781; x=1783509581;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjCW/Ye0yMNW9bajJ3o4jGFlID4CY7WbWyI3PBuG56Q=;
        b=JvyRRhwvW+WzXeuqlz7fByiZWQMmF+eIQDISyrVnAFZf3Exl/MPFlEGGGWfHvgdWkB
         +XgBd86UXj0lkA4efqshiOs3TSrrZrnToz9T1FW2nfneOsamHaSrmJ2RB4eeZBSaYEcc
         J6/t4P6hm05Zua0QW0Qk62tLUwrG65FYFIHRR2MWVZxDrlLYCCJtFj0aDXxd5LvJBi4e
         2ATsgtoH595YwHuptdJ8CuCgKrEdPNuriR0Sy3cFKFbgvTykZTMcfd6kls1Lr3wkLeiU
         3JCNAQPaB7I97JJoyKOqzMhJQ660qK6IwXY2PKL3PUAvLErdAT3iA3p2BbZwgQXM7gDL
         XE6A==
X-Gm-Message-State: AOJu0YwqCFkLR3UMYor30/cxQSEhQzACBATF7s6IDmIzV9z167zNAJKE
	PGtaYSi/RXeY4ltMxRHxDmBhTTl4psw2UtiaI/lwZdzPL/ClFX4ISxpVr/X9vjTigNB9OmGb1of
	uaciEtNyr6ilrgMCuu7aFqoOCijC/tEU3CXqiscDJZT0KmwffZIKindUXHpUtB2rtqSgqJz++Hj
	1znbo=
X-Gm-Gg: AfdE7cnEVNHcsnR3sEo0GDh3FTQ6ZpVjvhg3+4gRAmcPmUgCsuyku0Gcj5JtlToVkHZ
	TKcoZlJeDJoAitlKbRf2P65ieD9cH6MupjFbTPwdhu7AYuW3P8UnYW7WEjZEENnd6DoC2H5yXsW
	uuhYr0O+5QsynJM0+mEV76dR1b5lr8PwPhOgzr9+XpHC6dzI5OrrN1YTPzYZ5hGw72J3SXsXVo5
	uH/YLxSVXXptQPPnMe+StrNGPhZjuGArIIDfWhL9zR9+4DlnZQKgtfOhWdpM70HllIKsGn/bcWX
	F6UPec3FwCGgCYtAVk0+3h3m51c/cBaza9qCWnrBVU4dN0ntYh/zk7RTSdwZ2XrYWHieZUteXEd
	jvmp9Y2fcZi+k91vERRCGOdmnA5lzMhyoN/eCQ5kP
X-Received: by 2002:a05:620a:29d5:b0:92e:7733:e3ac with SMTP id af79cd13be357-92e7821eb62mr164745685a.20.1782904780957;
        Wed, 01 Jul 2026 04:19:40 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:92e:7733:e3ac with SMTP id af79cd13be357-92e7821eb62mr164740785a.20.1782904780475;
        Wed, 01 Jul 2026 04:19:40 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4fef11sm63536955e9.15.2026.07.01.04.19.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:19:39 -0700 (PDT)
Message-ID: <d9cc44b0-4153-4b52-b5e7-1f1ea1cde8d9@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:19:37 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: rockchip: grf: Narrow allowed reboot
 modes
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260701105849.197086-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260701105849.197086-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260701111041.A75C71F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260701111041.A75C71F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ouBQB_8zUNuyB4YB_Y5XApbJSiVWBR7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfXyMFgtjz6lLPS
 5bMq5AgLSAFbtRu3+kZuTDFVru9ci548k6Q5x+APkz15AcqPbk6V9Wxbvxl+i1IwIyPRrF/T/Xj
 4r/JAm9wLOpg+zAvXu8syJzpT3oqvX9375P4jJFvCP/MoykhOqMLu7N6KdPfqRw4p2Jns8kXJbE
 iMYdB0qgD9FiopDbu2mjTYngJus+ScyVkO07TmC7LqmfX8rsQC6tax3Cku7l7UFu7dBbexYiY6x
 gLKGVKejErVcayEmd6oriMQb7H6acdcthrD9IXpLx6fRe186uZKsHt1yHRNfuy1HDJ7tKoIDyHD
 taD7ybXVlZNye8ui8BMD4pN0l5cSqPmidlDDqjuAmtwVflOVlRjVvQakxCslNGiKCBhTpba2V2T
 XQ/4q/qNzKzL1mmq52Z4eX7lCmwWDQKGJzCF+Wnf11cTa8V1jnVZ8HRHlEVqg3Haa95K8g02EpB
 ygOmWU+1Je8rMQLxz4Q==
X-Proofpoint-ORIG-GUID: ouBQB_8zUNuyB4YB_Y5XApbJSiVWBR7F
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44f7ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=kEk1r3HJiqRx88LYBtUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExOSBTYWx0ZWRfXxuIQFK19itYM
 INtDds1WZ9Rf0UTU2wgX5I+x6zvcrwHUSSICSvCz3ZcCzkHlF621Dc6PZnq1GU32YqhWwin1jJT
 ybVYaA05A6BXR6SrPPdjrylzsh9a+u8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010119

On 01/07/2026 13:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch introduces a new `patternProperties` constraint to tighten the `reboot-mode` schema, but places it inside a conditional `if` block that does not enumerate all relevant Rockchip platforms. Platforms such as `rockchip,rk3328-grf`, `rockchip,rk3562-pmu-grf`, `rockchip,rk3066-grf`, and `rockchip,rk3188-grf` use `reboot-mode` in their device trees but are missing from this `if` condition. As a result, they bypass the block entirely and evade the newly introduced constraint, making the schema tightening incomplete.
> --

False positive, additional restriction is placed in exact place which
allows reboot-mode.

Best regards,
Krzysztof
