Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE85474263
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934412; cv=none; b=MCk6IdC9ANEPyoAkY1sF1ro1mmDnNWdB4KGDzGE0hler56sPfpczNAVk028Q6qe60R9cMNOtx/Omqgpyala4KxojlguC7JIalXzD60Q+WVxpkaA0R6u9I0u53IIOfxcQvLmtYpErD8fM+MS4DH4I9j/ymrZIhB8CRPczBbEhMFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934412; c=relaxed/simple;
	bh=Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=koMT6azoJaVQMvrL1fY2FtyAj9BwNDwSloop/0n0wva0Ig/jKGJldiuu+ZZxHrHOwEYIOxs8GIACUjqWuWUvZG3C7Z7r3+HNx+3869nA1hSZuZ/lgr+5k6u8nZYJe3mQa3OVqkOrHt2nEX0rAValhaPkoY9KJ0ECKvmhkiZfSyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TJxH3DW5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFZfSHaA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TJxH3DW5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFZfSHaA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jGtx438100
	for <sashiko-reviews@lists.linux.dev>; Fri, 2 Oct 2026 09:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=; b=TJxH3DW5VQvQGWRb
	aN8zeETZHirij+rlmEUYFDVOJVhV9JWOA9CQUgQLcR33ujzbzy8JFf6XEoeT/7Sz
	vEgCOJYygixoBYOjozJOi9yxHJgEnvOw7CqpOD2lQNQ0uPxcOYUBPRWoJhI4TDH8
	BAMb9OoFrqFmGaF2SAnyqaFvmDoOyvRuV9emx0GgYQRbmNMkOiKGW+smY69pY6Lp
	2zVq73ZrYW2SYsuysj3eBTU0XCp0yUGCGJjy06l4ZAnq0el8F8oT/sOBjJiTUhQl
	u4s2StU0px3WJwIrHhRQ8jEVMMPoyAJIrWPmaLyTpe4fzwm9iTjmXRgijzQ/jtJA
	mC2+JA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdckwh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 09:46:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so66821785a.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 02:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934407; x=1791539207; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=;
        b=AFZfSHaA5iHYCO2KjNnoYapKlr43piphmPc7MaQQBDpSbDvtZnBepqiif3FZw0Ysio
         UaDLMMWXxgA0GLMch2MKsAh95s2P4LjovP8M71Q8kEdnX0faWuame5gTjSa7GQEj6paC
         UcvBeU9qJQZiUObgD7h3qNI3jLs3nfHIPMRaGV8ACKbIJfJxtmTdtA/rJeRH3EMDAuQd
         hzNjW+EzPoAGx56bWDbwHCzrCo0KxiuiAeeQZf8NgrlunmIYeAgY3yVpr7PG/JQW8PzV
         YLI4VNXUMp9BeqhdxlGftOK7WblCezqXEQsqdiU3XatBSb2iOm5+QAS11OSwCQIlcKAz
         5Kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934407; x=1791539207;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gj3cqGullkeJ2DNOKA2/zS6GvsFWUu6ypAavOmgOVcE=;
        b=Z3tql7GEddIZLv9gwKIIWolPVFB20phOgU2tglNAMX25G2Ji9sOGKZCYI+xXJ5RU/j
         d17+m5atR9aldKuSXDpzh77Gv+fW/xdroiXv9kYDVgt65yo1+jN9VUxOwVeY6PhtQHOd
         z6Ubxz8cfCnzT5QeX/2OvgvfCSM7i0fYAgZPxyk5crRjUd1uLFoh9EHvP4gcsL1CdZdw
         0qmTq5Y3v4Nf37cDMxROOqDJgoXJRb7aKWDhQWlohoSdZ2W2qVEhgYCJupxPgOAw8l6Q
         oMbc49u/rHfa6OewveC+dO82my8e+LuLXHU3U4dR2HpsakrhhzrGZsyVyECkhJ/A6K06
         BToQ==
X-Gm-Message-State: AFuF++n6EXpB+akcWbT0pOiz693MZiuSvD9Fbj3NNtc9olHJZpiI0HSj
	cw+B1M/9nfKzKCCiN62jT145Qa8DTjtYs4WAw7fCwSUMUyaMYnd7JxFoapR8mJpEcajuSf0EK9K
	vOGpyJVmTCZGLwiXZc9kcaB4IBjAwCPWS0FHu9j3Ots4FCFszht2kaNitiq/LGiN+4r62WkXhzO
	qy+hU=
X-Gm-Gg: AYBFou0nGqTAqEY4zMvKKzOFLZYZPGUhftz7F0lSiQORk/u9zAC17BuaJ6GaRwafz+5
	Ngdukhb0EpQkmVcLgATMjm/njhl6VPbxeqT8lRMGK8RWNvLpKYbVBILR+vpO8NGSj0r2T5QG0CA
	DJ2wGEqJFtHW3uBYHar0MUHjN/4Y7VV0pCbx8lwkep5+kKp/7nevJ1l8yofeTj6ZnypZWpT4Egw
	vv/yIUFRmjS5CSh4UUTY+dXmg0S0Xkj7Lnpa9/6JvoSyMRWD6XWPzk4l+jxbYCalLyfqKeXV571
	9eDuCxzm6KwISIILaA8tm2SJgUR7AnsUI7K0Bd10KmWmhvcO4Fk+zZc05gwtfv390cMvkiePfS6
	423Z27ivP4KOzjEQQZ0Zw0GM9mpWL
X-Received: by 2002:a05:620a:72c6:10b0:939:d762:e2d8 with SMTP id af79cd13be357-93cf172fb13mr251662585a.31.1790934407355;
        Fri, 02 Oct 2026 02:46:47 -0700 (PDT)
X-Received: by 2002:a05:620a:72c6:10b0:939:d762:e2d8 with SMTP id af79cd13be357-93cf172fb13mr251660785a.31.1790934406884;
        Fri, 02 Oct 2026 02:46:46 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm73241225e9.0.2026.10.02.02.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:46:46 -0700 (PDT)
Message-ID: <92d1b735-00e9-4c3e-bd40-6684e0e4eb93@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:46:44 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and
 mboxes constraints
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20261002091432.8FF8C1F00899@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261002091432.8FF8C1F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vo07maH2apVZq9oz6r3k1BB7U6wlhcHM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX2HUA4oTIEw0R
 TEezic6TUvkVDbf9q/lVUurvETbwMokSCAXKDFKyJRCNvpI7ugflpEENjoSHp0m2uCupq5IYktT
 iampdhGls/lU/e2NI+WX9mRvjHkUkAg=
X-Proofpoint-GUID: vo07maH2apVZq9oz6r3k1BB7U6wlhcHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOCBTYWx0ZWRfX2wS3NFjxwt3U
 Nwo9iXv51EAOXiat+SVpj6pklOxFKMIqDMYLxosku3uSjlqYDUlq43o0zpiiaJw8DtZqlBQrZxo
 HSLnlSHU0VJPW7HJcDY92FiXEFElrJr7VX7n6JIHoce59/ir33fqv7YR/g74VyY6G+Sy2MI0rxL
 sMK9IAZwoKuD4LldNte97gqjOq3fzxuktWsV8ZZrdNEFxWWowtYyEKzY9Yp5o8yUh1FR+iW52Da
 +XGWk6Z62KOcZkxJYLrtPBJBd85yExraiS2v0w94OeuZHB9NZ/yykkdhrYEPxGWsfs6G7XTFm2j
 W5lzYXySqEhmwE54NRCgWPTlPKuqx2EgUfjvbIHx0KK33hekzva1q/EsjiQyKlDwQmXR7CzmgfM
 wwmYiJBMVKT/nXIs0rO02Sc+U7l3l99JIxedIAzgP8uUkeO3PLdBqggx8JhFfSTI7sS3rapFpQp
 953IQy5W0qw4AFkXrMA==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abf7d88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610020038

On 02/10/2026 11:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: missing minItems allows incomplete mboxes array

Complete bollocks.

Best regards,
Krzysztof
