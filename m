Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF6D48BD5F
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997149; cv=none; b=H0IoiwIKfzrg9z7wKMD4GSqPk3ujXBaEWKuojN4JsAl9q+OeHj3+YUXKCFkURzczbDqQpknO+57K73fVwT+4eZBgXYsxVI8P0WCOn1Eh5uNhU+gCA21AwTyTxMLVg6FiHOvel5awT0L2UZAWhEjdZ3h6//BvOQBxz0tH6TssyZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997149; c=relaxed/simple;
	bh=LIGjXBZuRHkVpvUJmypQdCVF+ROfFstWqZ+VH8w+9P4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bny3T54fh7VvfBqgTPZ/EhBsSiXnjdx/u392D/dMt1areoejfuqSlZVA9Mj+ZJLeVnYm7f0n1p/XPXZ6Etx/2Luur5vEi6Md+wDsa4JndFhFLTCimL5EW5PABKfgO2ByhYiW1NbDTQE0Sgxx2KjAZUyfATQIIifnbof6qsZoVEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HZqFBJoK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uqp/IBvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HZqFBJoK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uqp/IBvS"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662CjpGk382618
	for <sashiko-reviews@lists.linux.dev>; Thu, 2 Jul 2026 12:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XWvfanexks3bEkJvHtrjoEDO
	23i1+dyqL/VN09pDErU=; b=HZqFBJoKGGJMtyz3q+QSb4V2Ww3AgyQXw0ky3FjO
	NQrs9zoJpwcZqoDbADV5SbuMkvKyI/vqwJR+bV7fdM/10NdjN109XOzqf3IhmsUl
	PJ9oodZDKMXuhdeiMD2XyRUesbakLBKNZbwCwgJHQFQoA0GYlZgceoZn2oVVQ3vE
	mglCp83JLEzOnQuKZ6jwg5WzTwFpIKF8zkbrVhmUjaGOdVUDoCSjmqLEYFr95qnC
	iQ4fEcXB+MexKsD+qJjHj5TgHl5Yy5uof6KAy9EyQgGpkRIocXWnxCtHDBSuSTYl
	+EXrUPGXUj0BwMeQMkt1rlGtoiKp3OjMKzRv57OQEGOWRg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940u31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 12:59:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-963d7c11611so527148241.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782997144; x=1783601944; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XWvfanexks3bEkJvHtrjoEDO23i1+dyqL/VN09pDErU=;
        b=Uqp/IBvSXHeRA8e+T0oCa0vJRW+Hp8xRATgPozzoO8JdVDDJQXO6yzZEhlRpqJrJ+i
         krG5NS/hjeeETlwtuTpS0OOTbejU2X3t5+s52UlA8KE0WV4zFQusxoyz/bcG7TadoVxS
         sT/zZ8iWBiHv1aCKq+71nEF7RkP8WC8zAUNWZofRRtJp9Y09tDC9u1MshWSOfWxhBm0W
         E/dD9n3YYaNuMDCsAS9nGLNaZCd9p8rH89NEcgUWliHdAtYIqsPOtmZKkqCW7C/ADwUQ
         lt8FKVgxKUaCcgQZNXJUOHM24AA8oz39s0I1rEl4h4gfvfCYbZel4WvNmkIkQYKXdFI6
         aZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997144; x=1783601944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWvfanexks3bEkJvHtrjoEDO23i1+dyqL/VN09pDErU=;
        b=SSbBQT/sy9n+6TPpDlQ+e9gjZWXDE+rrZ/vHaOMIBdho97f1Vpxce5CMM8lF2s9paa
         qVZCxPvQDCf1iKiCpsREETVLOksz5AfKyNfDmt2ujdtLRt2s2yWY0j03W5FrjiSoktVc
         Itftn+WU84EYQXYLQTwGbYrrNCqe1hiyb96KnTDu9qPcJpigwoF4g7go2djfWE9uzABj
         bz+aa799/Je/qEce0VPRysUEYtYyUHyEXgXT4M06kRWuk7g0M/lCkwSWZ2UShrNQDsC5
         qXaEiA8iiXsjCPM0FGtYflCrJe+SR+qa+gr3mejx6dvjU6qSEayXIZHfAA2Ohs/IBBLg
         /ABQ==
X-Gm-Message-State: AOJu0YyWUFjfuKb1tE5BHHcQ9AbmhOIivK0OFZ7Ycsry4YU4UAdZaSRX
	0m3yWI0Gie2SoW4/Ghnn/Q9Q6eYz4qNKzmNuzlyo/7bTcOgy9FK+CBYYAlVkd4C1fY7RNn9ThC/
	XheRZZ2H+oY0rQZzRBRwMXoextZ/Vl2w2Bak5UunnbihSAPzSO7CrK2J3er40zBN4rQ9rm5A=
X-Gm-Gg: AfdE7cmM1KZ+y5bSPBLSJ9Ync/wyVMS5ceEnyWIL2Uhi+R6S+qvVWpLHPBlmkbvLGiZ
	CqUjlWzuOcttX0Ld8x9Mt+/O7HN5RQThDCBF8FqLNMHvJmlFxBlpRj61S6CWhkIR1sQaVfcZ9cM
	4mqdXQMBnIPHbPxi2dCWVLJeBMh3p5Yt3SVvJrkgM6XLOy9pnoUEXId8jGXDkjStRXnH2iZlyJu
	7Jh3zfPrRpM6S7JxqK4ahAFm5UshSDkp8SRnXNZNbVVLMdZCXy1549Mxja79rH5KbyNwOG7pshq
	66g+f8OgE+Uj9+MCtmEh5MsB4YNPwjYtWnowA8BGfWf63Voa+OTsp5SzswFF2mAWgkFmJqR/zyP
	fUW9mYV1U9GTrWEjFArO7JgDEb+q5BmTdld8dZULUXTMjwSreZd2631mDPhOMISGYwEryIbdEOc
	K/5iq0YBpZSQaliwgi4DqrYXGe
X-Received: by 2002:a05:6102:33d9:b0:739:4fa1:50af with SMTP id ada2fe7eead31-73da7254acemr1784324137.2.1782997143641;
        Thu, 02 Jul 2026 05:59:03 -0700 (PDT)
X-Received: by 2002:a05:6102:33d9:b0:739:4fa1:50af with SMTP id ada2fe7eead31-73da7254acemr1784317137.2.1782997143195;
        Thu, 02 Jul 2026 05:59:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89d526csm656180e87.43.2026.07.02.05.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:59:02 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:59:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        jishnu.prakash@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] regulator: qcom_usb_vbus: add support for
 qcom,pm4125-vbus-reg
Message-ID: <tdzwu6vvj6md2akfq27xrz6alzxdmo3zfgvwg2m4b4e2opwkww@yriwb7gkbchd>
References: <20260701-add_pm4125-vbus-reg-v2-0-6bac2bac7131@oss.qualcomm.com>
 <20260701-add_pm4125-vbus-reg-v2-2-6bac2bac7131@oss.qualcomm.com>
 <20260701103435.D6DEA1F000E9@smtp.kernel.org>
 <20260702075442.tc4kbudjbfg75oom@hu-kotarake-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702075442.tc4kbudjbfg75oom@hu-kotarake-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfX8maxxDJ478ze
 Ef6Q3tbLN7a4VBGqENzIJ+c5cjuR9oP1pKc26/lTsTwrXuTHnIadrJAsgHy2MZFcOGI87r4f4Xq
 rC4XI31jVUElNA0yiqPifxl+W2Qw7SXuM3mmaaqQL+AXDGc1x8OMEsANYDHhpkGHXUMmDU+KK/u
 jOgyLGkW/1Mlhp4HTkQRIQo2n8iNeKW8GjmDXvaLUbekWPRc9RQFFE2O+3m0mMiQdXDmiTXY9L0
 jM7Wne4KN7GTB+bCbyfS6YztSCltxDVtPhoQxW76tQRzO9M8uRu5ij9nJ5UUjC02bELGP6VRvAy
 S89Ku1oyfAEwLUizM1cAJLh54Y9Rb6sEspHjOXHCiHE9+iCJeRDSbk1iq4Hr2OR4NZix9Bj8+rr
 tk9WSaX/v2j6KfIta77Q/s59gYScKipVVoF3w3SgbaMPWz3tixMoO8Rd6Su8whFE8nDHfqWwOcU
 hoZoFRcIu/obFQGMluQ==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a466098 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lmjr-25jFlC-zAT2i-UA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: kYMoNWrWoZqwYKENVfYHdvqpW7EI61sn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzNiBTYWx0ZWRfX0xEP+zyCpLs9
 ePCQPhRbw/etgE7V/9j9PcuMkCJPbwWMQLMBmusxblxXDAwk6CZBb5w2hl8N32JfyiVWTfvhiqn
 WQWVywQz7Eo4r3Zf0vPXRqRGcnuI+LE=
X-Proofpoint-GUID: kYMoNWrWoZqwYKENVfYHdvqpW7EI61sn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020136

On Thu, Jul 02, 2026 at 01:24:42PM +0530, Rakesh Kota wrote:
> On Wed, Jul 01, 2026 at 10:34:35AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] The macro `PM4125_VBOOST_CFG` is defined twice with conflicting values (`0x52` and `0x56`), causing the voltage selector to write to the wrong register and corrupt the OTG configuration.
> > --
> > 
> > commit 3778477cc88a05791ed34dc272e50cbdb4893643
> > Author: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> > 
> > regulator: qcom_usb_vbus: add support for qcom,pm4125-vbus-reg
> > 
> > The PM4125 PMIC uses a different register layout for USB VBUS control
> > compared to PM8150B. On PM4125, CMD_OTG is at offset 0x50, OTG_CFG is
> > at 0x56, and offset 0x52 is a 2-bit VBOOST voltage selector rather than
> > a current-limit selector. Introduce per-compatible regulator descriptor
> > data to accommodate these differences.
> > 
> > > diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
> > > index cd94ed67621fe..40e7e5589d5b4 100644
> > > --- a/drivers/regulator/qcom_usb_vbus-regulator.c
> > > +++ b/drivers/regulator/qcom_usb_vbus-regulator.c
> > > @@ -20,10 +20,35 @@
> > >  #define OTG_CFG				0x53
> > >  #define OTG_EN_SRC_CFG			BIT(1)
> > >  
> > > +#define PM4125_VBOOST_EN		0x50
> > > +#define PM4125_VBOOST_CFG		0x52
> > > +#define PM4125_VBOOST_CFG_MASK		GENMASK(1, 0)
> > > +#define PM4125_VBOOST_CFG		0x56
> > 
> > [Severity: High]
> > Will this redefine PM4125_VBOOST_CFG to 0x56 and silently override the
> > intended 0x52 offset?
> > 
> > When pm4125_data.vsel_reg is assigned PM4125_VBOOST_CFG, it appears the
> > regulator core will write to 0x56 instead of the 0x52 VBOOST selector
> > register.
> > 
> > Should the 0x56 definition be named PM4125_OTG_CFG instead?
> >
> Yes, you're correct, I will fix in the next patch by splitting the
> defines:
> 
> #define PM4125_VBOOST_OTG_CFG   0x50
> #define PM4125_VBOOST_SEL       0x52
> #define PM4125_VBOOST_CFG_MASK  GENMASK(1, 0)
> #define PM4125_VBOOST_CFG       0x56

With the defines being fixed:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
