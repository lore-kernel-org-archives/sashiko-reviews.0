Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0AF47CC73
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 10:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453657; cv=none; b=D3Xq9C/QmU9pZIcPovlYAJhrs7opTpWHh0i1M13RIU6AoZDGYjh+bMeVHdxAkat6dwYCsy7JFQmmLmQjIdBKDW3z49UWTpdryLwpNx78x3TjQe52gqOSYy3piDqmOVMegfDSkqu4nlB6T12Z8eBVGzGQVDSOZeDaeErvp+PrTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453657; c=relaxed/simple;
	bh=68v7JkuVF9EasqnjwcfgrZ7rtPEnLgqS8iLLehKvExU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eU15xUFLHzZTe/VPIuUrlTi2+7LRtmpd1WexGry8Ft8pFTnnd+9dI/Y2ohjCZ2xRQh9+EM2ia0Sf7A6zA1qlgK8bH6jI35FFvx5Iw+UTjuYb3QL0nUdqBNHCxnlJRNfZOCv9Bng52MFenHXBiF4VBCQEFWjsfbMhXBj7+w3W8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgQ04RsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfxlM1RU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgQ04RsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfxlM1RU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KOlF1846063
	for <sashiko-reviews@lists.linux.dev>; Thu, 8 Oct 2026 10:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iMkztyo7nvb/xoDfxhgtl43w
	j3/XBVuU45aiCGLTELk=; b=XgQ04RsBxA6HDOyZJydlLbNraDprtaJE4e6Ofonz
	JMswzGb/wNu5bnVCaZpCrWEIelhsFwJ7dVIlZ+3YcM4DAiJG8C5KIB5Qv14MpcAd
	3QNSUi+D8tqWT+ljFq5G3KoDuCsUALJpke2EDCC/oJw/72FP8Wb++NUHBoFR6hTs
	iXDCXQZmhFiFWK/4hLAly8HYLCZwHc/3p0+exu1nDgp5xVwu0/eQfVVq/JlshVRc
	YzCJxybydn1flXktXI5Sknl+7KhBCNiDN7lnC9jXvWjRs6mif/05ECkY7yEMDuuW
	mzxol2iWvwZr/y2EIZ8nsRO7lX8kCFP0HDCy2c9xHl979w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3je7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 10:00:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46b4b700so862507185a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 03:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791453654; x=1792058454; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iMkztyo7nvb/xoDfxhgtl43wj3/XBVuU45aiCGLTELk=;
        b=gfxlM1RUn/k+UaN73QtP4Z75b3tRJd04gKQ/fKOa0niMH9/Ex7aUbFlsimHsbT9sPh
         BiqXII7Ck3z9CS2B0PnY+bnK+cZYV2fKPmRf4OVo3BUh7rdOMm3zAJcaaLlJU7mXnjtP
         fxz8Tdo08/HsI3fAv6LAdHwvkifXe9cqaPpV+iDhqfgl4iztiB5ePEM8ykkw9a9n5UCF
         1l6v7UaZG2T9vx1QzZ7Umw9GUhIv63oWXMVyXtvWH9g6HLM5nTgMsi/hiSGTjOXR0VSc
         bFMKgW/615iLYwCMxOeM3zHIPF1HTMnjk7lDadmXfZOrQIqstprvRiQF+exPG+cZPkm6
         1gyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453654; x=1792058454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iMkztyo7nvb/xoDfxhgtl43wj3/XBVuU45aiCGLTELk=;
        b=fkMIcG4haL2IIJW48gPmBQ1P0IOonVfHGRRbm1ZVpjEi3hOxa0K29PbhSLrfZr13SF
         lGNqb52ZPWy7sddMHsUGkJHhxLJ8q82ku8+QPHD/x57V06uMGuaTHs8PezcNJbVK9W48
         b46Uks6YrtxtBl2dQSlY1UGa9Y/5UjkJKOAucHgISyQRv++NaMptRzgf2iMFB+fi36Qb
         hxZWRf31R3QrhkMjPvbV8BeSi/iru/MYYFSbbRg7oQl4Dz0px+kOu1R/ht5sfbFRUT3c
         0buXq5vKKdurorB0yWnK7WjOFRJ3vHVGsz2q4w0LDfdncEQaoEGlLlxWkE/rcT8A5TV+
         ml3w==
X-Gm-Message-State: AFuF++njBJeoAZ5nWLNSiod0Jji/zwfWdqKePOiS57BwN6nbL5GNPgpH
	kAWL+3nH9ZXRT5Q9D3NIZH5FHUrPt9owfSwdVCAGZJn3WOt+/XK4C+Z+wLM9JpL6vTurR/7+pkx
	SmqDMKBFa/ojzAgwWovx067D0ucZmut2r304mGvdQqDfnp4eyZW2eoXo92ZRjpDBTu9D8dhk=
X-Gm-Gg: AYBFou2xgyacGsDQG4TJBa3tszTZbJ20S1b7uTjLH9DataMLCSkqPYQ3GLh0/TzK/Ei
	JvqAMgdpQ9TOnDxSulOdESx45B7uCUrfQMXfHqWixwKcCHkNE9kVxqCHmBv3zKsmUmUeOj08+Co
	M3C9Cn67Zldl19Y98s37P4LVrNkrhITx8vk+MY6q0Gu4837fcCF2GrQbFO9+71i32kd9FF3t20T
	BQAq3qmTsPVqpUd3qvn3JHuhS58mwAQlaIajEWSj7ODAsJvNzJInoqRQkymJTcASHt8CzH+PISt
	NjHXOMz8HA3W9atjkgrEHljpe0rrXMJKPrfkEl0ezqgquqEA/sfJo1AWDL9MFx523mOFYPUgDsn
	9BAlssdHpVYIQxZIe3gVG7F6N9slCcfuJ+lCpkq7Z0NpqIFmHpj4RUJkd6h2s6K1DbCNgM4NpIT
	6y26sCI/lnmbkK
X-Received: by 2002:a05:620a:8388:b0:93e:9809:8386 with SMTP id af79cd13be357-93e9b882f72mr862033485a.70.1791453653582;
        Thu, 08 Oct 2026 03:00:53 -0700 (PDT)
X-Received: by 2002:a05:620a:8388:b0:93e:9809:8386 with SMTP id af79cd13be357-93e9b882f72mr862027885a.70.1791453652950;
        Thu, 08 Oct 2026 03:00:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9ba79b6fbsm1820271fa.4.2026.10.08.03.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:00:51 -0700 (PDT)
Date: Thu, 8 Oct 2026 13:00:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>, media-ci@linuxtv.org,
        conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
Message-ID: <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX4vKt0LWXNro0
 qzkTfxetl8vydTONN62tmFg1lKDj65AGGSJA/wE7utgzGfoneIIQ3UaYQQS7iEXI1FK6tHhmch8
 ZwXF3YYAQuXR+Oj8x3UeEMnhmPnJ6ZQ=
X-Proofpoint-ORIG-GUID: 3TpG2qZdbVjxD79IhmSbJRXR_Aa80y73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzOSBTYWx0ZWRfX/dKV3HHhwBJZ
 GG7F8oCYP5TEluC96e5lyLijb818HHN5BPqGFtugTchxHmjhFJ8Ron5VXMGAB7KHQ4vTltv+dAg
 vkFhpy0O0gy67Ftc/KtG6HmsNqnP6iLf84h8gwFis7m6OU4kZFaoHNclxHQhFsOlCNcXXZrfDu5
 CQzRqaLlElCyJkxWfw3IwD6KTUdiXMgytVnkxnVFeh90l04+lRUew1VOXX8tRQGfs45sDut8SBX
 qyeyp4gyxTCDUBLKhzqa32wJzvXMilK8j7aQwgtp42Wis318oy8Uc24xARXAnGVtR/oT92fJT25
 kuMBeXTPh8FP70x+WEB+i09awQDRjdAr12alK3QMWE+PFjO4o1OLhtRbBMgAtjpDHTYPMouofRi
 CFbnMd6YwnCMbrf9jeKdWUQPugKak0eU8lloOL++zs+Pp+62HryntZnByknMjbriL+344Fc482M
 WnlQ37l7MSqa+06FwfA==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac769d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aw6cs1SlrqONCjNU-SIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3TpG2qZdbVjxD79IhmSbJRXR_Aa80y73
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080039

On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
> 
> 
> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> > - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
> > - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
> > - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
> > --
> > 
> > commit 08a09989ffefcbf5d38171159dcc911ca993ff18
> > Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > 
> > iommu: of_iommu: Add support for "iommu-ranges" on a device node
> > 
> > Add support for "iommu-ranges" on device nodes to specify usable IOVA
> > ranges directly when there is no backing "reg". Introduce logic to derive
> > reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
> > to be paired with a "reg" property.
> > 
> > Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> > 
> >> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> >> index a18bb60f6f3df..9766a6944d0e1 100644
> >> --- a/drivers/iommu/of_iommu.c
> >> +++ b/drivers/iommu/of_iommu.c
> > [ ... ]
> >> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> >> +{
> > [ ... ]
> >> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> >> +	if (!maps)
> >> +		return;
> >> +
> >> +	end = maps + size / sizeof(__be32);
> >> +
> >> +	while (maps < end) {
> >> +		phys_addr_t iova, iova_end;
> >> +		size_t length;
> >> +
> >> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> > 
> > [Severity: Medium]
> > Could this result in an out-of-bounds read if the "iommu-ranges" property is
> > malformed?
> > 
> > The loop condition checks `maps < end`, but of_translate_dma_region()
> > implicitly reads `na + ns` cells from the maps array.
> > 
> > Does this loop need to ensure there are at least `na + ns` cells remaining
> > before calling the translation function to prevent reading past the buffer?
> > 
> 
> This function intention is not to validate the address and size cells here and
> it's not valid to read those properties here. If the out of bound ranges are
> there, then it's part of dtc checks that dt node contains invalid ranges.
> 
> > [ ... ]
> >> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> >> +		if (pos->start > next) {
> >> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
> >> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> > 
> > [Severity: High]
> > Can the length argument overflow on 32-bit systems?
> > 
> > On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
> > differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
> > a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
> > 
> > Will this truncation result in a reservation of at most 4GB, leaving the
> > IOVA address space above that unprotected?
> > 
> > [ ... ]
> >> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
> >> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> > 
> > [Severity: High]
> > Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
> > to its lower 32 bits on 32-bit systems?
> > 
> > If the remaining address space exceeds 4GB, this truncation could leave high
> > IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
> > IOVAs.
> > 
> 
> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
> set the dma_limit max range in that case.

As this is generic code, could you please adapt the code to work
correctly on LPAE systems?


-- 
With best wishes
Dmitry
