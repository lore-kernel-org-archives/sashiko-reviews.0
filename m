Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD2835836A
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897130; cv=none; b=gxCVBO+mldtGHTLD1Dyj79rXMpc8gTWrZbnxC2CHdZXr6hBzAkoNU/O1Ofo+cPjOE8fC/y9S8RhkVh6vT/lzq8JgTjyKTwgazS9yNX2z/f2Nqz+EIMYKRm2TpJYfiDY0BhJ88v+V2TTbQijgrd1J5urwpIYqby8eGB31oazCmXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897130; c=relaxed/simple;
	bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BWqY9TorgoRdyk47bKjbUuZuk8OLCAt/6IZHRrBAJygy+FQFSb0L5Q4u72TOVXesLrplpCtOJ9nppGDMrlpX0Wj4vPJQT4GI25wltUEXdkS2RXXqlcphmwEacaVnct0HiTfguGmkdX7GhPRkjCJWAGF8EdKKhWx+tGIROolaJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pku7S1tl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IaLj5df2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pku7S1tl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IaLj5df2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580G8Yk2024477
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=; b=pku7S1tl0aKtOZLO
	sTCvvATJkYW0dP4lXtEBoX6RmnnJ2pq8944hkv5qfUua6izek2zHLLlfFspqm5c3
	GdaXiVGSkn4k/XoyX3hPj5ayrTxRxqd0tFWUsD/tWSvxhOz2PeyVttRHiC4pG3ab
	08sjmInFkmd0B1DNpaZuKanaGf7xw+b+XowmBlEICYAe/ET00LEKzcfMc/tf5EHm
	MNaT0N806pkw2Re/MrdAvlBiXRrVF1UA91k+hp14JBUCBO1IQBXDjOXEc8iaMHmG
	rWSmUxAO0NAdK0TZv+wrN17DHwgpdsL0GN5m5YWq8gCevZizLGJNS3pnKBcO9sro
	AIiJFQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmre2a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:38:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422ca754d8so2613334b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897127; x=1781501927; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
        b=IaLj5df2Vj041pXc0ccdSrXU1SkGHMjL9qziY5ricFDFbiFJMzwJoWJIr9WOZjesbq
         sFU0mmermyidI/AuuCkxSrQSPgM50xoUi0IOP7FGp9marwqs6G8Jh7j+XHef4So3arP+
         HraslZ2UdoAtlWR2Zof5BkMb17GU4SSQy9HUMbAuwYqqRt6gU3o0YOEr7h25ze8lr+Yx
         04s/i85D5PctjO88M1i0HcoKUgJgAXBZpZNelF+mkI0kVT2iFhgD6d4UEqTZ11JXqXGh
         UE9sZcZ8l7PkLP4YjQQ/CgR9D+hQx7EFx1rEWTUe6TOeh7LcWbLdOkAVMY0RajW6fnkh
         4qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897127; x=1781501927;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjBsa2MHVLkDXb2CoxVBdEaMLVAQILsXguHOSK1uoJM=;
        b=i63XDmyVs2IRCqr9C8pOK4rR9hDHE6HWQgf3OwBs9Z2WIxCIW8fpKrTpDYdLuyRFA+
         MJRNd1nNNMv6kpyRiWuwc7O/hSdRch47US3yrV//IhMT57iM1L/61W9kpkcw87K7PR2H
         lvMcZMNt0Yarcv14Hcyu7GTFPMev1pInSIEp81suNRh6ul/7tTVKpUFGZ8m9Zkl4Iv+X
         lRqT2D1OINsZ51hz7hax6oOZgyi0e4AeEAwAwSSiapT2Y9zrjEUOL6OSgDit+sajvfUH
         pcQZEVCOMOLS+4n7uRSuayoPoBfw8NDgTlmOQAc6Eq8mAQCyzhGVgYQk7Ll+SOEaG6Z2
         Bs8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+RC20FyNDxnZwoInCRTmQaKWfCT0aj2l+nZKNRkoIRa4lMba1Rm1DqX7iXTgQKPKSsg/9lVrIJggMtL+1Fta8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7NI7U+1CqTLd5tXbnd4o0QsXhtUAw6DcRz5dqHrSbJ35ykaIX
	vLzk3aVarTgmYhnz5md/XR5XCwUdygr1t55s3LHRvKfKbXXKuo9k9vPVGgGx2kZ6eKo1XDhzeQx
	YvHkPM9rCs1qVWU81/muDaGNO+nI2+nD5vXk9WTL86cgHEVrk2PvsCfqs12U2wVL/iaovunM=
X-Gm-Gg: Acq92OEPdb9F4ZrpMUVMKrIRS5LwCdOb4AnNoKsibsPYPmBRXHKTcdJ6m2OGwnS9/72
	5N9A5RCu8jeW8ez5kjEwwcfkhlHzjJdSbNXxfmh9eCtiPBvIDI+XTJUQtir6GAJL/rSvPzntMO8
	skdusrPQ1O+NQDQaHEN04Tw4OOyJDr4+xPw5DO8Z3IkLPEoKzpxCzawe1mgh1Ih6TLfdTfsnmlw
	dVJF/eRKbhSuq9bzoBkeYxnIA57V6YZTQNOOGxX5xEiE9/Vuo4/tOmC1beaewGljoc705krn7dI
	ILxrsmvT8gtKLJoWeApSsdIUDpC87qGU3uPnQqVQ4Zaiz7i6983Fq7J4xALjA8Nj4TyNNcHVWd8
	mNAekEAZUScVgtN9lUGwBXSQw6yXWAtfIPO4XRBuwbcmTUhTWh0b9QSbr9Uf0QB3g
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr14472656b3a.4.1780897127152;
        Sun, 07 Jun 2026 22:38:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:1804:b0:842:7992:bdd3 with SMTP id d2e1a72fcca58-842b0ead88bmr14472632b3a.4.1780897126766;
        Sun, 07 Jun 2026 22:38:46 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm18557943b3a.2.2026.06.07.22.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:46 -0700 (PDT)
Message-ID: <d35a0160-c0a0-155c-8f0e-65b1b7eedf5b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:42 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
Content-Language: en-US
In-Reply-To: <4itwv5frj6gqfib4bzbie5o4zs3oea65vi4hosyaeitdagqdek@4be2jvik7csd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX84q5fmYI5sm/
 bv2LB0lVl+As6PGzpLlkR3YSnSBLuAzkDC0Z2BFcr3yYpR7Ik2mMEpzxlt0ymUCkzRternOjEEF
 5MxuXh/c5T6q0J6iR71ZVV17CQw/BJoLJtw2ozYTIGcoXFciRnVdjeyBJYEzhVoeY1xPCgO9OEy
 JL4wTcVe+xkITEGjpemcxzpPcy/cForT9Cx9HGgwvNQP+5JA6IRbq0qR5EHFZXYhMiRybYafIC0
 oYGhpM6v4niJ/YA3LlDcSpm+AsjF4F/OnaVHL1GkBEFLPFvkpAdw5s1E8FPfdj/eMP2dd4xtsos
 fqr9FmGBfYEPv8r0Ovu0Z/D6P0+GetbmHYgAvlDl9RXqF5nxY36lXuvvUPWo9/W2wN9zAIvOzPt
 lF5kBPag0N79HmFqTwWyHrgI8TMicC5EGSkhTaCTB0H9+StU2cQ7O5aNh0lUWvUGjbYaZqC73kF
 SBmF3twL/rFzZOo4m5g==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a265568 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=s3xQa8otug5672-2qowA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: aLDXeovoSOcHMdlzshDmAHDvbZUfCm4f
X-Proofpoint-ORIG-GUID: aLDXeovoSOcHMdlzshDmAHDvbZUfCm4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/8/2026 3:09 AM, Dmitry Baryshkov wrote:
> On Wed, Jun 03, 2026 at 02:39:22PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
>> - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
>> - [High] PAS metadata memory is permanently leaked upon every firmware load.
>> - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
> Hmm, please check Sashiko comments.
>

Ack

