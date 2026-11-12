Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794476526;
	b=lv0Aljuji1j+lyuAiCUpiJlVPKd12F+Mmzr99cg5bbfVv+LyyLH5XQXa5sjAmm0z8u+M
	 aM3R8kJq9Lln38BRh8lslAqgdUKTDmPiLpXKQaYqPzj2B1yloSV0Xtwigtvx2AN3Z3bWF
	 +zcr68q6NZVD7C84d0P2Jmu3p+BOrs7yhgEk5HM41rPDW/MuuW2YpkE0BTVQIkloAGnVS
	 2V909H/AAQxCskyhwDc7/iWcQ05grWrzQmQkkmZpD2m4UOjvjEcZzd6tBGJxH7V0zcEEy
	 JF1Ax4YFRijubiI7DopXiBEcz9uJKoCqaK6NEhyhKIk6ImyW5HvH+BBFjpHC2rbeqGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794476526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nt2xdcrsDBXkfw85VObtuji4vNEs3iCSWZ4QwJDYQYM=;
	b=xsVaujun43cooeL02aDGSVlpLswMuC2JeCZ2SFtF549FksGm6r/CnTxjkXHZbRBNEDKS
	 tcu6Cf7DXfB3vAtUsyCVx1qBv14bdtGdHqZcZY7t7wpg63TUHPdt1CDClsGCNIJGQBMJd
	 FNHnBVIDtCGmwu8kfOfU2dRxSOPQdwjTVcxX2rPuUoLuRb/ierW6Rs3adzJgiKjsCIjPQ
	 AdERSadZf3XVddrbHwvfbSfEtUQt66Ol/ThhaUkLxWLBMrDPbYhkxnJ7bDh4ZEzu817M8
	 5OGfTVZ0MU9hLM35psWby10q+5XSkD1YY8eUYYJE6m/jx5wCK4S6HZIeoDxeJ6sxcIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx3v5crM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuWX58Fy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626D7606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 626D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx3v5crM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NuWX58Fy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9M3dN4092373
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nt2xdcrsDBXkfw85VObtuji4vNEs3iCSWZ4QwJDYQYM=; b=Hx3v5crMD7fZ0tUG
	H6Yd2G2fptq2eQL8VifPCei8qqWNoh0xfSTI/5rrcIHF+pmmO8Gm6QAoXLWqvTWc
	gJPJzgLTZYlxF/I47Kv8pMbEVgT0etivLOdubn2SSAfIjgk79Bc95Smjf8YfvITn
	Tg29Ef41AcWVR5Y1n0WRx+HddvmPLmw8gPfo4W0cwHDBIoq5jBPBtSuYK0OFrG+1
	UN1bc892SzAqaS4VEAGB35jkrGO0SnyeBuFeGtLRTJViOdqAua31gpAXp5sXcdfY
	y0DoXhbULxMHMvtsnS5PseH920Aa4XLSafrcqOVS1dc4YeBGmJNpt94waLmisrHP
	ifPutQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8j7qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 09:42:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08b07232so38811365ad.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 01:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794476525; x=1795081325; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nt2xdcrsDBXkfw85VObtuji4vNEs3iCSWZ4QwJDYQYM=;
        b=NuWX58FyLlV/Yltw9GSbqoJfEkyspgO40K0iQshZEoDz2WojZmdIfqH9NJmf4COo5y
         4+jQZWlWgrmJomDXxn5BxoguUVZbqiHU+lCP5jY/WpJ4SsguEtJvldinD9bar37AXbod
         quzxa93+0E8LNeKLkowc8MW9z8p6gbJ47GNuLOB99FHc3rlqMXjz8IgQKe2EJ565G30P
         iEa1aXDFcEf9jYgw56+Qqp37r2DEdXaJ9w6IppKjHQ0TCVrRVdc9D/on/M2IlqGOP1xs
         ajXdDs8DAX34qDIFjLYO8UtcFd/va0Huo6qSQM6BSlt9/BcVqaxA0ZCpmszFUQnyUypZ
         iQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794476525; x=1795081325;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nt2xdcrsDBXkfw85VObtuji4vNEs3iCSWZ4QwJDYQYM=;
        b=kXeBZ3uNUOOHll+cPc1aiYuwPqlmj8NxhTYJE4Qqxj5FZtuD81kUVlE9/7GV5Z45qG
         XeQTLlKX6PMogevsfNLMiRUtx2+3cF6i1uFjGac2OJkZC09loTQtuGycedQPbystE3gE
         JHgoIcSbh3HkK6M3pJHdUjflk0S6+BJMdsPTUrRabETsgZC9kc3s8+7iQd6NEdysCp6H
         h/TMZaL8AzoVHqH0uFymDn01OOs/oX6lZrO0Zgkigt27s6axy6HgGP02pkMdAkHdhKFc
         t7niZFELZWW81x6iyMblxoRwIfy8FC1yV3dzf2FF/w9ID2rMlk32Q/0Cy2bdX9MgUXrj
         7gyw==
X-Forwarded-Encrypted: i=1; AL+hErFfEzns3l+MoNJ4fKSi4O/TqZEhXjxbbT9xaz1gRqjLQO56nr6WC+Jj/irhKzznL8LES+Y8K6GF+eISQeG4jAI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8LL5BdxS/feM/dNal/TNc4e40WyvOiVeYrLYhWTpzNHD+p/Dn3
	6BkV1OAYfAEiZW7b94ka8Dx2WiEgMKiSxXNbewsrW8LNWbyyncdDKY1jBid9+9aOQx4ltOPX0qX
	fKLEfAHZCvm7UNMKDoLs90GymtvcP3L14SFOQHLXYTPVj6QjSUGPntESjZmfnqTSKPsah8fA=
X-Gm-Gg: AYBFou0DoZ2EfxJ6nh4Tfoldk7ZFbjADcDxDzCbve51Vr6CRq4uSw6Gtixt9iqrGmua
	M9slCM2FkeLqp+djFhclpd3u+PjPnDc/mbSx89UgaCh8k+R3Gor1tw5sOE2iS02vzxI5+gdf9q+
	GcBHsYzl0SgCVVCdu1KIzICYuhldPr8mSe//r8PJvzPF9YRS/uxWHm2KQuOEenvJmsZ0JR5WRnz
	SeZRpI0NR96UUgsqWjLrC/hGceLLUDisycaHOVmhbamH00CmOn/4ZQL+ZqIGP7Lc/0zeQkMoF0u
	wu1ySDgZLaishYBFpyZMU4gh5M4PUS7nGbBzqD3OUVilNV5GRYcDMLdDLSuHPp7s3XJBkWwkL2O
	6HNFoZ8Alv4nzU3H4Yt932GK51u4SmYxbhCVlG7djl5nKeFWBqzt7OsM4zI1WxIcsGf1zsudKps
	OvZtE=
X-Received: by 2002:a17:902:f683:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2edd7aeae6dmr51892285ad.61.1794476524725;
        Thu, 12 Nov 2026 01:42:04 -0800 (PST)
X-Received: by 2002:a17:902:f683:b0:2e8:93b5:c555 with SMTP id d9443c01a7336-2edd7aeae6dmr51892065ad.61.1794476524241;
        Thu, 12 Nov 2026 01:42:04 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7eafbsm30813505ad.36.2026.11.12.01.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:42:03 -0800 (PST)
Message-ID: <c8ec7abb-cd6d-4f27-83b4-bd76a459958f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:11:58 +0530
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
Subject: Re: [PATCH 3/3] soc: qcom: ice: Add runtime PM support
To: Eric Biggers <ebiggers@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
 <20261022-qcom_ice_pm_enable-v1-3-f7a84086c651@oss.qualcomm.com>
 <sashiko-outbox-181342@kernel.org> <20261024183424.GE2553@quark>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261024183424.GE2553@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX5bRkCtwPTJi4
 zf8r+QGdsW32wFQg8rZZN8DxmvFAlO2drZmuqeU4DrCTSFp8oqSrzHNSYDDnvvQThRb6QCGVmcd
 sSw9egrtrwmA5dFln67fHg2c2nITtAo=
X-Proofpoint-GUID: PL1ilC5w35SLlrnxiieCZp0FGxmjscQ4
X-Proofpoint-ORIG-GUID: PL1ilC5w35SLlrnxiieCZp0FGxmjscQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOCBTYWx0ZWRfX8jaPLorBoKCC
 3K0dlYgdAKGkbmNT/wu5INrtha26fmDXVaDG8zmkeAupC5w6mU6cL1tjL7KHQuoVlG2sxLd9EOn
 fZhv0zi1u7iReDhX0DiR+HHSg2MqFDgQG50+LXYoCzDmbMXSFFQQ+tHohNUC5C2rQ/OPecKS4os
 wgCPluabitlwlwXs270RuDq+scvFNFBL8UxwwELpljGP13DGEuUpbMIIa66DRNl2izCX9Uh3y4W
 CdNAQpxjWLE2lhFATNmjZ+Y7hOYJJf1hIGmows8DrWqNyfDcX0cdZZ8VXb8Dmu7hvapXHFT0vfu
 zAzaw1OY8jNF/9RZTIMSMe8lMYVAffEjSFQLnSBtaMlmOnHxBNNRy+LNfaTUseHEPaCUS6yC2cc
 sjQd4TKdyM6Ge2/+iTG91G9I+X5fbfVRneRpyhmKu+kXDF9cOXikNxeF3mq+uyd4xOjU6gyxixS
 8tCzX+QglPzYgXv/ngg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af589ed cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=FQAUsAXO1x4B5DPK-TgA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120038

On 25-10-2026 00:04, Eric Biggers wrote:
> On Thu, Oct 22, 2026 at 10:34:40AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>> - [High] soc: qcom: ice: unclocked MMIO access in qcom_ice_enable() when !CONFIG_PM
>> - [High] soc: qcom: ice: unbalanced runtime PM refcount in qcom_ice_enable()
>> - [High] soc: qcom: ice: clock and runtime PM leak on probe failure or unbind
>> - [High] soc: qcom: ice: broken pm_runtime return handling in qcom_ice_suspend()
>> - [High] soc: qcom: ice: skipped HWKM re-init and unclocked restore across system PM
> 
> I'll review this more carefully once these issues have been addressed.

Sure Eric, sashiko pointed valid issues in current code.
I'll fix in next rev and then please feel free to review.

-- 
Regards
Kuldeep

