Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F140E8D7
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386064; cv=pass; b=rBHJxUyQIMR1AbeBiOnga6y0T9z0JCTJwY4TYSiZJvZUZ/LwqKr1Ywp6MU1EA4w5bxrWwMxFNkDZUx+1GqgGpSQO+vJGeeANAaA1MRX417a9yrkZ/0PWdKmrgYfP1tShkeRhat8flilLmV+G/4xoXQyhc0DRH9VedKDb7IJe8M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386064; c=relaxed/simple;
	bh=ACSYctTuKq0edv1YTfqzWElZtHfVIISbGm+LO+Emokc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HkVj/gtNqdV4wvDl+De14CZPwJ8XQZJsvuvfV7Fi6+HxknVB3lNB2c7fPTN9/zLO3z0nGftSIIUgYniV3FXUTjxZZ+ud+WRqqwdy+qIUZNK50YOhxL4gPnxnD+CnNcTM6cag9sha9gRjyYpvbpCltrVoJrAtQbllJmgDlYxtpDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XV9JI6F1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzy6ZyLW; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XV9JI6F1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzy6ZyLW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtVm43646965
	for <sashiko-reviews@lists.linux.dev>; Wed, 7 Oct 2026 15:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=; b=XV
	9JI6F1aO7kD2JUhvL3KHAXP4DYBoiUBuHa/z27oUbz547pz2h7vCMFuZBi/a8aI3
	QkB/k9Of4H/KihDr3p3kDhNxnvVRB3FGfDDdXcy4oGG7m68MoNNjJEkyno2+k8AQ
	E1VGxspJyKAmuYJvn9ULFXWlFfpuT0ILQwL62OIgYSGYGpJxOkMWw3lGYik/M642
	6xFobhZsR+6MZGxvNz5ExyIR22mg0N0cnSVItzD7LlxX/QGPHeS8NfalxpIovXLy
	Z+yr0wpXs4rOQZmB25gS3QGAVJkUo9Vt9b1NHkhmnJS1WNn2w7/EW0CZkBIeNfqy
	obFi5OxyWtOuC3z2tRUQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s2sbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 15:14:20 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6e084b2f5b6so3278399eaf.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 08:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791386059; cv=none;
        d=google.com; s=arc-20260327;
        b=lqtscd5yrX7jV5E7Pt/73zkqt3KVa6mi5oRWh8gP7CJwmuqyjTwpzDig9p35a5Iels
         kZNrjf8gRweIRNryiDH0cSdbufCH5G3WxDZTcEBcWqMW0O/XCVUPdNfwpww9qt68+/21
         H7XgGFhot0hhA5n3kVKaLgyAxD3NbZxF1rMWEemqQZne+7fPGuWej/hKmxLDUO9nA3GO
         m0BOtTgyXomJxdKcLf2s7tYBWmjCXKYfHCSzWHMbUxyj1xeAzzApMPyQCRV0dRouaGnw
         rtxDbaQkA8izS4gPzwqNW3zY374rpBbrUaIxZgNIRdJjJn8TguODz3FeQO4eJIi4LFz/
         9GeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        fh=UK2y+21//5URiNrnA0tm3tTV008Q6/xQaADiU/bio1w=;
        b=ptVypFpvn7YS3VBOMdhBC1940vIZIbc0uqtw3CmP5pYZqRtWBDGxTJ27VHRk8Kr2ar
         mRrQNPAzkW7rgGwYfmM3yb6/ARljlz84ADzvnljptBjXEE+XOLgE/uroHrjdKzexHvVb
         uO3eHElde/kWMFlB+1JiPTV8U+TmXv3joqdhM8XwtE045JLkt6f8qs3dpXiO4sXSeKd5
         4Jde/rEH441KAaRddSlLA/hQ+9g29sownXXFQSeucwubdZllBPSXMx+BRAlwZuwLo6My
         Qwv+otzd1bhuumKvb9s0a4pfhwFvXN8A8Z5SP72qIn444fryYis7Tm6PWtZmH3Y/2n32
         oU8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791386059; x=1791990859; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        b=dzy6ZyLWbxpPT7ZiFWRdh1mSQ/dGiJrvbqBCeHLg1fsKTykR8yTI+jMgSYsMBQrHNE
         tglBKj/8NV1J1PQ7NbvmIlPDLtrAFOEmQmq4jmjK6Q2zTnGWke24oxpvfNuVbb5UhJ8T
         Pufhtam6WAe07Eut9a3F7iYEeGth5WTPWXv2WOpPoam6jt5zcXa73fCXO5o1TyXMKnSQ
         YSUPBZJEFqIYnQ+AQBxU6aaZODz6p1VmsV7zo3Cz9uyqDtZtr98H5mGKC2ddf1CXlIbJ
         5u4sJGQuVrSTR+Q9hBGMz3m+DrQ58UROwuvlAgGUMDWC4S6APItU8cGs/7noD23tE+t3
         7nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791386059; x=1791990859;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szkFWt0ZfzsHXj2rUuLdhVzoMSBDNtRMahlxWQcs2Rk=;
        b=k3313a/j1Eri8COs2DEdvAx3MQfvwXi9TJTEkSmk/dJgPjRt90b5m6eB4wq2GnQj19
         SkeCaVXWaU4/g6td7cOm1rvhqkbMtsT0T0xG3r3TzbvS/ifXgurljbHZh5A+LbPWWeVI
         Zp0mk5yNf/OtzSVTZQ+41plWt6yttJOK99ZV/BIZ8HeHZ85A27M85I01RFjLsLP5ntSK
         7vDJSjK3zO+Af02ITM6lxwoLrbjBg27uTITK6VjEDGGCxNVP+uhZhRRVI3bimBGzNQP1
         FKm/HEWWqoyuTjyd4wgG0TpzOrrN9DFWoI9/ZpE+YU4vhlGqMUcrEPTm+ZHbZcev2dm3
         FF4A==
X-Gm-Message-State: AFuF++l5TPHZNuWIFTRpXefhYwXQc6ONhmPHecfz4n5Owj8/59G16tox
	yXMAbxHPkgBxToXQCKDQEmorTEZSLITo8N7JgCh4klVQKpLepHy2F8UJiE+KWN3HV5H7w9gq6FU
	Y1GFkWn5GDfcB395MovoPF/Ez3mf7QI3vFnT9CHjGNDja1eDR+LweqrpHDektUOBUnUmay4ajkr
	6HvE7fW/plATziE0kxz3Shjms4/q3pQl4JiURrNJr0+kIJfw==
X-Gm-Gg: AYBFou2+559C5KxbGK4URq2yvhul0ht9NJ+3YDmqk2isvE/+rhXFoBiCirN2UY6vqYX
	WgSU1jwfcrsECXKPrzByGqjHsSoel5gA25StEJnZk5XEtkzdsX1gxNz3gnYwfeyxUD90suRNC5I
	LYlFQK1ALvJkdilHjA5t2nGij8Qrm5N87d3S5ssNibpL3CwhD3//M2+e5w
X-Received: by 2002:a05:6820:1f10:b0:6b7:46fa:1699 with SMTP id 006d021491bc7-6e7a729155dmr2528848eaf.46.1791386059557;
        Wed, 07 Oct 2026 08:14:19 -0700 (PDT)
X-Received: by 2002:a05:6820:1f10:b0:6b7:46fa:1699 with SMTP id
 006d021491bc7-6e7a729155dmr2528820eaf.46.1791386059053; Wed, 07 Oct 2026
 08:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
 <20261006131000.81501-5-robin.clark@oss.qualcomm.com> <20261006132545.8BFD51F000FF@smtp.kernel.org>
 <20261007052330.39998-1-kmehltretter@gmail.com>
In-Reply-To: <20261007052330.39998-1-kmehltretter@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 08:14:07 -0700
X-Gm-Features: AclHuK8EBLwtBO-Vlh8FHgDrHt105FPpsXtmu7CifdypQkUFfIWf2MiobeJA2n4
Message-ID: <CACSVV01gRju3CkSR093Y0-2qL2ghmi=GZXZW0fBZjxjue_e6qg@mail.gmail.com>
Subject: Re: [RFT 4/5] drm/msm: Convert iommu map/unmap to helpers
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, sashiko-bot@kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: amsa301Cu4o5QU2RrY_Hn6qS2F5oD3Uj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX6sPAka49MUG2
 7o8OzE3f0A6f+uRDtZRKovTL6be/cG9yu9FZUA3iMtRo/o5dZTEEqWVx9F4HFLHRFZcrbLJ6IA5
 S2ER+jeB6cICmE5A78bW2BaXoKHsf1Oo3HKmU0QurKe3CyAbhXrxyflde/Gs8stIgZsbexgl2tw
 7kln1iDPfseVNOM90hVF6toh9VLKidmyRgTw1a9ydnp9wZdElLQ7Oa9+QRhpWVOJe2ZYyg3afYF
 xHIzNoUzK9xBZ3+JBzXiLPpRGH0B9YG6rX0AA8w4lxB23FBbNhkQvyrhElutXebrN29qL+uzrO+
 NtGs2fPLXwLRt82Dk8BH+g8K8iWxRBddhofS1rpM9Bofu+jAIx7OwwfvlK3qQxQyMlRH8quf2+Z
 Tj4R5JCQzEPLY3HacnAuos32AG7FT0Aj9qenJxGdSm9q6K155lj+Xnom4ZIkK69/Kc4yO898Sm5
 hxuUpBGON6rI+llP/cw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2MCBTYWx0ZWRfX6ciMrbR66kIz
 RXElEMlgFqJB+kEbtOXPFnp4PouvbMP+XxuTMdrFPGIcuFVZtptx50gMThqt0CjYMFUGjR9s/ek
 DmH1JksDCHxZ89+FMv57pq4WX0jz+Cc=
X-Proofpoint-GUID: amsa301Cu4o5QU2RrY_Hn6qS2F5oD3Uj
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac661cc cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=2Fj81AndoEX41f5wj6YA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070060

On Tue, Oct 6, 2026 at 10:23=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> > By passing NULL for iotlb_gather, does this bypass the IOMMU driver's T=
LB
> > gathering and flushing mechanism?
>
> Yes. On arm64 QEMU/SMMUv3, unmap_pages(..., NULL) returned 4096 after
> device DMA populated the IOTLB, but the next DMA still reached the old
> page. It faulted after an explicit IOTLB flush.
>
> Using iommu_unmap() invalidated the translation:
>
>         return iommu_unmap(domain, iova, pgsize * pgcount);
>
> > It appears this replaces iommu_map_sgtable() with a call to __do_map(),
> > but there is no declaration or definition of __do_map() available.
> >
> > [...]
> >
> > Similar to the mapping path, is __do_unmap() actually defined?
>
> Patch 3 defines both helpers. msm_iommu.o builds with all five patches.

Sashiko is kinda funny sometimes :-)

BR,
-R
