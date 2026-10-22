Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663637;
	b=vFyJX4CBy9pt9clIoiSw9xbV8m+3ddJy71wfWSSgQK2ykCsWXPyAsoWrnb67Go/HDyUR
	 MSGeoTpY3vFbd7GNLeGkcDLaBmeaZxN6u4r4M86NlpV9HYSx0mRE32VCpjC/uaso3iqky
	 Wp5gWLdKSL3Spc94M45OdcPSJgDf7dpH1CemrCweV5jUu9kxrpet8P7tmJuNMCG+tGv4F
	 Kfunx7Hg4rGLy2Agmy21Rhe1WGJeESn0HokGOrn+Ri37HL+raZqaEE6jDX/oJ9uRIsM/d
	 oCQAq+l6s9HJK9P0g2iVVG9pLxbcMDkJmLBm23h8lDSZA1YGlBRX2FqiFhLPB5G7IEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=c9UWoPLA5mGfp/Rl3fZwFMEKWrk/1mJkMgqK5rleBeU=;
	b=jQrXUeuRAA+yU84yGw85XKmtBCBsOoCwaPXju6meCQRUw+ixH7EgwsvwofrR02zUB6hY
	 hNjz2FhdHroH7Tyzc2Ltj0mi+X1vrStsETddd4cigmLbs3H7MaMbG7IMm7j01zN0a9YKk
	 Fwi0LwHil9s98hfs3YKq39b+od+PbArwTFuQWyS9eYw4xIMRobG8BNKI3UkIDZ1Cn1aD6
	 U5YUZnenqhultLMYx/6oC0Sg7wVjHiZIdNL5pqdfpwGIIJ5+E/4TA46d6ntcvT8DwDE/X
	 Wmu/8bQDyO/y++YSn2jPRLkklsyUOpsWaSsSG4gkpDth3jtCd4IDojCBiyGNeAzoBDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMaZbsYm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OYgR1/Cv";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B780C606A324
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 10:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B780C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fMaZbsYm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYgR1/Cv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0Dq13116018
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 10:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c9UWoPLA5mGfp/Rl3fZwFMEK
	Wrk/1mJkMgqK5rleBeU=; b=fMaZbsYmB+jAra5oiVRf5476/s3pZ5gkrQrPXvEK
	JsNs2PlDMWXkWsZswF6sVfWLuxv8Il3NgeFo9KcJT1+WfVxxAKsYwPW8atwvj2Vn
	6vA6tR+lX3ncEIMw+002QoZcGT8nTRbhT1o7o2WzmIetjf4TG39I4sFO3WjDK31Y
	5lsk35DpBIFwqPNWm2UsMjmtLNrWCdQLI4JPzN0yIV4/GmMY8CZirMtNCqPE/3QL
	2dNKfBNpaocBVxGC7L5eUCNxXjxQQoYergtMoF4KvBpz3eRrJOpOWeV5GDlWp3gr
	y45sSx/sAFFEx+7nxNpHrmM10cptyDyAUzFTDNRe7t5Sow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsu4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 10:07:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so270408685a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792663631; x=1793268431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9UWoPLA5mGfp/Rl3fZwFMEKWrk/1mJkMgqK5rleBeU=;
        b=OYgR1/Cv+R5h2sHhEbbyJGbli9xKxGPJOr4UzMNCBn4jkqO4pz47eIlHLTNKImJ5IO
         7+7/HF0Dbycwq4G/1YsBf2Rhh+iqW6JDQpq0ac5fjgvyf5Wt//GFUAb1Rr5lnN/qSL0A
         b3rPHBsiGE2qAkz6pyRtqSbGgcpO/gkoxU4zK58+oXrK+93E9cQinf1p1TBdamZRNPd5
         YC2wUYubjYm2V5s+BJLGL8gAUxLX9otBaOsRqPPzy4wNTidGZRQgcamczHxEpJAM4nDB
         q4jz4S//iqLyiH49VA74TH1c5DuRjErl8wljEviOi4l1x/YKiwN2Z3jTmZvRwPeQ0Lzc
         U7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663631; x=1793268431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9UWoPLA5mGfp/Rl3fZwFMEKWrk/1mJkMgqK5rleBeU=;
        b=sP5FoBUkUBp1qocyfrKi4jd5FSkwm9BDsRvBMsPY/jSGMWKrPng17hydziLmiUXQqZ
         XMKs0Cu5UYI3vlsry3Rsp7v4J0Dh7yNdsLyyZJGAX9NxGq70u/4uD/lna+8NHO5NQWzp
         FJED3+4BbLa3XrGOjO2kuezKkQM0FIuJqZxhjCCwW8FNpR0kEky2AfNCzqGCjjDH31Lo
         YsznBuGlG6L8/RXbN/J8VYPw/0ySVcc8ywpICFBbogMrofK5XY4N8DUk9hSOhl4baaxz
         YDUQrAnR8hnz8CCaVtllkhgdzIzfu82nvyVIhWUwdhdIifMO4xR0WK5DN4SOfmMKVQzZ
         sn1g==
X-Gm-Message-State: AFq9FYLyNkdgvFe/mIIv61q391PUhfBIKV+e1+FCcWSIexo7t3W5kpMY
	WizYVZIz5lT9VGWNCRzI+C6D3r51uq71/LdKrpGHICMfWdJ5/8cKvNeOuJ1zSJmtSdxjueSL+s3
	su2UkrmcGTtQER5O9I6iC5fsUxVLt6z+K9ZBCKs64UT3RTGFIk+dDIdxjS1uQ92/yf+rais8=
X-Gm-Gg: AYBFou1zQMyRnpGMOuNs1IAbUQ5FENoV5wSCnyChZ4wRDEp3RYhUZFRpK2e5/ckOVBC
	KYAmYVaK+FP056fHSY3mWGOVSbQPpuiETajz+RpZd67szCPCYBaGQshT2Lj0aol7mUHu/qHvHrR
	ix0ue56q9Y5IjzisjStw4MA0rVSkeRiqHqQVOsXHXsfLvFhog6A3sgPAWvtUzjOvdBuWzY8Uoxj
	MQnMZOnfhYhea1Tp7sBpK85qpBXaysNWRynbOWW7JbTrvOIwR2+K3RVVpVedpYTa8mdshxKPtQw
	wdgfrBO/bljsxzjWPGzSndClRB3zWTD5YhVqieQl+ZajB6TvI5cXWWBGpOumzu90ayNg1uINvtY
	2m2sjJAldnVMLW3naJMeAMgfbErvTEjAM83VpZmVTUhaIJ7yN2Oki068nce9SdGfhSWzQlMnWTs
	uLOrnpbkXrgtHM
X-Received: by 2002:a05:620a:3915:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93f57f3d815mr775208185a.56.1792663631204;
        Thu, 22 Oct 2026 03:07:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3915:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93f57f3d815mr775206085a.56.1792663630729;
        Thu, 22 Oct 2026 03:07:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa12042c3sm983666e87.37.2026.10.22.03.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:07:09 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:07:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <hwzpthdqen2uvwnw6fnrutxjovf4lah4jr3vfjyrojwfhkfv4l@f6hlhnu7a72f>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
 <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
 <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
X-Proofpoint-GUID: PGBnx96bfRLO2PDFp-qsZqZ_s1rCCwuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfXzwD7meoeFdRE
 cQtJifq+4WRp5lZepAGSXeE3zLjKMZ/XIhRBrILQ3fBYjPy46fwufqSFOmwyow67zyslQv17uLq
 8Nwupp7zrQLjfarpeF1CsB0ghc/9g75n0zRaIdwNSTHmKbuT+rf08rSaPBUsDskxotCKnOucICo
 I2FSYehlZY7Y2GwExkp1RbEmbVcurb6En15pCYjVGqD7KgpkBlO0C6jWT2meupRJ22yQfyIEh0k
 D+Rq6rDJ4VrUGLK+tAABoTG2tsWproXMMr+PORQUF2OILByw5uZnih9dDihhZLP//Pjwy3x5jEc
 Ttch+PwIanGzArIcdmg0dpunRbBGiHxI6Blx2Q+6Vh9q4cBx9tNdDK9+7kxikBQq2mapWrnuuOg
 ZN50HCmadWU+EgTfA2xiZ+CrFdBK6NbNnVkrsxHwKiPmMxu2RxD61BKOsTU77hxy3+DkY82Ek38
 gEgm5qZVgoe8UAZdfGg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e053 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pdqsUJ9ZRbmRKYiob1EA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX/DlchPy0z7IP
 HN6LnGtRwc3l+89M5MBVpEJe5mieejyyOZFCQG064xLabZb3HPMFZJ3As33mi4IgYmfWvVYnq5L
 vDOweZbtgHFvr2H1W9w92FvLzmdZivw=
X-Proofpoint-ORIG-GUID: PGBnx96bfRLO2PDFp-qsZqZ_s1rCCwuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040

On Fri, Oct 09, 2026 at 09:40:31PM +0200, Dmitry Baryshkov wrote:
> On Fri, 9 Oct 2026 at 12:41, Vishnu Reddy
> <busanna.reddy@oss.qualcomm.com> wrote:
> >
> >
> > On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
> > > On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
> > >>
> > >> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> > >>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > >>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> > >>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> > >>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> > >>> --
> > >>>
> > >>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> > >>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > >>>
> > >>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
> > >>>
> > >>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
> > >>> ranges directly when there is no backing "reg". Introduce logic to derive
> > >>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> > >>> to be paired with a "reg" property.
> > >>>
> > >>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> > >>>
> > >>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > >>>> index a18bb60f6f3df..9766a6944d0e1 100644
> > >>>> --- a/drivers/iommu/of_iommu.c
> > >>>> +++ b/drivers/iommu/of_iommu.c
> > >>> [ ... ]
> > >>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> > >>>> +{
> > >>> [ ... ]
> > >>>> +  maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> > >>>> +  if (!maps)
> > >>>> +          return;
> > >>>> +
> > >>>> +  end = maps + size / sizeof(__be32);
> > >>>> +
> > >>>> +  while (maps < end) {
> > >>>> +          phys_addr_t iova, iova_end;
> > >>>> +          size_t length;
> > >>>> +
> > >>>> +          maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> > >>> [Severity: Medium]
> > >>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
> > >>> malformed?
> > >>>
> > >>> The loop condition checks `maps < end`, but of_translate_dma_region()
> > >>> implicitly reads `na + ns` cells from the maps array.
> > >>>
> > >>> Does this loop need to ensure there are at least `na + ns` cells remaining
> > >>> before calling the translation function to prevent reading past the buffer?
> > >>>
> > >> This function intention is not to validate the address and size cells here and
> > >> it's not valid to read those properties here. If the out of bound ranges are
> > >> there, then it's part of dtc checks that dt node contains invalid ranges.
> > >>
> > >>> [ ... ]
> > >>>> +  list_for_each_entry_safe(pos, next_range, &ranges, node) {
> > >>>> +          if (pos->start > next) {
> > >>>> +                  region = iommu_alloc_resv_region(next, pos->start - next, prot,
> > >>>> +                                                   IOMMU_RESV_RESERVED, GFP_KERNEL);
> > >>> [Severity: High]
> > >>> Can the length argument overflow on 32-bit systems?
> > >>>
> > >>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> > >>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> > >>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> > >>>
> > >>> Will this truncation result in a reservation of at most 4GB, leaving the
> > >>> IOVA address space above that unprotected?
> > >>>
> > >>> [ ... ]
> > >>>> +  region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> > >>>> +                                   prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> > >>> [Severity: High]
> > >>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> > >>> to its lower 32 bits on 32-bit systems?
> > >>>
> > >>> If the remaining address space exceeds 4GB, this truncation could leave high
> > >>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> > >>> IOVAs.
> > >>>
> > >> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
> > >> set the dma_limit max range in that case.
> > > As this is generic code, could you please adapt the code to work
> > > correctly on LPAE systems?
> >
> > This is no different than the existing logic where client tries to reserve
> > greater than 32bit length on the 32bit LPAE platforms.
> >
> > I'm not convinced why sashiko claims this is introduced in this patch.
> 
> Because you are adding the line.

So, is there anything to be addressed? If there is an issue in the
current code, please fix it too instead of just pointing to it.

-- 
With best wishes
Dmitry
