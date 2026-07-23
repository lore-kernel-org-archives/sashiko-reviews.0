Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22A40DB3E
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 13:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814622; cv=none; b=RsUcZIyo6QTwuQHs6wV6mm4HPwlOWillhL4vmKYYPOzF983gVnZ26bnVoHSLoQA62nRM9e7MMs6AcrL6+CpzTArG3QYcIW3wBkLr6Aehevlle1aiIyPf3sAVNNmxrWWi027V0CbjiR9w08T1cCagCAwhieSbkBGoaAZm+6VTFqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814622; c=relaxed/simple;
	bh=YRaBNeIx1S/4sMMF51JnkA2gzTr0OUpXrPHghea7WKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tnb2ew8Bx8vkIX3PUJJR71P1dO8oAoojfrJZuRu2zZULDVVNY1qsCFzpJjzBFl++fmh66mpfui2pvZPAQsRCQv8s36nspsYaBygudJb1MQf5DCUJMiWj/L6+dEdWObxlJ4WdcQVNT11t8jm2buTYbY35bjURY/F1Bm40ZMpu6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcRxipyd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKt6Ouwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcRxipyd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKt6Ouwz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCverT038312
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 13:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ECqDrk9Ki/l5BO5SGlWB2epP7rUNWX9qLljGoW4b7Sg=; b=kcRxipydZ41l/UXk
	iKDx/YswFM3h7HLExJuob0Enct7QQetHCjDw3RKwRJiwM9dAtgNlkpNMa12GBwQs
	xc4bgWziyxnL6fYQpvqpGjkhsxoFbLsXHSXQ0pLqVvkg/TwQDT8rufo/ZuH96S5I
	9V78TIxyPTv3PGt7ntTSTaPfPp6sKofmlEWMSWzRB0JAtZ24SY2uatYvdhw2nhR2
	61s2cczU6oltKxJ5nMoGNXtWXeUfnW8JBFSdCeQrRhYO0FAMBn3DBueNca6Keyjj
	d/l99PqK0jpP9YwjjcYgU6StBNi2EoLUi62bvwLvAiy2a5dpD6q9zdR0shQ7paqL
	gjL8tA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc3hv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 13:50:19 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb641eaf5eso903908a34.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784814619; x=1785419419; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECqDrk9Ki/l5BO5SGlWB2epP7rUNWX9qLljGoW4b7Sg=;
        b=gKt6OuwziCiKBzFYJR7FSLuIzh2AwzcJH4Yu6zsNAsrLcPw6/WstC8pc+IzOTmKUVp
         4hc+HD/+FcDLl4UC5VPGguYkKgIClwK1rjjSaVr9SQ/TrVeJh+LMGWInrcQnMF9K0Rc4
         pn0S4z6r4pBi94+fankfUHDhKivZxRgHhMoF0/p70ztJXgnYE0modUsE2GZMwSB0mSqz
         c6jm4VsXaq+abf2z5NRBveSJtDQB2gcMWIvuroK681PW4iJrVC13e3ocQ523VN7ZAqOU
         rniCxFC4NtftyuV9hXaTBmaYDvbvlYD04kpPSFaskku4f/v2CwvKk4/NN8g5sorzia1j
         0MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784814619; x=1785419419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECqDrk9Ki/l5BO5SGlWB2epP7rUNWX9qLljGoW4b7Sg=;
        b=SDAqUMFVpu9HPmfq5/2Thfs2vEDl6hnAz3l0OburF/4IwUM2LnjJlizomJ9g9nWQM1
         GtjeFDl1teB6CP4S/JKG/lhE50bT3F8dXeaCd88ie5Ld4qAo/Ss8hiDFyMqjZWByfXeX
         fc4wLpsVK6JkpuHRr4yK5ytYxoLI1xdFevocl9VPU5Y8O8gtbQUuBFyweIueiIBvL6Dt
         Eg1ckDbXMtokiy8RE9AFMFq2y755xaG2ewyNVhKMaR5NWD8GUoo9E397GoRYPqpCQ42x
         qY7tDPJoieHG9yslAU0ZfgfpryALmZnigDDHuzVga2HqfFIxMD6qPNEzi8i+4/ay1xhD
         KFow==
X-Gm-Message-State: AOJu0Yw0IZAcZgLZYIIb4L4Tw+AFEqOby4ENaS61lMAhrnopc52kULPq
	almgBFiMkr+Umq5DWMqTs0MDBeudHqnaca0DLZwGxwZYpd6Os1zIXrLFdec4BzgHQP3tZhSsET6
	1qzx9WtJC+H7t03t3K/DM3x27chAbeWw/gkqnWV2sg8uGRWNFamb0t3FmKPsLlTVWmNT6YTQ=
X-Gm-Gg: AR+sD11b75vgn2gAEUzBFHV3/UHEkCFecpUI6krGTueDXy7bFtaMhjDUwf0chAcSKUQ
	96FiSlZgtbrLvw854lzBS4QvbitAz8CBNsXeknaMU1WUvfbK8SbVI363ZKryH1Tg0OGU2VpfxlM
	A8PEE7JanZ+O1RD6FVSEaK7mmY13VhHouyqKnSYpcTaBB8638zzOFN6sI2Hu/3/h3KxCYT9fg3Z
	Ah7BFwl2wtYJGnTzo3+uCpLbB5RZd0V6vaa4yinI+Jxa/kZvx37LeaFBDD18rjfQirbvbyJuwHO
	uGh74B0T6/ocEGiNSeRA0VEQ052X67qZBk/PnsltwS4muhd5BNGiteB9cxx5ZP2c3LZig4dBZgg
	vRtyipSLvPg+sbJsqluVxYVBC6ZEorCrq
X-Received: by 2002:a05:6830:440e:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7ee43a44c0fmr2086609a34.3.1784814619074;
        Thu, 23 Jul 2026 06:50:19 -0700 (PDT)
X-Received: by 2002:a05:6830:440e:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7ee43a44c0fmr2086590a34.3.1784814618677;
        Thu, 23 Jul 2026 06:50:18 -0700 (PDT)
Received: from [192.168.1.11] ([106.222.235.129])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29db0d23sm3427753a34.1.2026.07.23.06.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:50:18 -0700 (PDT)
Message-ID: <5fa8ca93-e0b2-458c-8bb0-fb34450d2487@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:20:14 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote thermal
 mitigation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
 <20260721064826.903A91F000E9@smtp.kernel.org>
 <48c3ac2a-ab8e-44c9-9792-f73f88ddb790@oss.qualcomm.com>
 <6xxh5ttpbkfeuqh2uahxtdls6mj2b5pxosfzcmm4grbrujzfms@prxjeh2l2tqv>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <6xxh5ttpbkfeuqh2uahxtdls6mj2b5pxosfzcmm4grbrujzfms@prxjeh2l2tqv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4dGm5CkVYsPGb8oFCabPMXq3ZuZv5R72
X-Proofpoint-GUID: 4dGm5CkVYsPGb8oFCabPMXq3ZuZv5R72
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzNiBTYWx0ZWRfX8SPnIUUCMoX/
 gPHCCYHLmQ/a8a6ssB4KphX7kSFSyXGBPVve0BMDQ2LfZRPmRlvlWnzYBcWcXUtsMNEe6e9L57U
 54txHCfRAZcvUmj67MAu5rTjcgYqFrk=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a621c1b cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=/HV6WY1oXUpe+KOgORLkYw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=793AhHw_EzWDBmsHl04A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzNiBTYWx0ZWRfX8LFFpHP0+urX
 D76OLek7Vxkk4oB4eeG0o77MsqGhuvt0AclY+VP6NUPlcqs3yO1yQ92j/BAnhiVlT62ffAjU2f+
 D011+9tJz9fnSRmEUssX/cMo4bOpugC2pq2CsS1JqaFvD/RbPNfk8SrDTTGfv2psrIOUH5ACnnb
 OmtnvMXq1IcwudvJ2f0AN6Uz1k6IX4rprrDtBHCo/fz6TfPJXs/3X50gtJCgBYwCZeADb0Aq/nu
 vIaZHZNU9LUhHqvTNMEjgFrupBMqke7bG82FfIOnRUj0pAk0OcUccNbfv2hd+0Vq57qe0eSYE12
 9lTEFPYWQSwhUn6sgAWgQyaZIlUdY2x0pnc1ekiveGTlUbK5oOM7XyPgqOU64O2cZpaaz1GK1eZ
 cG4ndtaU+W8ktXu0T/dpNmBqZ80PmljTZlVszYSEiV4kFp0QxtjwK6osZKUqwaJ+J/oteDB6DBz
 kupq6D+LDUuzASV53cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230136



On 7/22/2026 7:03 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 06:55:23PM +0530, Gaurav Kohli wrote:
>>
>>
>> On 7/21/2026 12:18 PM, sashiko-bot@kernel.org wrote:
>>
>>> - [Medium] Improper dependencies prevent COMPILE_TEST coverage and force dependencies to become built-in.
>>
>> The COMPILE_TEST concern is not relevant here. This driver is
>> Qualcomm-specific and depends on ARCH_QCOM.
> 
> A general recommendation is to make drivers available for COMPILE_TEST.

thanks for the suggestion, let me check and update code part to fix this.

> 

