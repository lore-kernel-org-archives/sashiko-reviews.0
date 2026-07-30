Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDD2221F39
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453984; cv=none; b=eyYXbRiNGQPmgoLcD3QKhxfp6VyR7n3I5AIfi0du5tqvJFEloucUYqotcYey++61upeV7UP8XMvw/zV810xTuW5sl33Uqj6W5wGi6jjer7rfvf82qrA6cRY5fV+GxTolT1np7r64v6Jwo4diOImyF1sy206/N/JQzTvPwjMP4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453984; c=relaxed/simple;
	bh=k6apMPixZlxcTl74lLpn5bFiVwuwYrQsZsfUSBIgEOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS/ha5PoDzkLdLkFI1xk/jtIS0r61kJSAfVUWRIDP0Ces1ib4dwZMkvJDROfUyHIyjeOrbJj4JbJUwxwzWte9DHEVDddK2mCB2OyMqQDvyDFceODHR58qp/8BQA3sFoflAw//gUM3R5QKgttCX8uAs84nCMEXtF9iZe+9u1Jmb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UpsyGQ+4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hn3R6BrB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UpsyGQ+4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hn3R6BrB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqrhY2203022
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7zgfw5kw7a6w6J3MvZyT7fQ
	YOJ9kkcxGw1kAwrJMcs=; b=UpsyGQ+4W4isutLL7OQZdDFcRgq2UYJkThOjHWIR
	QxJ25NnPm/005CTCRfCY56DeIcb/99SD+4b6zU4o2u/ZVYrRYYJEKYcStIdssV1m
	1FY6JVnd2MWREKWtqaFakhOJqJPYX8FGSMIzc6+DZmVcmZW+Am1Faym0L/HLYck9
	+rmS8wstl110bF4gPRkrUMadqwHCkzz0lvqA0L3szbiDAylpY5HBk867Xy7XftET
	hsduqIV4pXvDpetIlWkeWIxixODJUxRg15e1hMR9QfgoGQEoE+r3OD/ef+53DwRe
	kHbsm+aEkmv9RfTdjgiKgpCyvvAf8raC1sgYM2EplC0caQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frdjgrj5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 23:26:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52827090cc5so2869111cf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 16:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785453980; x=1786058780; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7zgfw5kw7a6w6J3MvZyT7fQYOJ9kkcxGw1kAwrJMcs=;
        b=hn3R6BrBnd7ekjIWSsaRRsiz3uC2VnVm2GUnrz/OlY4B67DDOeshl5sQZoV08250ua
         nUsA2VApO4gZLzRkoTnHzQfJjk/AlsSkmSxirh6KeeyR3FM9X0ohUSW3GU1bF9sLhVcR
         FONbuFmwfd8TtQyWEw56wnVukFHB+5v/dWjitPvhhRYTWJ1bIGHIkKu2wqIYIdpzCuyu
         vG2qL6XUYMh/nP3AYrPyY3xWfqqEPMHf3G5BtMV6UtrpJr8q1ykhU5N9/XfPb5miP7hr
         ESSIqGcWm5CA1V6aTU6Pr5ankjzmslybw8RZKfF5kUVNZscQjXE4h03uNuv/cxsMn0tZ
         zRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453980; x=1786058780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7zgfw5kw7a6w6J3MvZyT7fQYOJ9kkcxGw1kAwrJMcs=;
        b=AhTFTVuDJlaVKVOX0/l4S/IS8gxMomWOPkW14sq9xfFL1wVkPHBW+nnbKycETBauBf
         lKgkXYNf2QQuUktn9fy6ACpYp1cjLL+JXXIF7rBG8BMP2OxG/ci1qwcjc6pZ4BAOCTjq
         8GTjE50HBrfcPbR0UGF9drGZUNBLBkkjZY7mPPQTkejI7zAUY1g1AiYw+5z/oOyLUR6O
         HkM/7gRM0NoNr0NLBpLV++McQMveJDZ24jaTHPcu+oilP2pB9owexzYMCCPU5fXUKoa6
         ADNUwMbuBypD2UzqAWKvoBcmY/EN2X6BG5W4cU8wXU0Luu5yxZUAbAVF9OPlEv5VSWzj
         F2lA==
X-Gm-Message-State: AOJu0Ywsf9WxxgblypZpUYIRphOGNRG9aZgW+o6Cc3eZgxgS23gMyhwu
	vsphPZ/HLqbyAEpfe6NOV3nuvkim3dpduo48kqbg1GUU8vdNz1QJFFChOJpiB3Fv7eH+Su7D4n9
	80htui2cFDmbDDFpHF389ngQMKD6Mc4PnzQHCDVRbvsGmwEw1zDLWd8YkdEYt3lFPfyNJjpYo4u
	pqMzY=
X-Gm-Gg: AR+sD11mDKGokMr0QUB6Ze0yZUBkTMNAnn64GvPGYHN8j/9vWdVq2rPEMHSChIkGTlz
	aFdwL0reGUWGtLDaK9xRqIDX5MHn18uu3+PcePstljR5rprIsXqoVUs7bIZjhE0+poqKK3AXc8f
	bEGBDiqyXPH1Sg+2eHcQ5JMmD/E9UBL+Di+odKYD3h0svy1m1LoRXz94Z40NOz04F67cQPFsxXA
	NPan/8dcjOho4M+4vNBE3sOnzAYTgczS0Z5rhBaVST1cBiVkEqepqFUveixfSscOdedgZIwR00n
	R7p8YM9ebHeklGXT+ckHchRk7NoiUM6FZfTCi9fFAQn+iyFADINJv1lpuJxKydWYxEZOEIIC8Ap
	jK4oarXTAdm/x8vyyIgupVQH6UqtAqGW4GjxuzT6ZkcOV7n64JKQDFo2muXxvvycnWOS2RvfHXS
	Ed6w9zmfBN9W02Rw==
X-Received: by 2002:a05:622a:15d2:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52b424e01b0mr25975961cf.13.1785453979693;
        Thu, 30 Jul 2026 16:26:19 -0700 (PDT)
X-Received: by 2002:a05:622a:15d2:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52b424e01b0mr25975731cf.13.1785453979186;
        Thu, 30 Jul 2026 16:26:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ee670sm606530e87.74.2026.07.30.16.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:26:16 -0700 (PDT)
Date: Fri, 31 Jul 2026 02:26:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        media-ci@linuxtv.org
Subject: Re: [PATCH v8 08/18] media: iris: Add platform data field for
 watchdog interrupt mask
Message-ID: <oqcjmsukorvnorsejp7s5njddzocksqh77j77ydv3p4t2emtyi@rerl6mx7kvcu>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-8-6597c08cea6f@oss.qualcomm.com>
 <20260730153230.9BEDF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730153230.9BEDF1F000E9@smtp.kernel.org>
X-Proofpoint-GUID: wEzMJ1MlGxfRT5DN1sS9Pmj3Cw_ayuhU
X-Proofpoint-ORIG-GUID: wEzMJ1MlGxfRT5DN1sS9Pmj3Cw_ayuhU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfX5FiF8MgsmYfA
 y+AFPl5cbyBroMeyOYebROqiWicDgvM5btXS2WXomXsC5A+jj7JkACm+al82IxwpFnL3/g9g9V+
 cEGsTw4nHJy+NGU2olVnWmTsW5+jK6Q=
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a6bdd9c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=fCJy3Uypc3c1zbPoOmkA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2NiBTYWx0ZWRfXw2MZ06LQzgeM
 q2K+fWZSFfyl9lW9yZ9LwtNuGsomI2CKQi8X2G9is1PjwSNAmdMG49ID4wrmzY05AFZtyv9BEJ7
 CFRTcvU3J9pnIP8AvEvyXV1169+XFQWbQcGkGvC2ox6nB7z5LiU/Ff0iOutNqNhLqy5Vbbf9m14
 f4Z9fi4FLciBorgSa0Q2FH538sRiAYPKNKWEHP+QDmAFU9K548+zoT+MGfL0G7KGvaefHsl+OV6
 5xrqGsNlZEg3kfAtAafgKtlpAX2jtxyylALtxF2ko+rZgSMZbjBWN6skLQClpACyBUYfYqmdxms
 J1zPHnra2JOBWnhwsuAXlLKUap299hpcTjnQvNKZXV0eZVRw2vBnERRc4OdG+VrwxQDYkGVpo3H
 wuUUSiEtVKn/DkMEwfx92AKOqbT9ez8TI/8DKwalXVy3yq54qp6c0dU29dQcBmI/mAEBDfo+Yxj
 SiwCHhj5xfJKRI2Nf2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300166

On Thu, Jul 30, 2026 at 03:32:30PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete refactoring of watchdog interrupt bitmask. The new `wd_intr_mask` field is used for clearing and handling interrupts, but the hardware unmasking in `iris_vpu_interrupt_init()` still uses the hardcoded `WRAPPER_INTR_MASK_A2HWD_BMSK` (`BIT(3)`).

This is expected and fine. AR50LT will override the interrupt_init
callback.

-- 
With best wishes
Dmitry
