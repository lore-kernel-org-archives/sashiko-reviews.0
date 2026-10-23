Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792731617;
	b=QOXDINzN4WtXcUPO1Yb0f0HYXdIUvaDHdc/TANLtmvKP+2SJXyWeqOmWU7RVAUZW5n4K
	 01zpozJxR8Lqnqv79IhufGannP+vM41Z7OtNDAu/gTliFkADYG8ivxzBB7zzVLHPOjUch
	 gT5Vh+KOGYFwnh9WlKtz9QoO++j1YHF2/a3oq7c6fcClu39JxYs5T6Mtbr3w/7MlruIns
	 mcb3oUyOACKESq0OkYhTTlYrz5hL4rvZyfzp25IfukcHxCm4TdUKoHEWC4Uq3jmpFOdck
	 7C8CqIIkjA1imOqHD8o251y6ocYG5FRmezWLLdxVePNWpj63FZqDO0pHtPjZ7OKgkMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792731617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=;
	b=HUyQDCXHMfqSxmBk7MHhZwWhF+jafkHoq6fraTBGcAV9z8MRvI3xv2XfLOLMtpsnMicv
	 Ug4xgZmIHNl+DSHU7Ig/f59vPsPh5EVaOxuE4LW6SuwqXz8vMCsPFK6Wzd4zVcwv47geo
	 zDluHXarkCVt2Dasq9JUNyW2WEWEIi3ZshW+OGGN4ltnf0k/3OY77bj8R3W+rtJJq2CLO
	 UVcM8ev2sDT2TadQzDSfJmVuRZ5wh8vwxkNUSLOp67Xt9lAIekdOiLbuvZJgl5B+kr6GR
	 vM25livn3gjdjy2FgFZcM1yOQY4TQhX8Yy5dxhnXtSo+5AMnCw7wiEPvKDdbimw4ocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqnAFMhU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hq+pkDQl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688A4606A31F
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 05:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688A4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqnAFMhU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hq+pkDQl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1Ev9T772903
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 05:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=; b=ZqnAFMhUL639prXJ
	AFUyRo9A/qnlUDIDdc08gL49dCT8mQKZcFF4+7obha0FpLFJGxvtsWd0R4zwcar2
	fEehpoDRx72Vygo9WrOCWnmMnZc/L68MdvBYAkPE8xU0oMPMuYiez32A6LQD+6pz
	Vvrndou9C1TryOoisaQTSDz4iULwfgLZthWLLLyfhirvl4+uWrWCtlUg9RFyqshb
	MkfrouU7NjICttP/4uSKwDbUY9SL7Cl+TpFlzwiFbfHnaYqX1XXSZH+c5Weg7tGx
	vjag/yw6Yaf3dPk5KoaBvxn1vFyIzGDp6+U9YCK5P0kjkp/3i043AryiTlzWHma9
	TvhxqQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtsxms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 05:00:16 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-18eb2616974so1646389c88.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 22:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792731615; x=1793336415; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=;
        b=Hq+pkDQlgkg8ov+vPgniDuy4+34qeq79izD4oY4MGqTPvO46d5qpoa/kElk0k15NSy
         L5/R1mT3OQjFSL5RdRENyGeTMuQt9d+AI80uFyHfY+hRxnumgbuwPdRoVLejJrxaWmzB
         0hD3rJQJBQvGNkra1lAlfPTBsm64/SQLXpc9XgklWrfAaR/u0venV8Zz5umgGnCYbFSn
         5/JxMoSmAI81eTSnx5zs2J9QDo7vDFCu3Hqbd3rKP4dKmhsmnVM4vd5XVdWs7t5B/LJa
         x0LYc73i3sMAt71mzGi/eGDLfKsHRbmy2t6PvJHe4vMeCJ8ECbEE3aWX7VxY970yUX85
         ZNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792731615; x=1793336415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=48o9pIGMif+MOoQsgOXtT6/HKvjb6VduMw+EEFpg0Ss=;
        b=F63kmFccXOCZFMI3Oc5z4NId0Nz7JDs1F8vALjmoXQAUbIpMHhOpb6OzDCc08Rj3eb
         WtpipN2oKFpkQiZLQ1GH2pm/ftsJkWEVIVl4Mfar52KfScuXljbG4ONYFGLJXhdKN9hG
         eZav/8RCK+7Yl8x9AgZSKiw/1FTD70MgvGBVuX9NbFSc0kUsZ8bK+GWqPuf0HtncWKpu
         INRpApzPQd4sJKU2q5c46nnRloBx4izw647pVC1L1cVFQMGkXTqd59iVi5zvqQAqBMMg
         q4rQb9AAQpVgDgXmJCM6gCVziJsMMqfpd1tUQUU697AOtDxjsFsSZC3NH69e8gCouFpx
         yvZw==
X-Gm-Message-State: AFq9FYLfGWR3tKw33VMywUFYCQ6VWHQODJr2m95KcXV+Hjp3gnG4lcEg
	t2yR2/fzzPHfME3VjiAp4dQiUR3lB0Uk9ai3ypTc4xe9ZpxoZfurq5Ce7Baw60XOX0EuNprg+4r
	G/aveuWjlqaengzrX0IT5wFkAU09UyNzrmpi+nN8brmbPzEmcMJOlkZqbx2Y8w2Wd8cN3zlo=
X-Gm-Gg: AYBFou2RdRMTLJHIrRFIRN87KDq3nPcZ4xUzEnQfkSaHkMBsFCTVW/BsJChtUWXj8MX
	+QnoMLYEjpCEryYXO/jH7yzHzVroKHr5V25a9n3ZCOkvw0L2061XB0eKZdII93ScSi3Cfo68asA
	8oQNXoKJ3cINPwWuCDru6LNS5gKJyaCTGMW8wwYCUM5v0yatyvsVoNqH+VTV55ATvClZUiuGyBO
	QNjlFkNCqb9ncZXQM86yGAMcGrTUf8QuSlz08PaElmi1Q1/eqnZQVRASRdTcGjUMjSTc5izo2db
	1AhpOwVypEAK6uK04iyXS4kiB5BsZxF6Th/cUFpjgF8n6UzoYndRcwELam/CSRR/HZ6bvHBqIgt
	kMmD4mCP855Bpqxf8t6so7KBh55qaBncD
X-Received: by 2002:a05:701b:4281:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1959f7008c1mr2088481c88.18.1792731615412;
        Thu, 22 Oct 2026 22:00:15 -0700 (PDT)
X-Received: by 2002:a05:701b:4281:10b0:166:862b:9bcc with SMTP id a92af1059eb24-1959f7008c1mr2088417c88.18.1792731614509;
        Thu, 22 Oct 2026 22:00:14 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm5490322c88.19.2026.10.22.22.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 22:00:13 -0700 (PDT)
Message-ID: <d223ee9f-b262-408a-a201-8b16d310bbe0@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:30:09 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] iommu: of_iommu: Add support for "iommu-ranges"
 on a device node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, media-ci@linuxtv.org, conor+dt@kernel.org,
        robh@kernel.org, devicetree@vger.kernel.org
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-4-0322ca5dc10c@oss.qualcomm.com>
 <20260926064755.4AC931F00893@smtp.kernel.org>
 <326a4e58-7f7e-ebcf-adcc-8c191359fb92@oss.qualcomm.com>
 <nsx2uqk34i6kqpnjpigkutynjth3y2jtpsjtldbtsd6di45owc@vm6u5bv6mzqe>
 <00f80a9b-7d99-3479-c69c-a22abf89cd27@oss.qualcomm.com>
 <CAO9ioeX4gEA2OGokP0sDqHJZ-WpNyhpLqw_ziyrzHu3wn5Ps+Q@mail.gmail.com>
 <hwzpthdqen2uvwnw6fnrutxjovf4lah4jr3vfjyrojwfhkfv4l@f6hlhnu7a72f>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <hwzpthdqen2uvwnw6fnrutxjovf4lah4jr3vfjyrojwfhkfv4l@f6hlhnu7a72f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adae9e0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=H7Zjl3+OYEgA4r5vDjEDjA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NO2DZg4SmkS95zNR1TIA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: APonyVbakb3r24vg-ffrXw65k6OSwPSL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxOSBTYWx0ZWRfXyHuThpOuyEFf
 jss9mJrJTs/mvqr9mt1Y3IbR7bT1gOT2zqt76Ls2etU1Csi2i5Qxl/7FOmLqGIZClVbiISPNduM
 egVUPz35f2dA15rblN8c89QpblvGQgBUgY/pkzsM+EGzakslfFNHei3E9Ck4zYbmEE2IoxzHtCY
 IJhmh/EQ7/2kkSFSlIvuSx9dW9p9djSIwvOmZ68CnIAq4F7TCIJZyakgpb9S7N0eIEt2gAgIbZ8
 vsQWCoyifAN4o9TApNFGY3MlWwZusNvnjgZr8xlypNjXPaAjnhdzB9wQBs9Kw659tL27N+0HGnD
 LmGjDs9DXq5OQwoCwqpOUIXPL3E482vhXJmFSgIiYVxXBKmFdMv1EBfiUGfrcF8XtbxnTNFUOdk
 ODdYJrB35giPuUDH4W3tB5pW5CBjJqbKkZX15mkc0THAlBbYoALhfg6+kuCokVCOx6oyQGVrJal
 +JHYtpL+V+sddQ6BdEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxOSBTYWx0ZWRfXwQu6jXsdjNy9
 nG+G4AvSoXShN5Bi9F+MwAhaWjW6Nete7KBiqUwzIgTpRXCrM/r12ALqJjWn51ezzbN39M/rhJs
 YWxBqF+gS3MhW2v2QtEszIJ6l51ynTM=
X-Proofpoint-ORIG-GUID: APonyVbakb3r24vg-ffrXw65k6OSwPSL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230019


On 10/22/2026 3:37 PM, Dmitry Baryshkov wrote:
> On Fri, Oct 09, 2026 at 09:40:31PM +0200, Dmitry Baryshkov wrote:
>> On Fri, 9 Oct 2026 at 12:41, Vishnu Reddy
>> <busanna.reddy@oss.qualcomm.com> wrote:
>>>
>>>
>>> On 10/8/2026 3:30 PM, Dmitry Baryshkov wrote:
>>>> On Sat, Sep 26, 2026 at 01:23:06PM +0530, Vishnu Reddy wrote:
>>>>>
>>>>> On 9/26/2026 12:17 PM, sashiko-bot@kernel.org wrote:
>>>>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>>>>> - [High] iommu: size_t truncation of derived reserved region length on 32-bit systems
>>>>>> - [Medium] iommu: DT ABI breakage by rejecting iommu-addresses without reg
>>>>>> - [Medium] iommu: OOB read in of_iommu_derive_resv_regions when parsing malformed iommu-ranges
>>>>>> --
>>>>>>
>>>>>> commit 08a09989ffefcbf5d38171159dcc911ca993ff18
>>>>>> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>>>>>>
>>>>>> iommu: of_iommu: Add support for "iommu-ranges" on a device node
>>>>>>
>>>>>> Add support for "iommu-ranges" on device nodes to specify usable IOVA
>>>>>> ranges directly when there is no backing "reg". Introduce logic to derive
>>>>>> reserved regions outside of "iommu-ranges" and restrict "iommu-addresses"
>>>>>> to be paired with a "reg" property.
>>>>>>
>>>>>> Link: https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
>>>>>>
>>>>>>> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
>>>>>>> index a18bb60f6f3df..9766a6944d0e1 100644
>>>>>>> --- a/drivers/iommu/of_iommu.c
>>>>>>> +++ b/drivers/iommu/of_iommu.c
>>>>>> [ ... ]
>>>>>>> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
>>>>>>> +{
>>>>>> [ ... ]
>>>>>>> +  maps = of_get_property(dev->of_node, "iommu-ranges", &size);
>>>>>>> +  if (!maps)
>>>>>>> +          return;
>>>>>>> +
>>>>>>> +  end = maps + size / sizeof(__be32);
>>>>>>> +
>>>>>>> +  while (maps < end) {
>>>>>>> +          phys_addr_t iova, iova_end;
>>>>>>> +          size_t length;
>>>>>>> +
>>>>>>> +          maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
>>>>>> [Severity: Medium]
>>>>>> Could this result in an out-of-bounds read if the "iommu-ranges" property is
>>>>>> malformed?
>>>>>>
>>>>>> The loop condition checks `maps < end`, but of_translate_dma_region()
>>>>>> implicitly reads `na + ns` cells from the maps array.
>>>>>>
>>>>>> Does this loop need to ensure there are at least `na + ns` cells remaining
>>>>>> before calling the translation function to prevent reading past the buffer?
>>>>>>
>>>>> This function intention is not to validate the address and size cells here and
>>>>> it's not valid to read those properties here. If the out of bound ranges are
>>>>> there, then it's part of dtc checks that dt node contains invalid ranges.
>>>>>
>>>>>> [ ... ]
>>>>>>> +  list_for_each_entry_safe(pos, next_range, &ranges, node) {
>>>>>>> +          if (pos->start > next) {
>>>>>>> +                  region = iommu_alloc_resv_region(next, pos->start - next, prot,
>>>>>>> +                                                   IOMMU_RESV_RESERVED, GFP_KERNEL);
>>>>>> [Severity: High]
>>>>>> Can the length argument overflow on 32-bit systems?
>>>>>>
>>>>>> On 32-bit systems with 64-bit physical addresses (like ARM LPAE), address
>>>>>> differences can easily exceed 4GB. Because iommu_alloc_resv_region() takes
>>>>>> a 32-bit size_t length, passing a 64-bit gap size causes it to truncate.
>>>>>>
>>>>>> Will this truncation result in a reservation of at most 4GB, leaving the
>>>>>> IOVA address space above that unprotected?
>>>>>>
>>>>>> [ ... ]
>>>>>>> +  region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next + 1,
>>>>>>> +                                   prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
>>>>>> [Severity: High]
>>>>>> Similarly, can passing `PHYS_ADDR_MAX - next + 1` here truncate the length
>>>>>> to its lower 32 bits on 32-bit systems?
>>>>>>
>>>>>> If the remaining address space exceeds 4GB, this truncation could leave high
>>>>>> IOVA addresses unprotected, allowing the IOMMU allocator to hand out reserved
>>>>>> IOVAs.
>>>>>>
>>>>> size_t can hold up to 32 bit range in LPAE platforms. The relevant driver has to
>>>>> set the dma_limit max range in that case.
>>>> As this is generic code, could you please adapt the code to work
>>>> correctly on LPAE systems?
>>>
>>> This is no different than the existing logic where client tries to reserve
>>> greater than 32bit length on the 32bit LPAE platforms.
>>>
>>> I'm not convinced why sashiko claims this is introduced in this patch.
>>
>> Because you are adding the line.
> 
> So, is there anything to be addressed? If there is an issue in the
> current code, please fix it too instead of just pointing to it.
> 

Yes, its an issue with the existing api "iommu_alloc_resv_region", so 
moving it, does not make it a new issue. Nevertheless, i plan to fix it.

I was looking for review comments from maintainer of this module, it 
would have been nice to get their comment/suggestion to move forward in 
this patch.

Regards,
Vikash

