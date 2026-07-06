Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E33D43149C
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354842; cv=none; b=HEGKmrxtyE/WV/YJgh8SwPBcBns/t4a5MNfoFLMuo3zPvjrwvqWl/KQFQhQdAwH+EPmu2bmzXV4YK7BoBECLWol0J6LD6944IkHT4yE8gWFYk2UbdrUuv701V3ew1d0RcLYMd5VR/b/k5AEGUdzHMC1CwrRjHzHVFxase5OJvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354842; c=relaxed/simple;
	bh=88wkV55+op7wraW1zb8kD42JmYHg90yDvFPVirI2ITM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INxW4csXf3umNMd1QnSMPo5e9ef6tznH2Iz7K2KlqnTri9U+DUjFhzthTvs+ZPyWDBzd+IkTEra0r83gOQkKnX1DDPMW8VbUDomtgVWyZbbXHPiCfOWsXxgVtN3+6WVw/ymDBoH0lGE/JrwAFDMwrv5gPtFITdBqthW1rcs/skE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jAvr+EqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQ0axLxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jAvr+EqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQ0axLxI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1Cl980532
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 16:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vj+tPjVgO4QFZGX8NX7hUas7HHKu8vOipIIcHrTeLHs=; b=jAvr+EqLq/MzzQlC
	pR3NpeLkDx2v1idnZHHZb0G2jqjoRZIkXxFfM3I6Eoi3zBeJLr90Aj98c2gLqmzt
	nqeUacUcDNx/INkPNqyA36hPD7K0wea5BmOaJogJCAIHXoM3O/8fFenFjvb4O3Oh
	sXE7JM1REmHKk7m3VJNvC3adROAwTlLCUUNmU+5nDGI6puesa9ZI3Iq0rEfD+GyW
	VDGHBeL9sYD5BZb5KoptrU5To8MXTEFjSJaAc+zZefHEdEgvo9XRizliKcfhbxOU
	sF28ezYUuM3faJPhS5ixKCEMnsvz2Zp81l3BNvKWI5BVbmjQiK5xiJchLChE52dt
	YAPSjQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgswu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 16:20:40 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5be0693d194so1304869e0c.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 09:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354839; x=1783959639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vj+tPjVgO4QFZGX8NX7hUas7HHKu8vOipIIcHrTeLHs=;
        b=LQ0axLxI47ZxBkADdJISBkeq0yPTrTbp3ST58zCYVGT6qgYywG6/0rvD1UNkSLcJrn
         hWEcbfKnC5V2GGHX36nugZuY0XnxOPzNryACsIKTOCwcdDrrE6j/aMlNfK1oNrkwaRSW
         gWSbQHNxH2PD0Fo7Yi7VQE74OHkieINYe+/IORgAZ1WDZqsbUNid+XNj4fCPhN2b0rpD
         929RNEVQoPpnGku6UOnbW9JyDIZK5299q04o0Kw3l9Wbj6LKy3SPKSxm6BOGqI9LlMAx
         UKkEGsvic8jYceM9K9z3SwXqJ0hRjTIL+Ih+KiMxMP907395zOySjT0V504xwVBG40h9
         cDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354839; x=1783959639;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vj+tPjVgO4QFZGX8NX7hUas7HHKu8vOipIIcHrTeLHs=;
        b=XfzrngiE4/wagCTBff4KiP8q39GCtlOjV8G4cn7ONaO/ozziqobU5tmyJTZKsMUnzb
         f8vhBwVw6WwIaVNxGU+RmMTkYiWtY8nGVQpRyw0Fsh8E4EQ4rxTd/77Onx9CUmIZpiX2
         FgaY53lCb6Hhbxtn3gxWrd2xUcyaaJ12Fd4cvJhpGfgWG14PW79uYUIE1c2xiVtjnFTy
         xoCz3+r/Oeqi2z3nUWzXt6/f3WkAybN9L9sLImf5wikVAgxZORiyka4z64jO4Tgpvr7e
         jltaHVQoU6OMsfts/l/zBbm9qq6kNiusPEhZ2WOyuuJewH911WaYbqcyzBdGXhnO241o
         qa+Q==
X-Gm-Message-State: AOJu0YyZd2yeRAe6Mgp8Qx58kN/xoLJWCCQJweJ6OsK8jRxK/HE1PUB7
	3CHqj2ESCT0TGZtFp0UDx8PuMnsi/BMrJV5q0RQP2yap/lhEHd30rQAy5UBk2nPaNCYGS5YaRlU
	8k/eFiqxnInBCfoV/B1tkQRzmLjXOeL8V3Ie9M167ck0/Hk1I0sRizZHpJC8UO2Eac+HUkmY5vu
	nvE/M=
X-Gm-Gg: AfdE7cm6SKdt/DqpzzXuyjtLwg6twHT/aWUuOAgvUQmFCVy50g4VEtVzdWwreyWIuDg
	Y5kDEfOKs9BT/+qhIiEAGQkuZWcgV/JQOgQlEZDVxmEgh/KHJx5aV//txPBkXTVjRDeyGQ9+cck
	73aeMPeX0k7pgPms8WP5J/StBmjBM84dimJw8QMKzTlyBDk95VPWaugluNLun6I+56v0Bl73c31
	B5ka2NCxOx2NwNVzXFiO9odwUTg5DU2ZhqoxcMG6pL/dXOGojh9rEJiu1JNp9IatDD9PCFLUBAs
	VFqd1lY2vUwYAxivl/cOEaaGp6jyWAzFM9QUQQOsxt6ITkHzTydrEMz9KF28cFiZNjk75W2vzAF
	nVsfkNPJWVOgEi6R6vBurOMpQooflzEfXUOGK15fi
X-Received: by 2002:a05:6122:1d48:b0:59c:b1f7:4df3 with SMTP id 71dfb90a1353d-5be908e9636mr775206e0c.12.1783354839568;
        Mon, 06 Jul 2026 09:20:39 -0700 (PDT)
X-Received: by 2002:a05:6122:1d48:b0:59c:b1f7:4df3 with SMTP id 71dfb90a1353d-5be908e9636mr775199e0c.12.1783354839155;
        Mon, 06 Jul 2026 09:20:39 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm26100765f8f.15.2026.07.06.09.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 09:20:37 -0700 (PDT)
Message-ID: <e8ea458e-1955-4086-ab1b-9599caf7368c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 18:20:36 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] dtc: dt-check-style: Handle properly DTC-style
 includes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
 <20260706-dts-style-checker-v3-6-03ffacff9226@oss.qualcomm.com>
 <20260706161325.B76211F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260706161325.B76211F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZZkvpsBH1xYzkyYYWUAeqG_5Oc8BmHni
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NiBTYWx0ZWRfX63CohXyk52K/
 MGcRPRpXwItHlxZ6jDz7QPDOv7VTt3kTmpPFbax2m34Ww6INqAivG7QAKFTXQ8xgnBVXAUHj6nV
 K7KPcTZIX9qEaqioEhoDGiUMFGGpsn8lh7XlhbkzYAcr8emxz4f2OyQXqARGlHfvYewDgzkXmrY
 KEkqlFbt7D1sbc33+6XfeSnHtwusu7tdLpGYLcQ1CvvMRPYk++0ulrdMaOjun0ghF+aX/PKFCge
 zzaDinJ9m2cFQTdYYWM48ylWc5waUqaVTxjvL7WgYTEPMy6G5Ma0MzYgmTmnl2VtOmco1E34ICp
 B0jD5AozQp56vuuJK1BW24vP9q5j7ZGefuDMAEtO9Op7r5NtuoZ7uZ5eQAgU6ur5An25nryl8xC
 NCGIoENQhUMTH1dZyw0aZ1ZbR+Es8LuIqBt+TWGmkpuUhXwLHTjQl+xJvzikRQLAexOL+5aLVIV
 rkCPazZDwOoqZqyoiBg==
X-Proofpoint-ORIG-GUID: ZZkvpsBH1xYzkyYYWUAeqG_5Oc8BmHni
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NiBTYWx0ZWRfX24Ta1a3cNhxy
 7VZGLi/aKodAGx3oI+/T2jIpx3i2Ua8MClcG7IpEL5iuox5DDZlKZsNzbBm/3aa8+S3YOv5VAIe
 WTGRBXmvOgFOPWQ5PBdaf4jL8dFFMsA=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4bd5d8 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=thh0EKpwSj0m2F0jE7sA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060166

On 06/07/2026 18:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The regular expression `re_dtc_directive` fails to match `/include/` directives that omit trailing whitespace before the quoted filename, leaving the original false-positive indent warnings unfixed for such cases.
> --
> 

Ack

Best regards,
Krzysztof
