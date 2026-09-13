Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D72238D54
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 19:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326641; cv=none; b=CHoFaZNjpB6n3qVpLDnM81L4Lm5/pP4kG/y6kHqvV42cKKDJNSvJXg3vtGM8CjlPi2W43IFuOZW2ui3MAiN78qH0lSg6ApoI2fcIkI+x1zL/hjrmDkH1MN2jVwBevXWdjpg91IIkyLzaCi+mp8vI+mauht/WjWnI2KPaj5hUhDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326641; c=relaxed/simple;
	bh=e/um0nBEWHtQgflb/WCLsfYzgdoNbeZ5vCSRZNrU/CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XYp7KQkSAzqCRICFpW5C2VxCfvH+wDh3HSG66ioWQXZceGYczhxkDykGlWCZsFbgI2GfxZoie3stlJhZdFqGSH1z0qqH/aY1QHIF2khLXXMvu+Bes0zkKmaR78bV+jQNHcUkjUG0qqZdl0cFL0ZmL4ha0s9Sdpma728OMGOFomU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=enfu/s7m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JV/ia10z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="enfu/s7m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JV/ia10z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2fDw3284776
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 19:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2MyXeXcXwlNzpKjPOfg3/kpeRw+I2xbOQZRZuUgi6N8=; b=enfu/s7mx37joJ3A
	uuVqjRLNK2gz6X90AEI/22t80xPENQe/hfu1PXskmmh0uVc4dWub/F7XeIlaCH8a
	NecfWw13mJI1iK1otlxXOs1xmZBwGctAU21iMfTPFRkMXWGEbTV8LhaQEsYtkZi1
	5I+dysyBPzazMpzSbAAuFw8CoyZCD60XkB8Jt4ayYUv9KXHjPLiGsC+U7WGRfkLe
	HxPvW7dVpz4X+7aiqp+boTlkC55oNe7iZE5A6bsB1FLEqXJC4DVEVk/IlJlkJFEe
	1W91520AWo0ifcUh7YZ+nLeajvacbMlhf1WBGyCRZx8tU0Xi7EnIvxCntithhu+H
	IkCGVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc091-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 19:10:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so58818935ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 12:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789326638; x=1789931438; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MyXeXcXwlNzpKjPOfg3/kpeRw+I2xbOQZRZuUgi6N8=;
        b=JV/ia10zaLcfjl30d7J6ll5I+wwLs62O1Y78esK+s7f6Ofy+CO7WS0gGozEbPKl4Ao
         cVrQ18xgryYWgEmweB9krPoFE1CdW54ZB8qWLN3Ag+dse6/GL3K5Uv5huSu5T7BN0QNV
         BxpYpVtNKNJWUk9H4ia6AejV7Jg3odKxbiMXGw2Mo2U6xXijSt+3VIjQk0VePUfpldXS
         dDHRjkaZ1fEX4TDymyf7ODIxw7l9dDz0B4NHEOyijKXqeymb3tKkf3gCUFvh1kWaoN0y
         iVAoUvzKCKRVWl6NVlHS3LJeuIfrybSdBxaYCVqNxe4cPMrOOCQdV5Vd0sDc23EWRRIc
         97Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326638; x=1789931438;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MyXeXcXwlNzpKjPOfg3/kpeRw+I2xbOQZRZuUgi6N8=;
        b=RfR4FVHSav7YkgXG77e0rorYvoMLhzm4twaibxmeJ9+17aUAdeGScj7eWOcsGhNVhe
         kCjdeoH5oTzneACQpH9kn95S9bORHv4d8Q4YVVtAyjMqXFZbfIlCaTpcTe30wOZ/ileH
         MKi0Ud+jAjRE0wOTz4cTCjTLLkIcPwWrKH13sik/f2vFP7Px5C/X2uA3iuKonmkKJUtL
         6SvJcXqealRHD9tdM9SpQZDHUSK4PZjha4wuErcsdNPnNOzULmb0ti6zVPp353twfVK0
         U6GUNC97YouXB8nPgyM7Qxg8vnC8dGCZWmpQDL3Upg/HPzNuqQG1APc6YLgKWkNjogVo
         RWWg==
X-Gm-Message-State: AFuF++kCH7CNU828f+pmOgpA1uVtF/LjzgTI6e8QAYSd0r1aiY+SSnei
	CeDilEkb8iH+bYu4bLEdmnNTyemi7QVBy6qWq9MSGh3y/Goh+0LFopd22KhjEuW0JlaJ7w6YlLo
	gdwzZuiHGvh5B6M8iu3ZJ5CGyyKbWClhEdvhDjl5VDAEOgDuUaarG1VVIiMzdDzWVoQSD9ZUbUr
	HjLTY=
X-Gm-Gg: AYBFou0TJIW5QrGEhjEGfYK9CquWS5Ud//G0jJbKOXKt9akqnL7/e9ztYmtDl2w0wyL
	fCGIVDlStnyqO/LeNIjdpc4VTf+IlbVQAmptWcn+w1QFjqQ+O5yOfjo4+rcpRADJ1lioKuNnsdN
	KhsjPJH9GoUwpNUOST2eePWci/m+wTCRRjdmcEYCrmIjhKaRCSSCgvUOWTjf5saOYmDs4rgkVvC
	lM+tDthstfM40rCqg1+Ssaa5zt/edUVfBAaqWP8XUV8By/Csgs9QWr50/cZ80HeoT2LDQAWaZtf
	fGSiM0rl5tm/dtxQvrP43BJ0qpzShKZB3BJeijGyB1iUI+BJuL3M1pkUYZ3xIquKx1G2Dkwpz2J
	k2hqvtIO4qxMNW0Am4kF1LQ68qcq0XzIOGrk=
X-Received: by 2002:a17:903:298d:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2dd2a1c3f97mr267449045ad.4.1789326637934;
        Sun, 13 Sep 2026 12:10:37 -0700 (PDT)
X-Received: by 2002:a17:903:298d:b0:2d9:383a:30f1 with SMTP id d9443c01a7336-2dd2a1c3f97mr267448575ad.4.1789326637536;
        Sun, 13 Sep 2026 12:10:37 -0700 (PDT)
Received: from [192.168.0.171] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm20870790eec.14.2026.09.13.12.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 12:10:37 -0700 (PDT)
Message-ID: <7f7903ee-b5e7-480f-854f-9ddad67df925@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:40:32 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/13] dt-bindings: media: qcom,sm8550-iris: Add
 context bank subnodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org,
        devicetree@vger.kernel.org
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
 <20260913190351.EA60B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260913190351.EA60B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI3MiBTYWx0ZWRfX4r53CukOf+kG
 2wOYskI470lKIaPYDBLItwx+MbBnSe8SplI1BjkAD4GSXGXkM2cg2Ct6JkBmoMEULJpX+FtV3NB
 s6fXpGGfF2o3/LseDzp6TebUuByacjY=
X-Proofpoint-GUID: 4LgofR2i54RC3TxLqwxuz9GhSzhuRUjN
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa6f52e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mEm1zWZ0Lfbfyr1BzAIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4LgofR2i54RC3TxLqwxuz9GhSzhuRUjN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI3MiBTYWx0ZWRfX8wyd/Bf8JKSa
 1U6I1MpU4uZQLMiCzsY4qmRlOesLr30F0uDJmdLbbnDPdLvs8+IAi3+3UI3uAd2IqORxK3A5lel
 pd+Kd77ZLKmnd499kvz5zYWBLh5KhOENCxR7mrl6cn/UuN2V2hfvYRT9vwpBy8wFMNMmYkzPby3
 d1052CMqdPzhnYWasOgjgEJPJxNYhoVsSa0M4swUwcAwl9wxdwBgGawYh1ltMSxJbHD1bY7K9eY
 2SQfrooNphHrQ3Ofkbny91yG/ZhPLm6RspRlCpfx9yhAuViEF2K9T2+rYWyPyX/XP+Sk291aBGF
 hHLePVawNtwOr0dkVg4SlnQAlHACdKgZisKpQjy297X0qPvIgB/BIEj/fTfF0zkMP256mO4gdRR
 KpEXU6YBIUtbBG3UhrdYKWpoiVP3ZNNEFqmfJ+XQiet7nkAzNlGF5HlQtnAFVpK2WJ7UL2ZGUzB
 nwj48ricb1OnbJVHOCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130272


On 9/14/2026 12:33 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing subnode updates for the Milos Iris VPU enforce a DoS-vulnerable SMMU configuration.
> --
> 
> commit 63b882fd7198eab0ac9d5c0a3932a253f2082c86
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> dt-bindings: media: qcom,sm8550-iris: Add context bank subnodes
> 
> This commit updates the sm8550-iris device tree binding to move SMMU stream
> definitions into separate context bank subnodes. This addresses an issue where
> placing all streams in a single top-level iommus property failed to prevent
> non-pixel buffers from landing in the restricted low 600MB of IOVA space,
> which caused unhandled SMMU page faults and system reboots.
> 
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index 0400ca1bff05d..6ee9d23554cff 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -98,10 +98,10 @@ required:
>>     - interconnect-names
>>     - resets
>>     - reset-names
>> -  - iommus
> 
> [Severity: High]
> This is a pre-existing issue, but does the qcom,milos-iris.yaml binding
> also need to be updated to support this fix?
> 
> Currently, qcom,milos-iris.yaml still mandates a top-level iommus property
> under the required block:
> 
> Documentation/devicetree/bindings/media/qcom,milos-iris.yaml:
> required:
>    - compatible
> ...
>    - iommus
> 
> Device trees for Milos cannot adopt the subnode fix without failing schema
> validation. This forces the DoS-vulnerable monolithic SMMU configuration
> where unprivileged userspace or remote video playback can trigger VPU
> processing and DMA allocations below 600MB, resulting in SMMU page faults
> and spontaneous reboots.

This is handled with the fix

https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-1-5005a1154408@oss.qualcomm.com/

Regards,
Vikash

> 
> The SM8750 VPU update was successfully resolved in follow-up commit
> "dt-bindings: media: qcom,sm8750-iris: Add context bank subnodes", but
> Milos appears to remain unaddressed.
> 
> Should qcom,milos-iris.yaml be updated to remove the top-level iommus
> requirement similarly to this file?
> 
>>     - dma-coherent
>>   
>>   allOf:
> 
> [ ... ]
> 

