Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF519471439
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787078; cv=none; b=O5GcX/rw7PWW/XxNTfOYPaUUVA6kS5BbZg+QrJy3MFhbe7W5Ca+jj3F0V0mPXCuRWiYwQAI0L1veAYi1x3X5zc6ZGy4/cy2IA53nQ2CntnIYIWSsrLVPS+J84J2jHbYPe7fjkXH//QZgLCY78ErVdQDvKiuWDG0g+FrtiRjGngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787078; c=relaxed/simple;
	bh=LsKPSrSI05tc4shyDaPm9jPnbdrxcAeeHs5aSIQxobQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U0WyDtbFJ2p+ktmwbm+aWkd4y7D1wR6T2xamB60n4FnnmZWG8uGUedFmXl/rGdAQldK2k2se8AeMlSVxsGVXfYxzqyu3Te6cP6709ZggOrJJhYTHZ2j6r6OtdbPMw7WvA+eirAPCigygf5oFFGaAghoYAdAT3X3vhVaNA0ZzVDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nba1SI4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H005cI3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nba1SI4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H005cI3L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvMhq496196
	for <sashiko-reviews@lists.linux.dev>; Mon, 7 Sep 2026 13:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cv8iJBY4yRE1MEIJdzu8sg2CJmzOwiug90y4Wu/gBog=; b=nba1SI4Of8u2HXcj
	42GXLsEiahTBXSStCf/xp7kjPpEexL541KdjMrtG6IOPX/eqBsjTsgwU2gyxypKq
	UL+foWmbM1m8MBAJ/8RwkMud9gwIWXeQ+gSYb50GuQbhmCuI1NJXt6uc1dqJlK21
	ekjBBqo5vu6ELKq2TzR623ynEzIli0WzsvX126mo7NQc1S/ZAYH0s5UL4kggaN6Z
	S5DAZKM2o6TOlxvHVUzbYF02lXsi97y5AfWZ3uCW6+84sZAuxV9HNRBNuC7uzWBc
	nlFS1wLZex8W7QITEXNNXtDdHBzuovFaXZcfD2k2GToa55PoeBa3pi8z7WcbJS31
	Lg/D9w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8fhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 13:17:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c65cf2e430so978341e0c.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787071; x=1789391871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cv8iJBY4yRE1MEIJdzu8sg2CJmzOwiug90y4Wu/gBog=;
        b=H005cI3LRX6UXZWkT4M3iTQ5DFA+eDnPt0SIzX8SsmtiE9BiZY/gNFEYtj+ReaJpkS
         1CuquWAY6r0O5+q/Y0p6L31j3CgQJQSZc2N7VCtSE7MOeAVLINu7enEZezpkKSa/S3lx
         Qu4IpH/FrE2ESKtsPrWHlL7jhhjsIwfshSpt2k0jcqqGKmiGnvACjZ72CMejy88q0qAK
         hXOrvCXz6XDH9sOhokpmRXvK8EK0IlfY7LipFi6rST3bgH0rKy2LtWt//qzbHeyrGsxN
         wYw2+7Yn3rnbjj8XVX/McjODv2uPqv+faz4FfKtVnEDdqtZ8037Gp38662crloerOxFn
         0V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787071; x=1789391871;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cv8iJBY4yRE1MEIJdzu8sg2CJmzOwiug90y4Wu/gBog=;
        b=Dt8S7+Bk1DqRDj7gm6/YhvLU2wJ42G8YJliO8N/HSLuTo7dAZXi6Y7EICVaQiwyIeT
         9Xyyz5mhWWpK7taQ1oK1L1eNlEfdM4xUDdkfJyCfohfgkLRD+eX4PwKN4JusLYsODEMb
         Sm8rYnj5gJhqT/PFCfBgEm4OIW6llmUapWcGiPV1gJ8+pZCSo8bXAFIwTHAbS4nQunR6
         WzN6/F3lLYV4hmZYYmjjZMQ41xTdw5jfPsigWFSH1+h/O2V6Xt2G/PtF6Ld5z1VDe591
         pMhi2CrmLPtsvVSegZjLcr9UpapUbb7JAYlccwE4mIqd2dr4PDjPR6gW6bZzTfcvn2YG
         wjNw==
X-Gm-Message-State: AFuF++lS/4eiY0NlJyxDftEPMc7I0UDsSHi2iRUL4HNtKUMuH3ajdb00
	9twjxHZJalRw8uLlxNMvcL7BsTJJCe1jal+ogA59CW2+SaXsWcUqCT7KaL1rw6ZjUxnuWA1hxyi
	rJUfjjIS5EXlJhJqVeeVf7eclrafRDNaqkMf516zcoKFEgUnWr6M2dBSd7ASfpbcb2FhQBQFIs2
	tk6wo=
X-Gm-Gg: AYBFou1NOFwpuW7nIY6gov173WpKf0pSOVhRkAejtvMOMmMHORoMSEzFYf6Qxjoc9Rf
	nNOneGiIqj27nJazDTZQVEqLkayB1UhIMNGsC2QiffSOEOs4EepAsifUhZvQcnSWULNLvQH47Cw
	tan3kSdzIMtDyEzipEUMHjp74rKJJFw5300dI9dvzYt0S+TgjXH9WUhIofC+1k5lPzfsfSehknm
	I+cpetTXmNWw/MmmLX+/iekM2V+TbzUbAWtPAr5SeZJaHWLYIxi+XPxXSvsyBrKF3v5O6tT2E8n
	YQGxlBIi/9nhKzptzgX3Kgsdh0NCA6KzgvRuhefAMcl3MG8oN84l4zABXoZE+SnX6JUOAc+XLXH
	ehPfs0NBn9n2FDjbmubMsZrYSu45V
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr6716242137.0.1788787070465;
        Mon, 07 Sep 2026 06:17:50 -0700 (PDT)
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr6716221137.0.1788787069974;
        Mon, 07 Sep 2026 06:17:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm428999765e9.14.2026.09.07.06.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:17:49 -0700 (PDT)
Message-ID: <907b3c02-5487-4abe-9e4c-3053ab92cb7c@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:17:47 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        conor+dt@kernel.org, robh@kernel.org
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
 <20260907-drm-msm-hdmi-fixes-before-eliza-v2-1-b097cf1eac77@oss.qualcomm.com>
 <20260907130633.E673D1F00A3A@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907130633.E673D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfXxpQxOVuU6r8K
 eBPiJb9yAqx7s4Noe4W0A5T4UaExaL6gUlLwasYCFpBWyRXwnUYzym9i8thf4/anxpVLEpVOYX0
 1fTIo4gF3WS4PspUKL2gsbr0sFcY4iY=
X-Proofpoint-GUID: AtcpqU-vG-4k_fURDVQygyhhnWmUxDhQ
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eb97f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: AtcpqU-vG-4k_fURDVQygyhhnWmUxDhQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NyBTYWx0ZWRfXzTbWYE5VifzO
 SlxgZOVbxnB+KDSgSvjOhhu4NbKdpgiBAJm4pvesgnEeHrbsPg3apu3MY5kPecgw+QDoOEfYGgx
 v+UzUTxVZ4aqosO2ZJuDgslc1a8jDe0j4WZNv5J+JohdOnnZMeByxhpsYuNB+EdcvAF1KHHZRUP
 HjOX4+JJisSA4ysrfV73x7bmaCv3zm2KGn3VUPZBCXhOq2Vb2ZOxt60Slfj4JrFio5LW38KvSpo
 uTNoAHivvvBxZyqT6+LeS4fMvbGGt/aBBcA8eElvgY7HhlfHFSWuK0Uygf+ZpRD+6cRSM6zyITj
 /Xbp6GRgFxOEmjk+zk8mFz3PJry7lVEtkCRC0pfs9ZIZWbJkfEBkNzvdUeFiPNgPIll/6mIqPR1
 iSdX8PvHCMUDWJ0+wW8DBxF5p2+nHkJ6ILTKhkQovOBJtRNhqxNOhAPJm/aSZXV7ud0+FQ4Oa8T
 LH7rM6I+oat8CFrQSSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070147

On 07/09/2026 15:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing regulator disable on the newly added clock enablement error path.
> --
> 

ack

Best regards,
Krzysztof
