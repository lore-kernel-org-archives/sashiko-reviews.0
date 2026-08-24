Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1988E357CE9
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 05:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787548551; cv=none; b=iLW7FMcAYPAFm4KQg/XGrGMz8IH3fwMWhZxhymcYYsOz9Dea/kxNS6lfb3HcXXrYVFte9hXGbQH7twuh7lKvyRkekuMim2u0ElMC6m2A3oyYwuR6Tv9d75hycYl359R7JPUHscLvtVxwGInALIUz3/F5g/jRqOyZFloEbI4tmgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787548551; c=relaxed/simple;
	bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o/WGP+Z4JEFjBEyXDKbiNNsSn7tuq51JRIGDE1zXcqmWWOMmylTn0Cc535fcTRNs2kZ666b2UvfyIhQNxOYQ1uuy058BRnxPC2IWqyJl38sdyAA8Db5TH8xzJ4BuJkY2Xh3QlU5rNSLKB2D4Uf0lyHAs47kFYqTW8eYjEiJS4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wl/CQ/hB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfipdtXd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wl/CQ/hB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfipdtXd"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0kmEr268148
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 05:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=; b=Wl/CQ/hBP0Fu5lMT
	6lOYYc/hvH/pdwGGzHOMfboWj6m8iXr66weUAyOyXfvPi9PMKda5r2jSAUHkFP+B
	Elnr05wrYa/jdF8Rhg1a9RPCPSMQfq8kpsWuL7RdRh/I+ISfBpOk3K5htaUrPrRd
	xikhRGImY/75uGgf6dqBdERQQiGvbMgnzczwxUvXpUmVXzDGkV2YZBjgUQ/WcI0+
	1FzIlIy/Si7IMhTDtf2U/qR5P4aTsSnbR3m93FAMZWAFh3ayDV4fUsuzLP03MppA
	5v6opmA9kpTdk/nbJBivTDjaCmQeCdV1rPxBZrly9NJauikQAOEZ1WHLVQIYKDHP
	wE7W7g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwd7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 05:15:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so3451372b3a.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 22:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787548548; x=1788153348; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
        b=WfipdtXdNJZYNoxbo516XPTWYAOPMTdsJVR6GwPxRf9SFdYAgyvY+lefN91tAg/OBG
         9MqIolyX7rFNBda24ndI9kW/wX18YrANQFdGt8yGf+AC5qxvXs7viFD/nsnN/vnt6S8R
         dXqdAF75XMVPUBJbgrDY+9xceD6CUbY+qbkVKmdzTvBw+gnK2zv1ms2A4399MKDNM79U
         A9QTA8/mIceaDe/98c3RyBg1+9p5XRk+CM7NN95SpXavorWuwK9BG6vfK/nKWyxqrAcM
         S3s4KsN/Kt66WlrzJcEdtFjwQyvYJ6Yn1aEcQZnduMsz6GCkLDVKgoi+O75Vsl+Bqthp
         6XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787548548; x=1788153348;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX+8439tLZFfTCEJmmZz622pCmOTCjFhMJed5gIjWjA=;
        b=K/1Vljvo3aE7C1Y3U5MPBYcagTWcJHxdYW1bxdzkiaJMMzwT0CcmPCZv2Th1eKWde+
         o/8qzvhcm/GDgjL0N9zbmATkum9X98GDNHUz2L7eEtFFSe253wRozw3A9ZuNvEH4/S7X
         I3P0q/M3D4Fi6KEZfucKIzQYUqmybGwdLJR/edKaqImrunmmZP7MQlmsibmJMHXrbK2P
         +divqurIL8r0p27GMXdwvspIxeTwq3XLdP/U7RGAg28owC1Jm+HJj8Tq4hMwl//azoWz
         r7q2Xym3lX11bQS8rIrvH3WKEvNWGoWJ+S4g2jJdYKLJkxeOwT2WyhLaaB6BLPC3AbbD
         1Nnw==
X-Forwarded-Encrypted: i=1; AHgh+RoqAIePuJ6VpA9CnBZun4Y/2S4aAFOkke9Ba6oHSDSpfC6cNEEhFo7Uiz9CDhv4cNCPH9qoqZ50Ols9d8m52dA=@lists.linux.dev
X-Gm-Message-State: AFuF++lTQOgRKIeC8VmZbgMQPwJbH/TcWFfGWFCb+tOkT6QxqawHV7h6
	ooWHxezSCmkgxYAXGmlxaODtob3qgAeq9VqbVIXcGZLud/xT8R43TZbu+sv1i3m5RHb9w8eaJKS
	6BcTq93IgJY68td556WZbYwIdqqtvR7DaRgUyJnCBbbyLfBS84leDbsBOA/w9BiHmzxg8icw=
X-Gm-Gg: AR+sD13K2aQN4vwjbZQic4dX7MZLTKTCngl8ZdCd4jOKsnocs+CowUIaaGmO0pMap3O
	RKbrtV/DEUHuLDZrH0vgPCsc3EFgrVLQxA8s+VUYR/4wIY8/6uXKaKiy/nvNAl6tEAYpjvVIN5G
	L8XnuwaMf71lZRmWkoZhnaven7xxvBwx1KtjjB8AcF0Xwf815ClRThZdTURr6XyiVXQz4+kmBF7
	6f0FZA7qqWUe5OLwuCR4BxgGOV+D+lb2ULT9iYP3+LgXQoqsOvDDCAUOOWVfVf4+Fw3CL+x+deK
	0cmI89jNOfAMPbBPxj+lz+gJ2N6fN9Pgu6es3ukP4F9RWFN7mgoNScdr2V0BCvfsgDpNJ3mb6og
	BJ0tvI/kvyfXaLDALYZIfEcwiwQEKmv+J
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr14316445637.4.1787548547887;
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
X-Received: by 2002:a05:6300:278a:20b0:3cd:51ff:1b14 with SMTP id adf61e73a8af0-3cd51ff1dd5mr14316404637.4.1787548547495;
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d37d9sm23580957eec.14.2026.08.23.22.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:15:47 -0700 (PDT)
Message-ID: <e917c8e9-0fd6-d61b-a2bc-0d81adbe464a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:45:42 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] media: iris: Add dma sync calls for input and
 output buffers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev, linux-arm-msm@vger.kernel.org
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org,
        robh@kernel.org
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
 <20260818-iris-fixes-dma-pseq-fint-v2-1-8dc8c4b3880e@oss.qualcomm.com>
 <20260818160351.4E8F51F000E9@smtp.kernel.org>
 <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <4rk2qpalwmwtzcmmn6leezboybfgp7buuevap7pclcbf2f5mfz@zvadm7y5e7uv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p5Q4ipOKC29d3yB7c9a8qx8NrTa6NebH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfX3J7KGL8LVjFX
 cWG/LQx3CoYXT1c1t+fNfgpFb8u0kWUthJh2oJrCt4MQpCXwXimJTZTmT8syXwwC//llT648neT
 yVf4NN7s1urRHZoqRaXMY1xt294IoXP9lDWhXTTdhcnCb8qT/jlcx/coKkrgkEDseY9EcuY9tKG
 HHEZUIc3GHakmK9f5lWKd2aKX6UYIZO7Aue3bLJpu/c8PIKpfKQfyvzye9Ju3MNrHZX3qjyj88l
 UNOBokOjyQiAxbt4GB2Pgb38mnET3ZGoE0LCusmp+nC9LrkQd3nlxdzxbEaVdE+wwoKHP1miqPJ
 HYjZjoiloFQFmTjtLhecQJXS7TY93HAX7n9Z5Iqq4RsxSXknLPqA5H6vH5+DDCIkOMOft7CunlM
 rSCcddsB311nAzUMKCSV4JcymiWphkCvyhM9FDCXUtqev3YAIO7ag7qi2Oe1fLkBqoVAfC/uofx
 57OiasrPpE7htDtle2A==
X-Proofpoint-GUID: p5Q4ipOKC29d3yB7c9a8qx8NrTa6NebH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NCBTYWx0ZWRfXyVSPMclOuTnC
 MzE4EVUB4uabZjtHb32yjFcxMQZQOqebfI6nQVNSnoL+wtUOe8k1WZWURf5azVQaHunpCILkry+
 jgiX+k9le8dMBtyDlJbYEfZRSLXdimc=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8bd384 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=vvLq9R5Q7EL3J8ZDTOcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240044


On 8/19/2026 4:17 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 18, 2026 at 04:03:50PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [Critical] Calling `dma_sync_single_*` on an IOVA managed by videobuf2-dma-contig violates the DMA API and can cause severe memory corruption for non-contiguous DMA-BUF imports.
>> - [High] The DMA synchronization logic for output buffers is fundamentally broken: it synchronizes the CPU cache before the hardware writes, uses the wrong API direction, specifies a zero size, and omits the necessary sync upon completion.
>> --
>>
> Please respond to Sashiko comments. Also, this PR is missing
> corresponding change for the venus driver.

I will check sashiko comments and fix in next revision if those are genuine
issues and add this change into venus driver also if applicable.

>
