Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCED391E77
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812701; cv=none; b=bxQMAyHp0r/9Hq6uGpS3LYMLBKHFKt7T4gN+dhZr0S3FSL6pjh0JuPvE6AZ6JJ1lR9ZzxOOCGWmOgJHsRm8hcFv+zvvLlMQddtEDH9A4S9sB6Vo+RucdtQlk0Nm8yTvrWewLnav6plpgrR+wF9yo7kbKbhhO4Yai7Oo8WyJXujE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812701; c=relaxed/simple;
	bh=g0bwnkfjqua0BPRSrDs/04aENM72fakz0OA3XwfOguA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tfu1nPqwr/xXa+NY4G2N1MydwinHd69OTN/ueRMCee51llIc36/rKiHsC0hwCrGReM50IKkwmW5FGTZGHrEW5c73A+tDTEYKOpbZgxhBfZlaVV2HqM4s6KUCs3hXbQS9gah2i4wCN5WYUBfPNShjBVxlBXfvcNNAOTpjPDgz7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnzdUU0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i8kaPSKx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnzdUU0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i8kaPSKx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CVia1096554
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 09:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OmHd1gUsOdvVOeUfz+Z8qzj/dKzvA9ZIbLccHseWvGY=; b=QnzdUU0v0bgPlm1y
	TxvCC5Ine/XNo+MjxkoX8zAmyT3R/v6BIAq7bJ7dcwxJtf635Xf+IwWjFSHlHOZO
	WRQ8S86/zweNAmJhE2AtkpuA1XQ75RZ4jpZfNsar0pVxa7iK9rOYCvJVU46TzZdw
	r0Y6qrwb95XgUFBGrk6YaZrPHJDsWrSTtCghekQ61/ydQx61k5iyFc/xWc2g+J70
	gIWmvebyHm6cewy8U8A6tSJyM0GikMim68Rl40YPyl5PNH1DuZ0suw2AL5bZc6kJ
	NheJU3DclE416fEVHlD4SgB/v9QIRdsM2VYv4uJGNK8txh6UMcNvNAnx0tugmCtX
	VTnNng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gsw1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 09:44:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ca3b3141a6so4295675ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782812699; x=1783417499; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmHd1gUsOdvVOeUfz+Z8qzj/dKzvA9ZIbLccHseWvGY=;
        b=i8kaPSKxI52674WceE/BFSerlmZAuE0MWkXw7JdB4XBivLR/ykPuhprfzWaSAOa4m1
         FrQqtMzcGJ9//ZygXa503U/QOJQDaG96H7A0wExi4Set/b6U4FU5eQmr5BOErEqINKhk
         CmqKSPHJ+UbQ1CwbzZag6iYbCW0Jmi99hWdAPYVA8evxRevPLpj3WgO7BpNiMHZBycNO
         r3PkHA1DIHjhMKJo404xiRTGpjmsg8BO6VYTi5/SMXIQKHfVtbGbPhrEnX1RT4ln2fa/
         2tEuRmNUhxXio7CHnIS0+1wV9PTP/EonW12MGAfLkO0yuHo2zhGk2EgbTzce11Q3YR+k
         2pMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812699; x=1783417499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmHd1gUsOdvVOeUfz+Z8qzj/dKzvA9ZIbLccHseWvGY=;
        b=hFqRyOJEwiJYaPUqikaru11C3QPKjQ4pWt7sKC2m8lfRefznpRTC1MsDzfkws0nKUm
         uKy1P+SeY8Tu3ZVKxVmwcG4JNr5EBFZfXBzXY9mmxuHZMMBX/sBMon0x/+yA2RaEglfh
         mIDrsO/sTH7Tfa4t797G4qouvxJmXzrw/mSp21Ye8K1IM//2Fq0cmFDGj9F6aUaEb/k1
         cycPG/KeJvgAFSqV6B9Kti/BlUGn/SrYMl6/PgCDQWKXH8ax9XrFRzGdapcBF5+qJnHh
         J0jLQsBtdQxNY0To0oQRCYPDvj9L9T8YAZBRzG1oSpFkJVHtNVYrWNHNV73Yc5dTSj+p
         JIqA==
X-Gm-Message-State: AOJu0YwJBXEJcjW66C6pJOyp8rONJDg/Rhl29/FAMDezfTpsaTVqlg5X
	Qkk59Sa2bY9hzigZCfdoSxfTuichZutAwpblUZsNTd+n7mBzpfSfOBYsuRqAA2Z+548xyFjR4W+
	i1NpJS2dx3FwlNVtbmvzrEdLSTHFsEhtQWZiXfOiYxrcQrEXCn/Gzd1JHb5xvphydRwv+UphpE6
	SvO7s=
X-Gm-Gg: AfdE7cmpe3DEUhVNBp7BxyDZ7nIraRYEyrv28xKBOZ3bcgnjDUxaFt4XrtNp83QtHzJ
	TmPh9/ci1xZTmWjSrH+FBA66Jtp818JTo81LX8b9Alu27sZWfYGmTnKUOvQj/tbGlHABgx3hL22
	s5msC1n4DruYrsvXFKVBQr9fpF6hPQmt0SSYgKIG84TOhM6jEllpx6S7xR0s4hTS8eqmrFPSJXy
	N3pP2BnHAvO6HJ2vl3+s39yEkj4KpxylYU3AGLSgsaf2FGJOZPLb/lDFU4LawJeUABTc2BbKODT
	V501FZQM5wfCsf989QAr7T9XwwsHx+Rqihm9BmnKrX3uZkLdUmpB0w21SWIeTmtoWFn8J2NPw/T
	TD806SPYCnfEHmMSrPGwyTF7KDPH8Y9RhSPP2qdKRKQ==
X-Received: by 2002:a17:903:1c1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ca2d52b171mr21136645ad.12.1782812698894;
        Tue, 30 Jun 2026 02:44:58 -0700 (PDT)
X-Received: by 2002:a17:903:1c1:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ca2d52b171mr21136375ad.12.1782812698353;
        Tue, 30 Jun 2026 02:44:58 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382c275asm9651145ad.76.2026.06.30.02.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 02:44:57 -0700 (PDT)
Message-ID: <c23d8b10-8234-49d0-84a9-12bf505a1595@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 15:14:54 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <20260629075921.77EB31F000E9@smtp.kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260629075921.77EB31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfXwo5AWeQxDQ4b
 Ya3KE84VgUXPv0nvaONGf9rmUrIu+BsaA46sbyUGfWleQoVZjJ7eXTs2/ozt7sPFFVB1wu/amhh
 Y5wlMUMvl3YMYhN6gzRgM8Wwlx1e4ZA=
X-Proofpoint-ORIG-GUID: HXfp4cKxi89lGM5IN2YRUkBPSQ-sFSSq
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43901b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=3fPoCKn5AjDgPW2h3HgA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4NyBTYWx0ZWRfX8Z1qnGUlaYAn
 GVQbedwsifmqoDC9z+ZKO0ZllGdoCyOeYb3RhKgHBOszZ7KbJsnEMRqi3fZ1OR1u3IYFEtcTpom
 cmayYultLt4So8QsWyIpeNh7efYGoFXwfk3d5541/Lr+HFw7dWf5EHAZ0SFHAaA0tPqnfdHkMD5
 Ec1uL2+vHFch8vXlo+YN5H3ZkG/GRS6OsJdgWSiLbsjrthhTWhO5s/uNmqPRx4q+cneyG2LTfWa
 Qy/IjCTnlBJVQQqSNam//yHTIVLMvmMYeSFcn32AAj+Elo6UPjCPZl2S66gNj9wwPg9d/QtE87w
 EjglMqFSlQ8Zi4agO+Z9xswn137Dw5h5Ll1TaYpibhe+4Idd3vAcaE0Aool0/UuNycXjixFcwZE
 lu2mvlp+wyCWMDPGSDVOVSsoWQBGtK70mHHQ/Yfje3HkV8M81Z4kBBb3MKrY9pvPdBbs959imcP
 TjrTMTrUYk53PjXdhAA==
X-Proofpoint-GUID: HXfp4cKxi89lGM5IN2YRUkBPSQ-sFSSq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300087

> [Severity: High]
> This is a pre-existing issue, but does adding the power-domains property here
> permanently prevent the SC7280_CX domain from suspending?
> 
> The genpd framework automatically powers on the SC7280_CX domain during the
> qcom-ice driver's probe sequence. However, the qcom-ice driver in
> drivers/soc/qcom/ice.c lacks pm_runtime support.
> 
> Without a call to pm_runtime_enable(), the device's disable_depth remains 1,
> causing pm_runtime_suspended() to unconditionally return false. When
> genpd_power_off() evaluates the domain's state to determine if it can be
> suspended, it sees the qcom-ice device as active and aborts the power-off
> sequence.
> 
> Could this keep the domain active indefinitely and prevent the SoC from
> entering deep sleep states like CX retention or power collapse?

The error reported seems legit.
Adding power-domains property but not implementing pm_runtime ops will
eventually avoid going to power down.
I cross-checked genpd behavior on pakala and observed erroneous behavior.
root@qcom-armv8a:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary |
grep -A 10 "ufs_phy"
gcc_ufs_phy_gdsc                on                              0
    1d88000.crypto             unsupported                      0    SW
    1d84000.ufs                suspended                        0    SW

The fix will be needed in driver and is generic across all platforms
with ufs and sdhc storage.
I will send fix separately for this and not in this series.
-- 
Regards
Kuldeep

