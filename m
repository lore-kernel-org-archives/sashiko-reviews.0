Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58B24F3902
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 19:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574859; cv=pass; b=qcPxOYjiPzUxSdmacwctTltzrekmWD6mrFJuYZ8jjxLJEUEKWNcuGIVsAKT+WrkkAtMEJjeokcvZVWeMNgbMvjMAY4JGhrdtHwwdJ8YQQblVSbEafkXyoP8scsm3JqcuOYIh8j08/uOREUTUlkvgBK4qV+kpkO6D8Bq79lr9HXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574859; c=relaxed/simple;
	bh=xnV2S45TCVxut94HdI0PFmaZ3bMEdZbO8IBjI2zIMTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amshfh4OgrdetMTBZS/GbMGy2swxoUETz93dwlukeqDLMAdmE1okswOsa6b5mFoIk+d78HVwlenOSaJXvaP2hO2oUoi1+lT+stLSJNECLlF7XvgHHirq8lMQO/6fn2QX6n/hL9DwOnuhGtzRPft7wpdGImO1/4VmuWOc+azcsxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9pq1pU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N83EqkTW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9pq1pU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N83EqkTW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Hl3XB2992551
	for <sashiko-reviews@lists.linux.dev>; Fri, 9 Oct 2026 19:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DFP7XVJec+3y1JmKPzpRMD8H
	mUw+0cx6OJPzJlvczCg=; b=V9pq1pU0O9CIe3Vb5+oKrLMRfpHwn5Y1bwn9Ewmm
	eQ3WD4vh59BFIQ7wLKXRHBjpSJNCcSYuXqHzGuiKw7ZCNVH/G8y7+2KmBssEfvcQ
	NHh9eqTJXZpz47o5xfO9wmE90LfrDpRshcu6D2QwDcmQ5vQQpKRZcK8dOqy/5HmJ
	u1ERAmrRRSzquI0STobWH6leFa7g4tB0h0DP/oftRtfvAxbrZVyA9wYRJIqP/dlZ
	VVwd8aKYR6X+1VEY34dWK0bpD1F0BOgf+iVT/4nQjSWpQa9xnmU+KOaeXVMHivyU
	AMWDXgiGrgqK1hCUltuHT3oiVdSjDtK/qEW46psUHTKD4Q==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t8gg94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 19:40:45 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8461ade272bso199247b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 12:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791574845; cv=none;
        d=google.com; s=arc-20260327;
        b=j784M1ONefaVydmubRj9R7QJYJtARSa3idIliVXxbVGrOkiIfSPbMNFySWsAPLJssT
         lsoD24ZVfN2y3KMGidspDnpszQgYtPJJKPgnGbKnsTSU3s1EB+VgLAQTsbz4kMguHQ0L
         vvcAHjS74KnuFRfGNWVWpHTEsvP/WhgnqesLqJvwFxCqh7AQY7tHWz0do2GyX+nJgu9X
         JOpixGT88rSjMdms9mGgwUrJ/wKXHc68JtcTqjQz1pa6AL5QZODWRFlbs92oUJp51+PS
         qR2GhfWZ/3N2gRvAmnuuc/jA5tccrChKRkBAbmEecspyRrO+Iu4lrkCzbz33uZSV9Quv
         IOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DFP7XVJec+3y1JmKPzpRMD8HmUw+0cx6OJPzJlvczCg=;
        fh=EghEh97W7Lf3GuXGcjrJaEeEjpeMUMcg6lBpCeWJHSw=;
        b=Dw68nX9CzuQ2WdlEu/88H7pRd+j6rd1PVIeQgzHl+sbbaoSwr7b5ozINcgkVr10u/k
         mXDAyrivcV1upZQg8znfPqM9S0S+h2tKOzM5iZDxf+ahwTBRqPytMDzw+SeN/SZbCX/H
         v9IRq8QDUX6QvwIUKyxxdPJuE4KfDEQg89CUPR2P7RZqDpaxOnbP/GaNUJZcIGMyJEOT
         TKTpMvn+F5GKHNSPIYsaGSsri4ZI7+tRovp/ubzX68Nxy45StExCCcuXZSt+4xA1ExXY
         ACdg5c2nRe3EX8bHi/R7kDP/2bhK2fPbelvKkFmoRMS3VuLJeXFhMX6dnPLBDLAf+Swa
         oZdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791574845; x=1792179645; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFP7XVJec+3y1JmKPzpRMD8HmUw+0cx6OJPzJlvczCg=;
        b=N83EqkTWL1mTyLDXun5VahoipLC178Q59JRHlW1H2/OfW9bczjuolLH84WVQxGGcF3
         2U56scvWuEVKJ0WfUYJBchHpvi3NlAZeE/IDZnBzje+CtpMDYiiamLzhyiwdmBY7Ujc5
         5iuv9+0bg6QhRbAmcFmbaYe4/sdB1LoqXK5A8bmwMNdX/4i4IjSQ5f6kjaT7VIBY0/U7
         YHXYxQAvHUdbmchpShj5rhUG1ax4igzVoBgtloLGTJWDzAMmFFy8ESduHnTxahRSVgir
         BDTYksD0p/jUr+tASQejYfoP6k5GGXdoaV3q8CfLXVcjVRx5M6BuryNu75ztwiguIgR8
         N5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791574845; x=1792179645;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DFP7XVJec+3y1JmKPzpRMD8HmUw+0cx6OJPzJlvczCg=;
        b=NlhQf5FZtjD4E88FeJV+ie55GIlJ8exoIdxoBa62RRqGOPMX5WoGnQUaHMaBZs5qcd
         L5RbawnbcuL+xil0WORO5WyQ8wnc77kiP/o7VWk4d1e3Cm4Xp3Bb54FJ5XPFFFLRUqj6
         6H0AmG+HnTKJEePfwOtnVZTRz6XGMcjvFqfuP+uNY0UZ58l9d8DhNPwqBOEpRMe1xhqR
         ZWQ9PGYj1zD9Im28o9cckGTv92tthgGcm45JvfqMP3CiF7FqhxmWaUdpeLrVQ+Csl9un
         AODRwvVzi5BJJZp6VRcqWRxuAwXTA3ge1BI0BatK1sI6qNNR3U9ZSCfPrOqTjlPPYeVI
         phoQ==
X-Gm-Message-State: AFq9FYLsqITGXRGT0P8nkngmxDv6Ydi8fhug6A47rpPGiyKI8ERjPgIa
	ykQeTM8wURTf55Ny+zP14Oh1pWnjk30LsqJpjUI6SdHLimEu/4Vxcsw4lXxXh2LzvawP2Tdr7ED
	bhsDXBHnevbUzhvOEHyyuxUzmTIdKDH568+d7u7lyrFF739pES8eNOrIq4cvK3HVLw8+BdyH+u6
	+7AKHmwNt7r7xANLoUFyoq4s1HKYA+ncS8FT9S+y2S0HJ85Q==
X-Gm-Gg: AYBFou3jfLe6nyWHHmC5h2mrkm+tJH979xDA5xo1aVofUCseZzbqUl9gZdcBg6irRKi
	6hEG8yXWGsliVmVbV6NRFx6QcuoKo8G0JQ3yYSen8Nf1cx7B0mJ1CLJoerKPx46o0GN0X0PYj3P
	IOG+CM8bYJoKX0votxiYAfaH68uBVCMS+GxumyK+9C9wrVCwy85+foSCTH7Ys=
X-Received: by 2002:a05:690c:18:b0:873:5c6b:a322 with SMTP id 00721157ae682-8b07edf22f8mr9886157b3.28.1791574844615;
        Fri, 09 Oct 2026 12:40:44 -0700 (PDT)
X-Received: by 2002:a05:690c:18:b0:873:5c6b:a322 with SMTP id
 00721157ae682-8b07edf22f8mr9886047b3.28.1791574844039; Fri, 09 Oct 2026
 12:40:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org> <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe> <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
In-Reply-To: <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 21:40:31 +0200
X-Gm-Features: AclHuK9Fb9bIOKy6LjpeM2Ha7EAtqoBusRfLt5HoC7IcSK1fx4l3vqUb3dKqoK0
Message-ID: <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfX2aGDCw0W/G9K
 s9SknGJ+RlbVIfmyUiG8zjyrIMDiZ+NR2OKjv+FRBIkTOr6jLDblxwLlNNGEn7yyC7nv5RZh/hq
 KRNXErT1OMvn5A4/crHRJduATGgcYhA=
X-Proofpoint-GUID: ZiWcUwffU5FvGMnNpsVFMAM_LLVnt9I2
X-Proofpoint-ORIG-GUID: ZiWcUwffU5FvGMnNpsVFMAM_LLVnt9I2
X-Authority-Analysis: v=2.4 cv=AMIlxa6n c=1 sm=1 tr=0 ts=6ac9433d cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=pdqsUJ9ZRbmRKYiob1EA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3OCBTYWx0ZWRfX7kwx9lV+nbM+
 cBEe/30WkWj+Dzl5siHySnhtdrbP1nGvphhMU/6wao7MS07+Cyzqozzuecfsm6hfI3adiE7F5dn
 rR/tRXf7HuNoxACm7HZPQdFXsBnjJxAXoakOW936W6Mg/bZ01lNgq3kXV6srT25tulK8V9PYMVx
 zXSKV904A00ztzUqP57kgEjRKrrnbqNSxcrrAZLX8XKQGdFJJL1y3/8Guk7bmGXmxr1KgMKgFi1
 Vz2tRnXfmrY+TQjBG8H3ZkveZG0YI+ppM+93oHepAuX7eTerDCNqezUOkgZCa3BZnhe5cu7ivT/
 dujmZcj6u2Eje8anpbH11LW5HoHuIaaLKbDx2HiUAEy1kYj0QehkluMuaHhJdXh9JO4hb4h5UMz
 gKLOoCPSddBOry/rCycuoSGYI1S7hnTx7iZOHDTphj/3xQF8tHmqHnKBxXgWvPEiAjFz+TUFoLa
 02C21WGebqzP25ApsyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090078

On Fri, 9 Oct 2026 at 12:41, Vishnu Reddy
<busanna.reddy@oss.qualcomm.com> wrote:
>
>
> On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
> > On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
> >>
> >> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> >>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> >>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> >>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> >>> --
> >>>
> >>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> >>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >>>
> >>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
> >>>
> >>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
> >>> ranges directly when there is no backing "reg". Introduce logic to derive
> >>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> >>> to be paired with a "reg" property.
> >>>
> >>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> >>>
> >>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> >>>> index a18bb60f6f3df..9766a6944d0e1 100644
> >>>> --- a/drivers/iommu/of_iommu.c
> >>>> +++ b/drivers/iommu/of_iommu.c
> >>> [ ... ]
> >>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> >>>> +{
> >>> [ ... ]
> >>>> +  maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> >>>> +  if (!maps)
> >>>> +          return;
> >>>> +
> >>>> +  end = maps + size / sizeof(__be32);
> >>>> +
> >>>> +  while (maps < end) {
> >>>> +          phys_addr_t iova, iova_end;
> >>>> +          size_t length;
> >>>> +
> >>>> +          maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> >>> [Severity: Medium]
> >>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
> >>> malformed?
> >>>
> >>> The loop condition checks `maps < end`, but of_translate_dma_region()
> >>> implicitly reads `na + ns` cells from the maps array.
> >>>
> >>> Does this loop need to ensure there are at least `na + ns` cells remaining
> >>> before calling the translation function to prevent reading past the buffer?
> >>>
> >> This function intention is not to validate the address and size cells here and
> >> it's not valid to read those properties here. If the out of bound ranges are
> >> there, then it's part of dtc checks that dt node contains invalid ranges.
> >>
> >>> [ ... ]
> >>>> +  list_for_each_entry_safe(pos, next_range, &ranges, node) {
> >>>> +          if (pos->start > next) {
> >>>> +                  region = iommu_alloc_resv_region(next, pos->start - next, prot,
> >>>> +                                                   IOMMU_RESV_RESERVED, GFP_KERNEL);
> >>> [Severity: High]
> >>> Can the length argument overflow on 32-bit systems?
> >>>
> >>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> >>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> >>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> >>>
> >>> Will this truncation result in a reservation of at most 4GB, leaving the
> >>> IOVA address space above that unprotected?
> >>>
> >>> [ ... ]
> >>>> +  region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> >>>> +                                   prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> >>> [Severity: High]
> >>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> >>> to its lower 32 bits on 32-bit systems?
> >>>
> >>> If the remaining address space exceeds 4GB, this truncation could leave high
> >>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> >>> IOVAs.
> >>>
> >> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
> >> set the dma_limit max range in that case.
> > As this is generic code, could you please adapt the code to work
> > correctly on LPAE systems?
>
> This is no different than the existing logic where client tries to reserve
> greater than 32bit length on the 32bit LPAE platforms.
>
> I'm not convinced why sashiko claims this is introduced in this patch.

Because you are adding the line.

>
> >



-- 
With best wishes
Dmitry
