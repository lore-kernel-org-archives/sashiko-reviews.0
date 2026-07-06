Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F672E737D
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 13:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345680; cv=pass; b=aI03XZRcNbQryKWomsAPpFHci38rfxzYOrLeXxU48NHuwJps+N7S1aDKX7O4CeDkm9PUxtquZTmHNYUZcZdqBxvIMGaAXvYKIRzR42oZghcct/pBb/yaBNMVlAPBcKEffsvuLNgeGwEcEqQwP2uyUV2s6cDhcawNnJuqS48qcps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345680; c=relaxed/simple;
	bh=yKX3QpsD7jnRt3KbvpEzXQdNJzUs2fSGcUMARjKoeg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DUMtszVQybvYhp58z8LvVMMY9PMjexLXr2ORCN4XrHCFUh/m6R0ANlopke5dvbXGkiUcVYw0yXVEdDMm19lgftGwMH1mDwXPu7eetrMrZftNcfNSskoJki3bBGUO7hYEP7jZ5x9HmPv83q/1yGlIqgMeBTu2/buP4L7QO8tJ2hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diDegdcI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5ZhO8sT; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diDegdcI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5ZhO8sT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxI8g387418
	for <sashiko-reviews@lists.linux.dev>; Mon, 6 Jul 2026 13:47:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=; b=diDegdcIKsq+G9DL
	tsBdcc9t7yraNFXFOlVWLtIU4Qeq06aN10BNvin892Q7yyjuqghxXpT5RJIm4DGL
	q0UEpI1qwCEHwEVRB6kI9p7nrduhw278ucBr7yiyKRGzHAlDt/jq84Rz9pI5e5Br
	epwnV/Z5IoJ9FeoI8e5XmxH5nJwJTe3xHDPj3XvAz0hJUfAFLKZ7t8ke+tPI6QgS
	oF8RWa/QO9poNHSHaOVQJCStNNBNvujz6O8Ma086V5R64UTVl5tcjPny0CoG2oD7
	LvPzUxhpWw9ERxPFyj237wYPZ5LX/5PGXTXr484Z1T7k2Kx1M3O3rNe0I20cbnTv
	Z5xnHA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r0w6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 13:47:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef81cc115cso37399166d6.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 06:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783345678; cv=none;
        d=google.com; s=arc-20260327;
        b=O3buEQ/+L3DH6GtftnGiY8ui7ljpqouH5LhkClKsr1yE0LNOAB30kGtfVNAdMORMBo
         +zmbZ12a+bKx3OjbKCZaCuISC2RjrvlN3E3C5W2xWoQ9gGrZad3jK8wb+tDUjPthMrQz
         f6uX3P4RaqlwnPGxgriXhL3XZFL9addeGHhHDEb3f7EtSY+StwghrAdHWjvJRFneQc9w
         I6dkYyHtVtWQdqzPzoT595uin+rImhwpkkEk9lDsL3c9nUScyPuOyfhG+3ZCp4njCpa9
         2tyXRZjz5Ul+ZXrQOY+NlTBoWAcCyOv/zwLa+UG71kuO8aTWL7htIEUhx5cepLpqDFYP
         SAtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=;
        fh=53qvJawqK0TJTsq+MaD47KBMEtgXQmC582XHmZ7TrbI=;
        b=JAcKztzdHxuxCEuLDhPyJQSveh2FbBCZX+HGoKkLP0LxGyMQg51gyeZLJ0T7YS91JO
         u2Dul31N9dToYzMuo6MFfGoeaqNI+izkZjSbh7nYY7+lU3lzMfZdyI3BDGQKfh24ns/4
         6mO8VxE9UmC/UMTk0MtcjGcuGDXP0L6LZM2XO/iBOyk9Yml0nWu8ZvBX3Ut0003+/tQX
         nEDLOSZ9Irw/RHG/2Bf0FsfXahwYqv+jlf19KQ4AaZXikNXQytI6O9v51vB50g+7TJrU
         PZMuzVEDn7k5aFGIPvlFt7nAwNCf/OMr/ZBqj2wjwW09g8KWdfBWJCjH/0LN0QKVhQ2+
         AweA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345678; x=1783950478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=;
        b=K5ZhO8sTa7Nxm4wHtJ8nZIZdPszW6gyuRu8nQWdb/4GnjVCyhW1VeeaT91U6G8v4oI
         B6enXXuUTOJzquE0S+wAjYkJcsqLsWboNahLDk2c5y2bZaTYBe9zrtA/jMItG186jxV9
         tvsRLT9GNKfkBWgx1frPC1Y5FnwTjwO+BYZsRm5u9rlhgV9FiIqqkVX3eTJiEgLjR/IO
         HpV4XobpvJm/h5AtvKCFemYGnO6xvTkPt3ekiKkBs2yvgwEofqFV5am5cZfjh7mLWWVI
         Kd1yf26MeRiQ3k37I/ELu28IzCwVhclE0bSOnTXibblOua1MIryLZwbQKwaw1abLUgLC
         LrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345678; x=1783950478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UdN9OJlWbUEGF0w/8hgD+on193H22chezDSr9kjxHY=;
        b=pryopxoMCrLBYyrB+W0gOlDJbfVNwWOIToT75lJyovv4uIw4QqU/2ME3ce97wrnVxh
         R/RMznnv0VZ/YvSK14wRz2ocu2kzam1ka5pWShW+hle0Hmlz7F9tAm362odJZD6DrpK3
         uaFFt3THb9hdb/7P2fnPT7zaVo2qMD9L1mFUBh3ACG/5/+pqpF9nCunmfiL5d87rQlFh
         sVbNDQKa3Ec2iRs9McVzpeVlqUJh+DIaWXHFAmSEuDIEKgulAnpo0WJ293z3ziLV6UII
         8GxrZMXm2WnMTsy7NDLI0Dnd9hJvIrc076bV1Hivis3X/KhP3gkgOzJCVfE4E1hi9FX1
         KRkQ==
X-Gm-Message-State: AOJu0YxbXhfJthb/BxQlgu1i6POePJr9pEWPCTNCWgXxIuZuqwsb3B9y
	PUtAGOIaKsW8KMeKByhF5nPM3/VEtOif0pf9I3sdyEUUSUWW6RZQESQzz21qHK3TbvkGywgPdn7
	pjF6LMo291peEG81Zo9I5jxVK0xmQ9BTNkFfGYWgKcJPX4h3WxSxjA7a4tm9X5yLz5AOIb6qQpb
	JLonAo2bkgfM+eK2xIOoePM2oNhJHPvArUHXGQPemTKss/hsVucLSCr0Z8
X-Gm-Gg: AfdE7cl/oh05sJ7aO/ZbWIbcoySELVFagmzUDYBnYofOj47VabeodgtYqHsBM9CdINg
	wk+oFGbvTr+l82BgOMgqJzRloAftfC+MAeqYiYVzpIIuJKy1vc3/MU4T7OtXJqBWTiw66hNnQhX
	MPhFuyiXu6s2EV0BVQMaZZ2p9Nd/M9gdjj9MQNm5D/f2MDm1KJdrGswBKSuEZc5zPtLVm130Gvy
	qod0oisQgeEuW1Ye05aLRfdyE71ZjiLpRRNcgWtWDgJ/kvYU2V+m8MnnIXWgaHR4e0ujV6v6JGz
	9UewxDW96vo=
X-Received: by 2002:a05:620a:408b:b0:925:dce9:4773 with SMTP id af79cd13be357-92e8b56256cmr1966449285a.35.1783345677535;
        Mon, 06 Jul 2026 06:47:57 -0700 (PDT)
X-Received: by 2002:a05:620a:408b:b0:925:dce9:4773 with SMTP id
 af79cd13be357-92e8b56256cmr1966445885a.35.1783345677041; Mon, 06 Jul 2026
 06:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com> <20260704134553.979031F000E9@smtp.kernel.org>
In-Reply-To: <20260704134553.979031F000E9@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:47:45 +0200
X-Gm-Features: AVVi8CcembUqad3b-OIrhXW-USe8W-sL-DPnI1aY0bddo2h5b-bJogd75j1IHvU
Message-ID: <CAFEp6-0zrw2=ed+eWquvt1WzYG4Hiu3ZfUXM4qLcfBsDO-y6Jg@mail.gmail.com>
Subject: Re: [PATCH v8 4/9] nvmem: layouts: Support fixed-layout as the nvmem
 device node itself
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX3M1Qthd9ShWG
 290+keU2pxrNd0d96+QUa4D5mxQzVLNJaGPdq7c8wAR9mFxnTdv+FVhJcBWzQ+ql0URh3g9xAwB
 9yr/O1uhjHSIyi2kf6APHI0p+AMKDJg67eb6T7uayLxUSddPQkEVMoDBinAFwOhiFbFvQ2NC5mA
 RTIGjbmbbdbqOLZfRhFE1rhOO57G1iM+XZDd0yV+5gyRtIItMcgoPRjV5r9YoK7VIB/dB7ytUU6
 UXaITM1qBQrd8c1JRX/ueQkCDnoMcNvapjMr7qrgSuVI69RkCF9HGQcvw4r+Lw8Pw3xj8Olsbnw
 wyoAOwKMh6KfBxB4lAq2Pv3q42HRFTuVB0frGr9XyslcwxzOqrl+uFBE8w+m3+nKrcXuAJ7EIx2
 sgvOp+rzGX8jpiCGfQoWYwVQYKHSGHjxBmn83gtTcyM1qWDz7gxiIWeLBju7uLq3BRWvwBkLmTG
 LE8YKc44EfkqRuEjRsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX1GXjQCRlONUu
 ZeDHFcFGsyBlU8w2JvYD61XsdKo0Syjtt+f9AeYxqwRz0tU9T7C3E5shcTSyERfDTdcBi74VgMY
 bZH+JhpGkOXZIPS9+zhkpe0+8U50No8=
X-Proofpoint-GUID: Ru9qSQe3-5RVJkTONIPx8rscsLz9GE-b
X-Proofpoint-ORIG-GUID: Ru9qSQe3-5RVJkTONIPx8rscsLz9GE-b
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bb20e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=01sGXxyCQw8U16377doA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141

On Sat, Jul 4, 2026 at 3:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Double parsing of NVMEM cells leading to duplicate sysfs entri=
es and device probe failure when a legacy provider adds the `fixed-layout` =
compatible string.
> --
>
> commit 5ae6267ddd6db9a2a2626cb61243805bccbca0b9
> Author: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> nvmem: layouts: Support fixed-layout as the nvmem device node itself
>
> This commit modifies of_nvmem_layout_get_container() to return the nvmem
> device node itself if it lacks an "nvmem-layout" child but has the
> "fixed-layout" compatible string.
>
> > diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
> > index b90584e1b99ea..efa631ce7283b 100644
> > --- a/drivers/nvmem/layouts.c
> > +++ b/drivers/nvmem/layouts.c
> > @@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_=
device *nvmem,
> >
> >  struct device_node *of_nvmem_layout_get_container(struct nvmem_device =
*nvmem)
> >  {
> > -     return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> > +     struct device_node *np;
> > +
> > +     /* Search for nvmem-layout child */
> > +     np =3D of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> > +     if (np)
> > +             return np;
> > +
> > +     /* The nvmem of_node is itself a fixed-layout node */
> > +     if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
> > +             return of_node_get(nvmem->dev.of_node);
>
> [Severity: Medium]
> Could this lead to double parsing of NVMEM cells and device probe failure=
s
> for legacy providers?
>
> If a legacy provider (which sets config->add_legacy_fixed_of_cells =3D tr=
ue
> in its driver) updates its device tree node to include the "fixed-layout"
> compatible string, it looks like nvmem_register() might parse the cells
> twice

This double-parse can only happen if a single node is both a legacy provide=
r
(driver sets add_legacy_fixed_of_cells =3D true) and carries compatible
=3D "fixed-layout" on that same node. That combination is not valid and
does not occur in practice.



>
> drivers/nvmem/core.c:nvmem_register() {
>         ...
>         if (config->add_legacy_fixed_of_cells) {
>                 rval =3D nvmem_add_cells_from_legacy_of(nvmem);
>                 if (rval)
>                         goto err_remove_cells;
>         }
>
>         rval =3D nvmem_add_cells_from_fixed_layout(nvmem);
>         if (rval)
>                 goto err_remove_cells;
>         ...
> }
>
> Because of_nvmem_layout_get_container() now returns the nvmem device node
> itself, both functions would process the same child nodes.
>
> Would nvmem_populate_sysfs_cells() then fail with -EEXIST due to duplicat=
e
> sysfs entries and abort the device registration?
>
> > +
> > +     return NULL;
> >  }
> >  EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-block-as=
-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com?part=3D4
