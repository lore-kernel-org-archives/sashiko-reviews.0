Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C963D5661
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738443; cv=none; b=bHNYsYSpVMfZXZ6fCmhuczRbsqvdTy4wyYLaicTjJV95++1a3NLEAr+8bZ5ICTEUh0p9AicY6uQGRVt90Ktr9T3hnzNuObfnM7ox9UH0nL2aPV8Cqj1zShKp4/DC+uBJhisoC84bPmGyw4j828rNenDUbb8qt4n7kaSup0hYRmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738443; c=relaxed/simple;
	bh=2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKXlT50xqBMRbzwKjRzlGVXrV+fXRkhLL+aIQGCud5AZydn8tYMZwZuOIIV1nyEsHgsK/WSuFxV8GpH8ySrq5j8+V7hASoAbMar8UZ0seGK2og3IxMwPOs2w7n8KldBAsiRbK8QWtKSaIfO99EOKOuTjvS82iC47STNvAhgYCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efRCbKGR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/klQoLp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efRCbKGR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/klQoLp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CIbK1510586
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=; b=efRCbKGRAGKH736B
	0xt6t+7AVMFogL1nq7xV9gW/MdN24i1hlHokj0OzCf59Djjsah11YL7G9vsKHPtq
	WBP81czebBWDhqfBr3AJhO0LNUTFvs56pxpr1BG/jt5U+xPWoXxJAPxAkoyFiq4R
	MEJ8roPSkzSuI18v/1rDxDOUpovU8fb000KX7nagLimQmSm8C/HbkEDdBIMYnjp9
	+UVkYQB4NbQW+juu5p6mSlQ27fGIoF/9jcS+bTl8Xr0rEAAq38Dpyh3+iVxtYy1Q
	ajsvegJxJLwA/1sB1ivdKnMNywFSXDliwpW/Hp7uPtdZE0/SXeiwygUHPxAonCYQ
	dAPLFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uq1rna7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 10:00:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso22898641cf.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 03:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738440; x=1788343240; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=;
        b=e/klQoLpsYn+TrZZfjh9gH2MgbxoYKoKl3/v7R+dhOHtQ7dKvPpI1EJ1yeFJTJlWDg
         1Jpct6vHhHBL8kti6Il+Zcg2SRZjIC/0g+vKQy/4pxnuNh4CtBMxYn4SY66ddRoypaQv
         PYzpwQYjN/mk73YBmIZhvMMqg4igz51QpOl5kENquzXqnYdp0tV5YurZCvZzZ0JspqpI
         D9PdtKXoBe4xSdZPoCZ8RYHTOqY49SBaGl4sLw1GhNVkqujG3fMuLmdC6GV0MYb9GJwF
         uSu+RPeF9ZTfy9cd/okt5dFj3ks2HEh9VxDoStAJENxsuVu9SxdqfXJvRE3HZtDa8bMn
         kd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738440; x=1788343240;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tIay9utLpnlcwtUgSKhbgoQuNFe+ipOGrnK5lR27AA=;
        b=fZdUyYjltYoOEtTLoxjv20mfbPY9EoLn0UgF2MnjWP/NDZyGKpLKYbKBEXoSulu193
         zINawZOXTGjFMROozqD+yRBYw1Sz1hQUjC1J+y5RAE0D3kA2QDvg3kC5z3DW9ENvu9Nu
         0nJS9QHyFgCSTJhJOhtu6u4tRWAbcKRWLlo3eVfIS3SMIt2ao24AvOvgttEwgXVHgZH8
         BzruDkuj/ke0ExBvnrGdllmuERvqatcaRJPMHPZOdh6tZ7uQlvQnZ1Yv1BuOQWgP10oP
         sCxxEAgmRTmVOoomR4yyOTphuo3C8YdpylJGtC9e6i/AIsqfbGFpufmJtn4brCk2prRs
         Mlvw==
X-Gm-Message-State: AFuF++kGgFL397rfuivoe9PGAXbZlHKh/tw91EduI5YcMlUs9KgQXqR7
	qhliQCg2J69XTXE5QAFfok/XMkv1Tjgq8oqGt/X90KUzJHOnQU8156pnOpPLgjmVa9Na8W7Dgmm
	U+AXwKV7/kYarbBvMdH2BzWWEzO1nd2sizplbO6/sBt6LNfrHoy7zGIAlxPblGu6gFUYbVpjFC1
	rhubA=
X-Gm-Gg: AR+sD11Kyln+p0DOnuHGwkWtKzV/jqUci4K+5ASMSkM77Fg6zoT63QKBipYDyibYYhB
	v2QLlGNyHSOmkowtV0XyzXijQxgh5Oxbj6LPfli8rTT2fWWsR+anrs/MM/HcWxGrfbl0zQHDtIJ
	R1T55G5NsjRGaQzL/MbOVkcbct7EXMb+Kc3co0rL35uqNLhEvE/b1Y9sjaIhdBbrmVKAEqYPQ2P
	cDjWPcP3tW/2AD/Mk1aYWaGmzqd/Iswx0y30YmMbiB+IGF7j/eF7ptKJJ8dmoHOybb4qjvC2w9M
	6SbDiLnXeHWN1G1DfjY3WyyJfpPmT+U7au0lKsKqZ++rN/F979UBHJXn3RNJ2oYFGKGqz9+a7eA
	XGxWWpmXMmlhoWakVWEn+n+UkFQ2X
X-Received: by 2002:a05:622a:490:b0:517:63df:91a5 with SMTP id d75a77b69052e-52e2ed34ebcmr132647421cf.19.1787738439888;
        Wed, 26 Aug 2026 03:00:39 -0700 (PDT)
X-Received: by 2002:a05:622a:490:b0:517:63df:91a5 with SMTP id d75a77b69052e-52e2ed34ebcmr132635921cf.19.1787738433413;
        Wed, 26 Aug 2026 03:00:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab1f3sm2254758f8f.11.2026.08.26.03.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:00:32 -0700 (PDT)
Message-ID: <11b5ad91-84a9-4506-ae1b-73a64b49d08c@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:00:30 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] dtc: dt-check-style: Fix alignment of values in
 continued property lines
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v4-3-022e60091965@oss.qualcomm.com>
 <20260826071345.A3C2E1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826071345.A3C2E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Rc5WSzGkCvnb9kIfgBATxj-8ELaON9sv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfX5pWbHENjy4qq
 qVKYAZFivp/va/a/ZYUkgaEKebEzNJxg50tfF4XuRCfVPeMpAAuAePqrHc5oU36NwpOaFIWJnrd
 cikT8zBlPZL+loy7pOvq2tNQfDuBKDHRPt9XKIN+vsOY+zXuf8jtj2oAkdo6lN0v3oDGyUH066h
 KXxKjiEGAwQ4MxRyq5QgDWimje8eKPQpKrntkQ9eq83KKuhn7A4v1Nk763oQLVkVE2w1n9PlBZ1
 4fH6Ych+A35tjgzor8a2ZCUUXvbWXNLaAOIH00v0wTeFYsGtSP6YztlAlbncRsWn1sv00bAaYp9
 R8fYlirV/2WpLGi/TzdXt6AldsqEXcRo1HthpKpImEiENGQyWvUfyLfreyThq89d7hCSjFbEBlE
 ywPe3VjHo5hm8EQxxH9RapPfm81zbutOHzu8NfSg3xN538pkVPXzvLK9ErMLTpaW/Ob7M5JH//4
 CX7XxhGyK06oawngpZw==
X-Authority-Analysis: v=2.4 cv=Y77IdBeN c=1 sm=1 tr=0 ts=6a8eb949 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=PCuQmCvmEBbr5SZVerEA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Rc5WSzGkCvnb9kIfgBATxj-8ELaON9sv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MiBTYWx0ZWRfX3mAm+Qqw5O3c
 vSwx3UE1aFY6mFn2CW5aJD97FmDeAnTTY8M6pVrg8GiqWfYVfQjFdOzgxCvnQ9aRhU5gxCdA1/A
 EmHpnty7JsrYUJfjII6dG19U1RKYoz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260082

On 26/08/2026 09:13, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Trailing whitespace or comments break multi-line property alignment validation.

Ack

Best regards,
Krzysztof
