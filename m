Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1963B83EE
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081544; cv=pass; b=Wuv7b35H8s55d+PkZnkTsk2z5olFqBZSEPmGj5S41zXWZTJjXmzHUnxBO+UGztJVZwQcCYzWK8hB7x1/gCFltRN0HnDRzQCbIkvANBkzYSl6Fvk4gELOsY2zjpTopYKeEUOXMM1F+Fi5/kQ7CVyuM0mwCQcW/4t566bUjITEjRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081544; c=relaxed/simple;
	bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q5V1bLjbZ1VQpi1SqDPSNlrg+zABZYOTmBx/YUh6kVKdXk+RJ7CWwdOPgjo2I41rvowoYeh6Rnl6DLvVfULiYau+Ap2JDXmKB895VD71MJkCjwu/Bw+976vVH59b1OqfKVSoE0bXRFLzCxNh2IP7eujLkmDnX5PTfsAOMKZfk94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KL2K6x9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkBuRogo; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KL2K6x9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkBuRogo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iQUA867054
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 08:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=; b=KL2K6x9aOJPTknps
	xPR9tz6DeBcKdJWBYO+U4UWcDapoAQRCx6MWwGVDZzGZW5pBZcf5BYOyw6GUMcmv
	3DS46ddwwWiWRSFEIHwfsqreNykCH4Dkj4vdzfDveDvx60JDhrx4RSC2Q1JsZBd9
	LRZA50k+0kJeoX+Svlee2Cd9U83zD6NcuZagD9TqgepoebxnT9D8f6JLziwQBgtv
	JdukJF4EpWQYxT2wLslj/vuhTTSSEAh+Dj8akglLet+wdzMxXOHkq4QTT6gI1W3T
	YD3k9nGMi9kZ+26I2f/9ICjujZHjadgbjyxNgXMBW/VO5Zw70W4i5E9XxxScA6qG
	Ec3A+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd906s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 08:52:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cce1de2519so78474416d6.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 01:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781081541; cv=none;
        d=google.com; s=arc-20240605;
        b=LAdrdb0Un67ariFvxq1wW17LjG7ykC19ElR5C7HF7IeVGy+izRtWXyattOOeD0nkcA
         BJ1opFEPiQWNYkUuxHVGGgDz5uJHY1c6cT2PPdY6OBDjSkfxQYwZushQ5audX0eN7tll
         0rs26+Vx6k15T4h3Lum+1T8+EKY6t/7kao6K5ATCIERfv89p4Rnrhb/OWntC6ZS1LN4h
         aBVsH03yyLBCr2vwMb64R0mWNfIireHNBuJJN5ZhXnqYTts0bw1CEec3h/BZjmPar99G
         3ZA/wPFYdKk9oMb86A4/0MUCMvaXVbwXQ2N+hQ3zNMWVWn9tMhXfzHQEH3H16CFbrzik
         7Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        fh=N9Z87eG/HzL8ti0cgBStMTEqiW810YfndzyMugtMrHs=;
        b=GXflnOhUfvgOFEJiqimF7NQM00SbmGdghk8eK5/yQz+wwwVRKA/7EIGEXBhkOBvwxw
         y+0/p/l0X3ZG2ssgY7+MSM9oCfgs/YT5E9xXROXT97f9Y1U+e5+owPyuBqTPpUm7vFMI
         /mLBrCnAOPC0QQEcJVV2kQ8GsPdyLtUUZakkxpmGaNGYrLdvoVpurXQbVFHGkupnDfyo
         gvz9wylI1XPYfm8rPqQ0t50LrdNPXfGhWMcdwiKZYeQBx1ju1gJRn2jNTWSR/yJxiGPj
         nWeDmW7r42KBSKDLViTsS3ciEWXJF0KKRwK2nf3BAharPcA2lRftizeCsk0l6AhVduYa
         48cQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081541; x=1781686341; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        b=NkBuRogo7KHZumFU6QJmzRPrpv0pXvix5+EY+LN44hYQJFMebubM9+wwkduWBv8eWu
         1txnCzshznxFFFJnWDXizXwmEWxwqS2E5C7vV3t/bMgCPqL26rwqtSHCQzOqzTdo6VJI
         Pht7kFI7aoZzX1SOiB649yBcMkrS+T4lGo2xfNjt3teLL2NYBwiVy4hhRNuXvkddSZMu
         BNwgRJ47RBRT/YC0qXm9EvfdR8eHVMKn8Wka6b1iiWfaaCikGHkgUdNqvG/gNTiE1sHy
         nZ3wiL/H8sbvCHMpNts9ePPjsC6F9Z0nCrGJVYVoEBeDY+KD7MXdMs/9ljx/VoBl6LlY
         dGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081541; x=1781686341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=odqsSAUAQtXxk3E4rfFx1F7PpYVMO4kpm8sTZf4tAsM=;
        b=iYsvXbumB3NScV0dQ2s589DxLE4WQow2Zbj2fJ8P7zr78NDGKJN9GdjESoE1hARcpb
         RkjA95n75EO8jQqFhYPAUjoXgp8NE3nflQpWimzCD/v1hRAIR4LclsM6JthKNdj923g6
         xFxkEslkZn/Dtpv5VGjy+rS0eE+TxGci7XPwKeOCfuBt8tvsFeUPDpPOsjG6exmdO2dV
         2u+JekqLF0gVg7AgqGcSa50TokvoKM3C3g8a86AAhPpRaz9a0qFArqAV3JGHeNdjTMj5
         Qw3IMOOTBx9EvgTb2Jrm2MtNBSQfRu3Nz63N//NtZjRHPAlqhe729SbFliTvC55px383
         Pcjw==
X-Gm-Message-State: AOJu0Yyax/vcbmI4KoHweuev/LkqHyj5YbNMaJzZAVtap9c9PEqYsbI7
	MtPVUy6mVEB+AtCQuH4JcDIfvE180gl9OV5we4D+NavEpZwLeqSmrh61rcrC3EjrAt8tUzYbYfH
	siYwDc4c18F5nIXh5xc7RjbCyaVth87+1K1GBApABL9QVNH/lnx2Eq8SQD4ld8P0cT+oCzvULDW
	XbPsf+MRJGy8asUERso9kkp/zNCwvvKhMaZ8GRBYVSi9BmhzU9tOFJezXd
X-Gm-Gg: Acq92OFeIdxwpBWmT6aLT1fkVKsG+1/mPPQeUf962QvMz3qxTaw60E2Z10AlRje+O2m
	c0F3j3NsHmMoYeApTnJCwwJ/h+PdbljsbZx09K9Cvev5xEP6LoeZ/Xids6/Eqzycbw5dlmV9RR2
	R+e7ii14h8RTUsdchIbWGye/zCBzTcig0DBDgrmSYdPjTkRx7uTKM4uF/drq2y0xN1P+Q0h4zMq
	gqY8fsTacTb2fBz3k45yfFyTNWEnemMoOGjCI42eJorblHmKPSXgh6ar//FPFIdx0UJXjO1mfLi
	MLU2Mf9Rx8aCuvit0PvqkcGpgH7kEKVz
X-Received: by 2002:a05:620a:4802:b0:90c:e5b5:65f4 with SMTP id af79cd13be357-915a9c35164mr4069133785a.2.1781081541446;
        Wed, 10 Jun 2026 01:52:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:90c:e5b5:65f4 with SMTP id
 af79cd13be357-915a9c35164mr4069131085a.2.1781081541056; Wed, 10 Jun 2026
 01:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com> <20260610083743.426C61F00893@smtp.kernel.org>
In-Reply-To: <20260610083743.426C61F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:52:09 +0200
X-Gm-Features: AVVi8CdDGiDMvfVhFz8byRRYQf-ubwBArYML935S-TUUtDcg5909zHFU_AmRQ2g
Message-ID: <CAFEp6-0vRdcc_MekUZy5zASXZQHNzYZC=UCVj2yYRzno1qE6ng@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a2925c6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=e5IIi1m1Uc3Dfl-nZHcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: BrjfCy1O1dO-Mw4v0OCRy8NcRd-qiahj
X-Proofpoint-ORIG-GUID: BrjfCy1O1dO-Mw4v0OCRy8NcRd-qiahj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXwoj5tqMjAbqS
 VoWTvj4vXYIJgybkvpuu5++vFCjcdZqNAWppmg0nPZW/4+EGCzFAl6PBGbyX2jHfrpHUrgjfNcV
 4/VCDuMxPLmI4X6poB40aawJyzoTXpUpTYTVpZIbKKhEdS/KXqYwQsn5fnriOKN0OgFz3RZ96OQ
 Qe2iCDHopLP5QmSWTldtm/vZEZY+8QhYJyWjZxpN0RuMUKocl4AJFGTuQ8L9IZEUhVtS6Wm6Rwn
 7GhC1wvmMHpYaLHnxER76WSXM+muGzsx2ubSA1zQmrqdNZq+DXs3h66/dncL1I+FJeGKXr8vh69
 S/ScRJE8+z//pXkbQ1br89rp/PEBpbpfAbIJAl0h9tb+UL4uirmO8SvJlmjguqH/++uXj3bS5kT
 cIZrZi964ToyaUvqlvrxwa23HyTAC4FMK+/zH5fOcanfXNzvmDGkr67WMgux6bkiU2hGUyN2Xp5
 Du8wbc+NcMACvumR8rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083

On Wed, Jun 10, 2026 at 10:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The commit message incorrectly states the shunt resistor is '2Moh=
m' (2 Mega-ohms) instead of '2mOhm' (2 milli-ohms). The device tree propert=
y `shunt-resistor =3D <2000>;` correctly sets the value to 2000 micro-ohms =
(2 milli-ohms), meaning this is a commit message typo.
> --
>
> commit e207629f293c0c8e295115a6f01dea08156bf3e5
> Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor
>
> This commit adds a TI INA232 power sensor to the Arduino Monza board's
> device tree. It configures the sensor on I2C12 to measure the board suppl=
y
> current using a shunt resistor.
>
> > The Arduino Monza board has a TI INA232 current/power monitor connected
> > on I2C12 at address 0x40. It is used to measure the board supply curren=
t
> > through a 2Mohm shunt resistor.
>
> [Severity: Low]
> This isn't a bug, but there is a typo in the commit message. The text sta=
tes
> 2Mohm (Mega-ohm), but the device tree property shunt-resistor =3D <2000>
> configures the hardware for 2000 micro-ohms, which is 2mOhm (milli-ohm).

It's indeed a 2milliohm (mOhm) resistor.
